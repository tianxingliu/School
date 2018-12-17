<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<style>
		body{
			background-color: #E9ECE5;
		}
		#searchground {
			background-color: #c0dfd9;
			margin-top: 100px;
			margin-bottom: 100px;
			width: 100%;
			height: 800px;
		}
		#searchTerm{
			position: relative;
			top: 300px;
			text-align:center;
		}
		#searchOption{
			top: 230px;
			font: 15px arial, sans-serif;
			position: relative;
			left: 450px;
		}
		#ccc{
			width:500px;
			height:30px;
		}
		p{
			-webkit-text-stroke:initial;
			font-size:64px;
			font-family: cursive;
		}
		#leftradio{
			float: left;
			margin-top:10px;
		}
		#rightradio{
			margin-top:10px;
			margin-left:400px;
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
		</style>
		<title>My First Book Search Engine</title>
		<script>
			function validate(){
				if(document.searchKey.context.value.trim().length == 0){
					document.getElementById("error").innerHTML = "<font color='red'><strong>Please enter something. </strong></font>";
					return false;
				}
				return true;
			}
		</script>
		<script>
			$.ajax({
		        type : 'GET',
		        dataType : 'json',
		        url: 'Assignment3.json',
		        success : function(data) {
		            console.log(data); 
		            localStorage.setItem("database", JSON.stringify(data));
		            
		            
		        } 
		    });
		</script>
	</head>
	<body>
		<div id="searchground">
			<div id="searchTerm">
				<p>LibraMate</p>
			</div>
			<div id="searchOption">
				<form name="searchKey" method="GET" action="API" onsubmit="return validate()">
				<input id="ccc" type="text" name="context" placeholder="Please enter here: "><br/>
				<div id="error"></div>
				<div id="leftradio">
					<input id="c1" type="radio" name="choice" value="title" checked>Title<br/>
					<input id="c3" type="radio" name="choice" value="inauthor">Author
				</div>
				<div id="rightradio">
		            <input id="c2" type="radio" name="choice" value="isbn" >ISBN<br/>
		          	<input id="c4" type="radio" name="choice" value="subject">Genre
	          	</div>
	          	<div class="clear"></div>
		        </form>
	        <div id="logins">
		        <a href="Signup.jsp"><input class="buttons" type="button" name="sign" value="Sign Up"/></a><br/>
	          	<a href="Login.jsp"><input class="buttons "type="button" name="login" value="login"></a><br/>
          	</div>   
			</div>
		</div>
	</body>
</html>