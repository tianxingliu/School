<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>

	</body>
	<div id="topbar">
		<div id="Libra"><a href="HomePage.html">LibraMate</a></div>
		<div id="searchOption">
			<form name="searchKey" method="GET" action="API" onsubmit="return validate()">
			<div id="bar">
				<input id="ccc" type="text" name="context" placeholder="Please enter here: ">
			</div>
			<div id="leftradio">
				<input id="c1" type="radio" name="choice" value="title" checked>Title<br/>
				<input id="c3" type="radio" name="choice" value="inauthor">Author
			</div>
			<div id="rightradio">
	            <input id="c2" type="radio" name="choice" value="isbn" >ISBN<br/>
	          	<input id="c4" type="radio" name="choice" value="subject">Genre
	         	</div>
	         	<div id="error"></div>
	        </form>   
		</div>
	</div>
	<div id="left">
		<div id= "profilepic">
			<img src="">
		</div>
		<div id="bottommenu">
		
		</div>
	</div>
	<div id="right">
		<div id="upperpart">
		
		</div>
		<div id="lowerpart">
		
		</div>
	</div>
</html>