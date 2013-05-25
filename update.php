<?php
//Mysql Connect
$link = mysql_connect('localhost', 'root', '') or die("Erreur SQL !<br/>".mysql_error());
$db = mysql_select_db('tiny_gore') or die("Erreur SQL !<br/>".mysql_error());

/*$consum_id = 1;
$pet_id = 1;
$user_id = 1;
$pet_max_hp = 1;
$exp_goal = 15;*/

$consum_id = $_POST['consum_id'];
$pet_id = $_POST['pet_id'];
$user_id = $_POST['user_id'];
$pet_max_hp = $_POST['pet_max_hp'];
$exp_goal = $_POST['exp_goal'];

//Fetch pet current stats

$current_pet_query = 'SELECT * FROM tg_pets WHERE pet_id='.$pet_id;
$current_pet_ressource = mysql_query($current_pet_query);
$current_pet = mysql_fetch_array($current_pet_ressource);

//In case of lvling up =>
$new_exp_goal_query = 'SELECT exp_needed FROM tg_experience_cap WHERE lvl='.($current_pet['lvl']+1);
$new_exp_goal_fetch = mysql_fetch_assoc(mysql_query($new_exp_goal_query));
$new_exp_goal = $new_exp_goal_fetch['exp_needed'];

//Consummables
$consum_query = 'SELECT * FROM tg_consummables WHERE consum_id='.$consum_id;
$consum_ressource = mysql_query($consum_query);
$consum = mysql_fetch_array($consum_ressource);

$new_stats = array();
//Consume consumabble items (not actions) from inventory
$new_stats['consum_number'] = NULL;
if ($consum['consum_type'] != 'action')
{
	$consum_nbr_query = 'SELECT * FROM tg_consum_inventory WHERE consum_id='.$consum_id.' AND user_id='.$user_id;
	$consum_nbr_ressource = mysql_query($consum_nbr_query);
	$consum_nbr = mysql_fetch_array($consum_nbr_ressource);
	$old_nbr = $consum_nbr['nbr_object'];
	$new_nbr = $old_nbr-1;
	$new_stats['consum_number'] = $new_nbr;
	$consum_nbr_update_query = mysql_query('UPDATE tg_consum_inventory SET nbr_object='.$new_nbr.' WHERE consum_id='.$consum_id.' AND user_id='.$user_id);
}

//Change stats
$stats = array('food'=>0,'energy'=>0,'hp'=>0,'happiness'=>0,'hygiene'=>0, 'exp'=>0);
$update_set_syntax = '';
foreach ($stats as $stat_name => $stat_value)
{
	$new = ($current_pet[$stat_name] + $consum[$stat_name]);
	//Too low
	if ($new<0)
		$new=0;
	//Too high
	if ($stat_name=='hp')
	{
		if ($new>$pet_max_hp)
			$new = $pet_max_hp;
	}
	elseif ($stat_name=='exp')
	{
		$old = $new;
		if ($new>=$exp_goal)
		{
			///Diing ! $new = spillover exp
			$new = $new-$exp_goal;
		}
	}
	else
	{
		if ($new>100)
			$new=100;
	}

	$new_stats[$stat_name] = $new;
	$update_set_syntax .= (' '.$stat_name.'='.$new.', ');
} 
$update_set_syntax = substr($update_set_syntax, 0, -2);
//Update stats
$pet_update = mysql_query('UPDATE tg_pets SET '.$update_set_syntax.' WHERE pet_id='.$pet_id);

//Lvl & Exp_goal
$new_stats['lvl'] = $current_pet['lvl'];
$new_stats['exp_goal'] = $exp_goal;
//Diing ! (for exp_goal, lvl)
if ($old >= $exp_goal)
{
	$new_stats['exp_goal'] = $new_exp_goal;
	$next_lvl =($current_pet['lvl']+1);
	$new_stats['lvl'] = $next_lvl;
	$next_lvl_exp_goal_fetch = mysql_fetch_assoc(mysql_query('SELECT * FROM tg_experience_cap WHERE lvl='.($next_lvl+1)));
	$next_lvl_exp_goal = $next_lvl_exp_goal_fetch['exp_needed'];
	$new_stats['exp_goal'] = $next_lvl_exp_goal;
	//Update bdd
	$ding_update_query = "UPDATE tg_pets SET `lvl` = '".$next_lvl."' WHERE pet_id=".$pet_id;
	//print_r($ding_update_query);
	$ding_update = mysql_query($ding_update_query);
}


//send all params in table
echo json_encode($new_stats);
?>