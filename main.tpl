<!DOCTYPE html>
<html lang="fr">	
	<head>
		<title>Tiny Gore</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" /> <!-- WHY NOT charset=utf-8 ? -->
		<!-- <meta http-equiv="Content-Language" content="fr" /> -->
		<meta name="author" content="Ekaterina Johnston" />
		<link rel="stylesheet" type="text/css" href="style.php" media="screen" />
		
		<style type="text/css">
			#div_happiness { width: {$pet.happiness}% ;}
			#div_food { width: {$pet.food}% ;}
			#div_hygiene { width: {$pet.hygiene}% ;}
			#div_hp{ width: {$hp_percent}% ;}
			#div_energy { width: {$pet.energy}% ;}
			#div_exp { width: {$exp_percent}% ;}
		</style>
		<link rel="shortcut icon" href="assets/happiness.png" type="image/x-icon" />
    	<link rel="icon" href="assets/happiness.png" type="image/x-icon" />

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		
		<script src="my_jquery_functions.js"></script>
		<link rel="stylesheet" type="text/css" href="assets/jcarousel/skins/tango/skin.css" />
		<script type="text/javascript" src="assets/jcarousel/lib/jquery.jcarousel.min.js"></script>
		
		<script type="text/javascript">
jQuery(document).ready(function() {
    jQuery('#mycarousel').jcarousel();
});
</script>
		
	</head>
	
	<body>	
	
		<div id="nav">
					<p><a href="#">Customise</a></p>
					<p><a href="#">Shop</a></p>
					<p><a href="#">Arena</a></p>

		<div class="clear"> </div>
				</div>
		<div class="clear"> </div>
	
		<div id="general">
	
		<div id="pub">
			<img src="assets/pub1.jpg" />
		</div>
	
		<div id="wrapper">
	
				<div id="header">
					
					<div class='hidden' id='hidden_user_id'>{$pet.user_id}</div>
					<div class='hidden' id='hidden_pet_id'>{$pet.pet_id}</div>
					<div class='hidden' id='hidden_pet_type'>{$pet.pet_type}</div>
					<div class='hidden' id='hidden_pet_max_hp'>{$pet.hp_max}</div>
					<!-- <div class='hidden' id='hidden_exp_goal'>{$exp_goal.exp_needed}</div> -->

					
					<div id="header_bars" class="header_right">
						<img src="assets/cookie.png" alt="cookie" height="45px" />
						<p>{$pet.cookies}</p>
						
						<div class="clear"> </div>
						
						<img src="assets/hp.png" alt="cookie" height="45px" />
						<p><span id='hp'>{$pet.hp}</span>/{$pet.hp_max}</p>
					</div>
					
					<div id="header_bars" class="header">
						<h1 id="pet_name">{$pet.pet_name}</h1>
						<h2 id="pet_lvl">{$pet.pet_type|ucfirst} Level <span id="lvl">{$pet.lvl}</span></h2>
					</div>
					
					<div id="header_bars" class="header_left">
						<div class="bar_img"><img src="assets/energy.png" alt="cookie" height="45px" /></div>
						<div class="contain energy"><p><div id='div_energy'><span id='energy'>{$pet.energy}</span></p></div></div>
						
						<div class="clear"> </div>
						 
						<div class="bar_img"><img src="assets/food.png" alt="cookie" height="45px" /></div>
						<div class="contain generic"><p><div id ='div_food'><span id='food'>{$pet.food}</span></p></div></div>
						
						<div class="clear"> </div>
						
						<div class="bar_img"><img src="assets/hygiene.png" alt="cookie" height="45px" /></div>
						<div class="contain generic"><p><div id ='div_hygiene'><span id='hygiene'>{$pet.hygiene}</span></p></div></div>
	
						<div class="clear"> </div>
						
						<div class="bar_img"><img src="assets/happiness.png" alt="cookie" height="45px" /></div>
						<div class="contain generic"><p><div id ='div_happiness'><span id='happiness'>{$pet.happiness}</span></p></div></div>
					</div>
					
					<div class="clear"> </div>
				
				</div>
				
				<div id="middle_part">
					<div id="item_informations">
					{foreach from=$consum item=cons}
						<div class="consum_info" id="consum_info{$cons.consum_id}">
								<p class="desc">{$cons.consum_description}</p>
								<div id="item_get">
									{if $cons.food != NULL}
										<img class="lili" src="assets/food.png" /> 
										<p class="wtf">{$cons.food}</p>
									{/if}
									{if $cons.hp != NULL}
										<img class="lili" src="assets/hp.png" /> 
										<p class="wtf">{$cons.hp}</p>
									{/if}
									{if $cons.energy != NULL}
										<img class="lili" src="assets/energy.png" /> 
										<p class="wtf">{$cons.energy}</p>
									{/if}
									{if $cons.happiness != NULL}
										<img class="lili" src="assets/happiness.png" /> 
										<p class="wtf">{$cons.happiness}</p>
									{/if}
									{if $cons.hygiene != NULL}	
										<img class="lili" src="assets/hygiene.png" /> 
										<p class="wtf">{$cons.hygiene}</p>
									{/if}
									{if $cons.exp != NULL}
										<img class="lili" src="assets/xp.png" /> 
										<p class="wtf">{$cons.exp}</p>
									{/if}
									<div class="clear"> </div>
									</div>
						</div>
					{/foreach}
				</div>
				<!-- PET IMAGE -->
					<img id='pet_img' src="assets/chara/{$pet.pet_type}_{$pet.lvl}.png" />
				</div>
	

				

				
	<div class="clear"> </div>
				
					<div id="wrap">
		<ul id="mycarousel" class="jcarousel-skin-tango">
		{foreach from=$consum item=cons}
			{if $cons.consum_type == "food"}
				<li><button class='consummable cons_food' id='{$cons.consum_id}' style="background:url('assets/icons/{$cons.consum_icon}.png') no-repeat; background-size:97px;">
					{$cons.consum_name} <span id='nbr_{$cons.consum_id}'>{$cons.nbr_object}</span>							
				</button></li>
					{elseif $cons.consum_type == "health"}
				<li><button class='consummable cons_health' id='{$cons.consum_id}' style="background:url('assets/icons/{$cons.consum_icon}.png') no-repeat; background-size:97px;">
					{$cons.consum_name} <span id='nbr_{$cons.consum_id}'>{$cons.nbr_object}</span>								
				</button></li>
			{elseif $cons.consum_type == "hygiene"}
				<li><button class='consummable cons_hygiene' id='{$cons.consum_id}' style="background:url('assets/icons/{$cons.consum_icon}.png') no-repeat; background-size:97px;">
					{$cons.consum_name} <span id='nbr_{$cons.consum_id}'>{$cons.nbr_object}</span>								
				</button></li>
			{elseif $cons.consum_type == "energy"}
				<li><button class='consummable cons_energy' id='{$cons.consum_id}' style="background:url('assets/icons/{$cons.consum_icon}.png') no-repeat; background-size:97px;">
					{$cons.consum_name} <span id='nbr_{$cons.consum_id}'>{$cons.nbr_object}</span>								
				</button></li>
			{elseif $cons.consum_type == "happiness" }
				<li><button class='consummable cons_happy' id='{$cons.consum_id}' style="background:url('assets/icons/{$cons.consum_icon}.png') no-repeat; background-size:97px;">
					{$cons.consum_name} <span id='nbr_{$cons.consum_id}'>{$cons.nbr_object}</span>								
				</button></li>
			{elseif $cons.consum_type == "action" }
				<li><button class='consummable cons_action' id='{$cons.consum_id}' style="background:url('assets/icons/{$cons.consum_icon}.png') no-repeat; background-size:97px;">
					{$cons.consum_name} 						
				</button></li>
			{/if}
		{/foreach}
		{foreach from=$consum_rest item=cons_r}
			<li><button class='unable' id='{$cons.consum_id}' style="background:url('assets/icons/{$cons_r.consum_icon}.png') no-repeat; background-size:97px;">
				{$cons_r.consum_name}						
			</button></li>
		{/foreach}
		  </ul>
	</div>
	
	<div class="clear"> </div>
	
			
				<div class="clear"></div>
				
				
		</div> <!-- end of wrapper -->
		<div id="pub">
			<img src="assets/pub2.jpg" />
		</div>
		
		<div class="clear"> </div>
	</div>
		<p> 
				<div id="init_exp"><div id="div_exp">
							<span id="exp">{$pet.exp}</span>/<span id="exp_goal">{$exp_goal.exp_needed}</span></p>
						</div></div>

	

	</body>
	
</html>