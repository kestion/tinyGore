<?php
    header("Content-type: text/css; charset: UTF-8");
?>
/*CSS Reset*/

	/* http://meyerweb.com/eric/tools/css/reset/ 
	   v2.0 | 20110126
	   License: none (public domain)
	*/

	html, body, div, span, applet, object, iframe,
	h1, h2, h3, h4, h5, h6, p, blockquote, pre,
	a, abbr, acronym, address, big, cite, code,
	del, dfn, em, img, ins, kbd, q, s, samp,
	small, strike, strong, sub, sup, tt, var,
	b, u, i, center,
	dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td,
	article, aside, canvas, details, embed, 
	figure, figcaption, footer, header, hgroup, 
	menu, nav, output, ruby, section, summary,
	time, mark, audio, video {
		margin: 0;
		padding: 0;
		border: 0;
		font-size: 100%;
		font: inherit;
		vertical-align: baseline;
	}
	/* HTML5 display-role reset for older browsers */
	article, aside, details, figcaption, figure, 
	footer, header, hgroup, menu, nav, section {
		display: block;
	}
	body {
		line-height: 1;
	}
	ol, ul {
		list-style: none;
	}
	blockquote, q {
		quotes: none;
	}
	blockquote:before, blockquote:after,
	q:before, q:after {
		content: '';
		content: none;
	}
	table {
		border-collapse: collapse;
		border-spacing: 0;
	}
	
/*end  of CSS Reset*/


body {
	background-color: #fff;
	
	width:100%;
	margin:0px !important;
	background-size: 100%;
}

button{
	border:0;
	cursor:pointer;
}
#general{width:100%; margin-left:10.3%;}
#pub{float:left; margin-right:2%; margin-left:2%; width:10.5%; padding-top:8%}
#wrapper {
	background-image:url('assets/bg.jpg');
	float:left;
	background-size:120%;
	background-repeat:no-repeat;
	width: 45%;
	height:100%;
	border: 1px solid #d9d9d9;
	margin:15px auto;
	padding:50px;
	padding-top:25px;
	margin-bottom:0px;
	margin-top:0px;
}

#header {
	width:100%; height:100%;
	padding:25px;
	padding-top:0px;
}

#header_bars {
	margin-left:1.6%;
	margin-right:1.6%;
	float: left;
}

.header_right{width:15.4%; font-size:16px; font-weight:bold;}
.header{width:37%}
.header_left{width:30%;}

#header_bars img{
	float:left;
	margin-right:10px;
}
#header_bars p{
	line-height:48px;
}

#pet_name{
	margin-top:90px;
	text-align:center;
	font-size:50px;
	font-weight:none;
	text-transform:lowercase;
	font-variant:small-caps;
}

#pet_lvl{
	text-align:center;
	font-weight:none;
	font-size:25px;
}

#middle_part {
	width: 100%;
	height: 400px;
	margin-bottom:100px;
	line-height:450px;
	text-align:center;
	font-size:50px;
	float:left;
}

.left {
	float:left;
}
.right {
	float:right;
}
.clear {
	clear:both;
}


.hidden {
	display: none;
}

.consummable, .unable{
	padding:5px;
	width:100px; height:70px; border-radius:15px;
	font-weight:bold;
}

.desc{font-variant:small-caps; }
.lili{height:25px; float:left;}
.wtf{display:inline; float:left; margin-right:15px;}
#item_get{width:25%; margin:auto;}
.consum_info{
	display:none; 
	position:absolute; width:53%;
	font-size:15px;;
	color:#323f1b;
	top:65%;}
.consum_info p{height:20px; font-weight:bold; line-height:20px;}

.unable{border:8px solid #000; text-decoration:line-through; cursor:default;}
.cons_food{border:4px solid #ef3f4a;}
.cons_health{border:4px solid #b2d34f;}
.cons_hygiene{border:4px solid #323f1b;}
.cons_energy{border:4px solid #acc9d4;}
.cons_action{border:4px solid #91aebf;}
.cons_happy{border:4px solid #f58c2a;}

#item_informations{
	
}

.contain{margin-top:3%; width:79%; color:#fff; line-height:25px; text-align:center; font-size:15px;}
.bar_img{
	float:right;
}
.energy{background:#fccd38;}
.generic{background:#d61a58;}

#div_food, #div_hygiene, #div_happiness, #div_hp {
	background: #1e5799; /* Old browsers */
	background: -moz-linear-gradient(top, #1e5799 0%, #96cc79 0%, #8dcc6c 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#1e5799), color-stop(0%,#96cc79), color-stop(100%,#8dcc6c)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #1e5799 0%,#96cc79 0%,#8dcc6c 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #1e5799 0%,#96cc79 0%,#8dcc6c 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #1e5799 0%,#96cc79 0%,#8dcc6c 100%); /* IE10+ */
	background: linear-gradient(to bottom, #1e5799 0%,#96cc79 0%,#8dcc6c 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#1e5799', endColorstr='#8dcc6c',GradientType=0 ); /* IE6-9 */
	border-bottom: 3px solid #83bb55;

/*	width: <?php echo $lol_test; ?>% !important;*/
	height: 25px;
}

#div_energy{
	background:#99d8df;
	border-bottom:3px solid #f6ac4e;
	height: 25px;
}

#div_exp{
	background:#fccd38;
	height:10px;
	width:100%;
	font-size:12px;
	text-align:center;
	color:#bc3f47;
}

#init_exp{
	background:gray;
	height:10px;
	margin:auto;
	margin-top:-1px;
	width:50.2%;}

#nav{
	background:gray;
	margin:auto;
	width:50.3%;
	margin-bottom:-1px;
	text-align:center;
	height:20px;
	line-height:17px;
}
#nav p{display:inline; margin-left:5px; margin-right:5px;}
#nav p a{text-decoration:none; color:#fff;}
#nav p a:hover{color:#f6ac4e;}
#pet_img {
	height:100%;
	width:auto;
	margin: 15% auto;
}