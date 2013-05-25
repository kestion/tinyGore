<?php
session_start();
//error_reporting(0);

include ('libs/smarty/Smarty.class.php');
$smarty = new Smarty;

$link = mysql_connect('localhost', 'root', '') or die("Erreur SQL !<br/>".mysql_error());
$db = mysql_select_db('tiny_gore') or die("Erreur SQL !<br/>".mysql_error());

$user_id = 1;
$pet_id = 1;

/*$lol_test = 42;
$smarty -> assign("lol_test", $lol_test);*/

//Current stats
$pet_query = 'SELECT * FROM tg_pets INNER JOIN tg_users ON tg_pets.user_id=tg_users.user_id WHERE pet_id='.$pet_id;
$pet_ressource = mysql_query($pet_query);
$pet = mysql_fetch_assoc($pet_ressource);
//print_r($pet);
$smarty -> assign("pet", $pet);

$hp_percent = ($pet['hp']*100)/$pet['hp_max'];
$smarty -> assign("hp_percent", $hp_percent);

$next_lvl = $pet['lvl']+1;
//Lvl 5 is max
if ($next_lvl>5)
	$next_lvl=5;
//print_r($next_lvl);
$exp_goal = mysql_fetch_assoc(mysql_query('SELECT exp_needed FROM tg_experience_cap WHERE lvl='.$next_lvl));
$smarty -> assign("exp_goal", $exp_goal);

$exp_percent = ($pet['exp']*100)/$exp_goal['exp_needed'];
$smarty -> assign("exp_percent", $exp_percent);

/////Consummables///
$consum = mysql_query('SELECT * FROM `tg_consummables` LEFT JOIN tg_consum_inventory ON tg_consummables.consum_id = tg_consum_inventory.consum_id');
$my_consum = mysql_query('SELECT * FROM tg_consum_inventory');
$consum_fill = array();
while($row = mysql_fetch_assoc($consum))
{
 	$consum_fill[]=$row;
}
$my_consum_fill = array();
while($row = mysql_fetch_assoc($my_consum))
{
 	$my_consum_fill[]=$row;
}
$smarty -> assign("consum", $consum_fill);
$smarty -> assign("my_consum", $my_consum_fill);

$i = 0;
$smarty -> assign("i", $i);
//////////end of consummables

///New consummables
$con_available_query = ('SELECT * FROM tg_consum_inventory INNER JOIN `tg_consummables` ON tg_consum_inventory.consum_id=tg_consummables.consum_id WHERE user_id='.$user_id.' AND (nbr_object>0 OR nbr_object IS NULL) ORDER BY tg_consummables.consum_type');
$con_available = mysql_query($con_available_query);

$available_list = array();
$consum_id_exception_list = '';
while($row = mysql_fetch_assoc($con_available))
{
 	$available_list[]=$row;
 	$consum_id_exception_list .=' consum_id != '.$row['consum_id'].' AND';
}
$consum_id_exception_list = substr($consum_id_exception_list, 0, -3);
//print_r($consum_id_exception_list);
$smarty -> assign("consum", $available_list);
//The rest
$rest_query = 'SELECT * FROM tg_consummables WHERE '.$consum_id_exception_list.' ORDER BY tg_consummables.consum_type';
$rest = mysql_query($rest_query);
$rest_list = array();
while($row = mysql_fetch_assoc($rest))
{
 	$rest_list[]=$row;
}
$smarty -> assign("consum_rest", $rest_list);
//////end of new consummables


//DISPLAY
$smarty -> display('main.tpl');
?>