<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<style>
		body{
			background-color: #E9ECE5;
		}
		#topbar{
			background-color: #c0dfd9;
			height: 50px;
		}
		#title{
			top: 300px;
			text-align:center;
		}
		p{
			-webkit-text-stroke:initial;
			font-size:64px;
			font-family: cursive;
		}
		#Libra{
			-webkit-text-stroke: 1px red;
			font-size:32px;
			font-family: cursive;
			float: left;
			margin-left:20px;
		}
		#error{
			margin-top:5px;
			margin-bottom: 5px;
		}
		.class{
			clear: both;
		}
		#logins{
			margin-top:50px;
			margin-left: 200px;
		}
		.buttons{
			background-color: green;
		}
		#inputs{
			margin-left:600px;
		}
		input{
			width: 500px;
		}
		</style>
		<title>My First Book Search Engine</title>
		<script>
			
			var storedData = JSON.parse(localStorage.getItem("database"));
			console.log(storedData);
			
			function validate(){
				if(document.signup.username.value.trim().length != 0 && document.signup.password.value.trim().length != 0
						&& document.signup.imageURL.value.trim().length != 0){
					document.getElementById("passworderror").innerHTML = "";
					document.getElementById("URLerror").innerHTML = "";
					for(var i=0;i< storedData.users.length; i++){
						if(storedData.users[i].username == document.signup.username.value){
							document.getElementById("usernameerror").innerHTML = "<font color='red'><strong>Username taken. </strong></font>";
							return false;
						}
					}
					var k = new Object();
					k.username = document.signup.username.value;
					k.password = document.signup.password.value;
					k.imageURL = document.signup.imageURL.value;
					var followers = [];
					var following = [];
					k.followers = followers;
					k.following = following;
					var read = [];
					var favorite = [];
					var library = {};
					library.read = read;
					library.favorite = favorite;
					k.library = library;
					storedData.users.push(k);
					/* storedData.users[length].password = document.signup.password; */
					console.log(storedData);
					localStorage.setItem("database", JSON.stringify(storedData));
					localStorage.setItem("username", document.signup.username.value);
					localStorage.setItem("imageURL", storedData.users[i].imageURL);
					return true;
				}
				if(document.signup.username.value.trim().length == 0){
					document.getElementById("usernameerror").innerHTML = "<font color='red'><strong>Please enter something. </strong></font>";	
				}
				else{
					document.getElementById("usernameerror").innerHTML = "";
				}
				if(document.signup.password.value.trim().length == 0){
					document.getElementById("passworderror").innerHTML = "<font color='red'><strong>Please enter something. </strong></font>";	
				}
				else{
					document.getElementById("passworderror").innerHTML = "";
				}
				if(document.signup.imageURL.value.trim().length == 0){
					document.getElementById("URLerror").innerHTML = "<font color='red'><strong>Please enter something. </strong></font>";	
				}
				else{
					document.getElementById("URLerror").innerHTML = "";
				}
				return false;
			}
		</script>
	</head>
	<body>
		<div id="topbar">
			<form name="logo" action="Homepage">
			<input type="hidden" name="hiddenValue"/>  
			<input type="submit" id="Libra" value="LibraMate">
			</form>
		</div>
		<div id="main">
			<div id="test"></div>
			<div id="title">
				<p>LibraMate</p>
			</div>
			<div id="inputs">
				<form name="signup" method="GET" action="Blank.jsp" onsubmit="return validate()">
				<h2>Username</h2>
				<input id="username" type="text" name="username" placeholder="Please enter username here: "><br/>
				<div id="usernameerror"></div>
				<h2>Password</h2>
				<input id="password" type="password" name="password"><br/>
				<div id="passworderror"></div>
				<h2>URL</h2>
				<input id="imageURL" type="text" name="imageURL" placeholder="Please enter URL here: "><br/>
				<div id="URLerror"></div>
				<input type="submit" value="Send Request">
	          	<div class="clear"></div>
	        	</form>
			</div> 
		</div>
		<script>document.logo.hiddenValue.value = localStorage.getItem("database");</script>
	</body>
</html>