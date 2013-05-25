/*  beforeSend: function ( xhr ) {
    xhr.overrideMimeType("text/plain; charset=x-user-defined");
  }*/

 /*$(function(){*/

//Consummable buttons
$(document).ready(function(){
	$(".consummable").click(function (){
		// alert('this is a function for class consummable...');
		var id = (this).id;
		/*rewrite in jQuery syntax*/
		var pet_id = document.getElementById("hidden_pet_id").innerHTML;
		var pet_type = document.getElementById("hidden_pet_type").innerHTML;
		var user_id = document.getElementById("hidden_user_id").innerHTML;
		var pet_max_hp = document.getElementById("hidden_pet_max_hp").innerHTML;
		var exp_goal = document.getElementById("exp_goal").innerHTML;
		$.ajax({
		  type : "POST",
		  url: "update.php",
		  data: {'consum_id' : id, 'pet_id' : pet_id, 'user_id' : user_id, 'pet_max_hp' : pet_max_hp, 'exp_goal' : exp_goal},
		}).done(function ( data ) {
		/*  if( console && console.log ) {
		    console.log("Sample of data:", data.slice(0, 100));}*/

		    /*$("#test").html(data);*/

		   data = $.parseJSON(data);
		   var hp_percent = (data['hp']*100)/pet_max_hp;
		   var exp_percent = (data['exp']*100)/exp_goal;
		   //dexp exp_goal lvl
		   $("#food").html(data['food']);
		   $("#div_food").animate({width: data['food']+'%',}, 700 );
		   $("#hp").html(data['hp']);
		   $("#div_hp").animate({width: hp_percent+'%',}, 700 );
		   $("#exp").html(data['exp']);
		   //Diing
		   $("#exp_goal").html(data['exp_goal']);
		   $("#lvl").html(data['lvl']);
		   /*LF fade effect for image swapping*/
		   $("#pet_img").attr('src', 'assets/chara/'+pet_type+'_'+data['lvl']+'.png').fadeIn(500);
		   //
		   $("#div_exp").css('width', exp_percent+'%');
		   $("#energy").html(data['energy']);
		   $("#div_energy").animate({width: data['energy']+'%',}, 700 );
		   $("#hygiene").html(data['hygiene']);
		   $("#div_hygiene").animate({width: data['hygiene']+'%',}, 700 );
		   $("#happiness").html(data['happiness']);
		   $("#div_happiness").animate({width: data['happiness']+'%',}, 700 );
		   
		   var cons_nbr = '#nbr_'+id;
		   //console.log(cons_nbr);
		   $(cons_nbr).html(data['consum_number']);
		   if ((data['consum_number']==0)||(data['consum_number']!=NULL)) /*Used up consummables*/
		   	{
		   		// location.reload(); /*old cheat fix*/
				$('#'+id).attr('disabled', 'disabled'); /*new fix*/
				//$('#'+id).unbind('click'); /*another possible fix fix*/

				// $('#'+id).removeClass().addClass("unable");
				// $('#'+id).click(function (){alert('You have no more. You can buy more in the SHOP');});	
		  		// $(cons_nbr).html('');
		   	}
		});
	});
	//Tooltips
	$(".consummable").mouseover(function (){
		$(".consum_info").hide();
		var id = (this).id;
		var consum = "#consum_info"+id;
		$(consum).show();
	});	
});

