<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Search Result Page</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<style>
			body{
				background-color: #E9ECE5;
			}
			#topbar{
				background-color: #c0dfd9;
				height: 50px;
			}
			#Libra{
				-webkit-text-stroke: 1px red;
				font-size:32px;
				font-family: cursive;
				float: left;
				margin-left:20px;
			}
			#searchOption{
			 	font: 15px, arial, sans-serif;
				float: left;
				margin-left: 50px;
				margin-top:10px; 
			}
			.box{
				float: left;
				width:300px;
				height:400px;
				padding:5px;
				margin:10px;
			}
			#bar{
				float:left;
			}
			#ccc{
				width: 800px;
				height: 25px;
			}
			#leftradio{
				float:left;
				margin-left: 20px;
			}
			#rightradio{
				float:left;
				margin-left: 20px;
			}
			.clear{
				clear:both;
			}
			img{
				margin-left:10px;
				width:250px;
				height:300px;
			}
			#ba{
				margin-left:10px;
				margin-top:10px;
			}
			#bt{
				margin-left:10px;
				margin-top:10px;
			}
			#error{
				float: left;
			}
			a:link{
				text-decoration: none;
			}
			a:visited {
   				 text-decoration: none;
			}
			a:hover {
			    text-decoration: underline;
			}
			#userpic{
				position: absolute;
				right: 150px;
			}
			#userpic img{
				width: 50px;
				height: 40px;
			}
			#switch{
				right: 500px;
				position: absolute;
			}
			#switch img{
				width:40px;
				height:30px;
			}
		</style>
		<script>
			function validate(){
				if(document.searchKey.context.value.trim().length == 0){
					document.getElementById("error").innerHTML = "<font color='red'><strong>Please enter something. </strong></font>";
					return false;
				}
				return true;
			}
		</script>
	</head>
	
	<body>
		<div id="topbar">
			<form name="logo" action="Homepage">
				<input type="hidden" name="hiddenValue"/>  
				<input type="submit" id="Libra" value="LibraMate">
			</form>
			<div id="searchOption">
				<form name="searchKey" method="GET" action="PremiumUserAPI" onsubmit="return validate()">
				<div id="bar">
					<input id="ccc" type="text" name="context" placeholder="Please enter here: ">
				</div>
	          	<div id="switch">
	          		
	          	</div>
	          	<div id="userpic"></div>
	          	<div id="error"></div>
		        </form>   
			</div>
		</div>
		<script>
			document.getElementById("switch").innerHTML += "<a href='Blank1.jsp'><img src= 'https://img.freepik.com/free-icon/group-of-people-in-a-formation_318-44341.jpg?size=338c&ext=jpg'></a>";
			document.getElementById("userpic").innerHTML += "<a href='Personal.jsp'><img src=" + localStorage.getItem("imageURL") + "></a>";
			document.logo.hiddenValue.value = localStorage.getItem("database");
		</script>
		<div class="clear"></div>
		<div id="searchResults">
			No Users Found!
		</div>
	</body>
</html>