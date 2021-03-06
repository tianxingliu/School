<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style>
		body{
				background-color: #E9ECE5;
			}
			#topbar{
				background-color: #c0dfd9;
				height: 50px;
			}
			#pics{
				float: left;
				width: 500px;
				height: 800px;
				
				padding: 5px;
				margin:10px;
				margin-right: 20px;
			}
			#texts{
				float: left;
				width: 700px;
				
				margin:10px;
				margin-left: 20px;
				padding: 5px;
				height: 800px;		
			}
			img{
				height: 700px;
				width: 533px;
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
			#searchOption{
				font: 15px arial, sans-serif;
				float: left;
				margin-left:50px;
				margin-top:10px; 
			}
			#Libra{
				-webkit-text-stroke: 1px red;
				font-size:32px;
				font-family: cursive;
				float: left;
				margin-left:20px;
			}
			.clear{
				clear:both;
			}
			#error{
				float: left;
				margin-left: 50px;
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
			#left{
				float: left;
				width: 300px;
				border: 1px solid black;
				height: 700px;
				margin: 5px;
			}
			#right{
				float: left;
				width: 1000px;
				border: 1px solid black;
				height: 700px;
				margin: 5px;
			}
			#userprofile img{
				border: 1px solid black;
				border-radius: 50%;
				width: 300px;
				height: 300px;
			}
			#relationships{
				border: 1px solid black;
				margin-top: 10px;
				height: 390px;
			}
			#user-left{
				height: 100px;
				border-bottom: 1px solid black;
				text-align: center;
				font-size: 32px;
			}
			#top{
				height: 100px;
				border-bottom: 1px solid black;
				
			}
			/* Style the tab */
			.tab {
			    overflow: hidden;
			    border: 1px solid #ccc;
			    background-color: #f1f1f1;
			}
			
			/* Style the buttons that are used to open the tab content */
			.tab button {
			    background-color: inherit;
			    float: left;
			    border: none;
			    outline: none;
			    cursor: pointer;
			    padding: 14px 16px;
			    transition: 0.3s;
			}
			
			/* Change background color of buttons on hover */
			.tab button:hover {
			    background-color: #ddd;
			}
			
			/* Create an active/current tablink class */
			.tab button.active {
			    background-color: #ccc;
			}
			
			/* Style the tab content */
			.tabcontent {
			    display: none;
			    padding: 6px 12px;
			    border: 1px solid #ccc;
			    border-top: none;
			}
			.box{
				float: left;
				width: 150px;
				height:220px;
				padding:5px;
				margin:10px;
				border: 1px solid black;
				font-size: 8px;
			}
			.box img{
				width:100px;
				height:150px;
			}
	</style>
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
		
		<div class="clear"></div>
		<div id="mainpart">
			<div id="left">
				<div id="userprofile"></div>
				<div id="relationships">
					<div id="user-left"></div>
					<!-- Tab links -->
					<div class="tab">
					  <button class="tablinks" onclick="openCity(event, 'Following')">Following</button>
					  <button class="tablinks" onclick="openCity(event, 'Followers')">Followers</button>
					</div>
					<!-- Tab content -->
					<div id="Following" class="tabcontent">
					</div>
					
					<div id="Followers" class="tabcontent">
					</div>
				</div>
			</div>
			<div id="right">
				<div id="top">
					
				</div>
				<button onclick="return follow()" id="followbutton">Follow</button>
				<div id="books">
					<div class="tab">
					  <button class="tablinks" onclick="openCity(event, 'reads')">Reads</button>
					  <button class="tablinks" onclick="openCity(event, 'favorites')">Favorites</button>
					</div>
					<div id="reads" class="tabcontent">
						<div class="box" id="r0" value="0"></div>
						<div class="box" id="r1" value="1"></div>
						<div class="box" id="r2" value="2"></div>
						<div class="box" id="r3" value="3"></div>
						<div class="box" id="r4" value="4"></div>
						<div class="box" id="r5" value="5"></div>
						<div class="box" id="r6" value="6"></div>
						<div class="box" id="r7" value="7"></div>
						<div class="box" id="r8" value="8"></div>
						<div class="box" id="r9" value="8"></div>
					</div>
					
					<div id="favorites" class="tabcontent">
						<div class="box" id="f0" value="0"></div>
						<div class="box" id="f1" value="1"></div>
						<div class="box" id="f2" value="2"></div>
						<div class="box" id="f3" value="3"></div>
						<div class="box" id="f4" value="4"></div>
						<div class="box" id="f5" value="5"></div>
						<div class="box" id="f6" value="6"></div>
						<div class="box" id="f7" value="7"></div>
						<div class="box" id="f8" value="8"></div>
						<div class="box" id="f9" value="8"></div>
					</div>
				</div>
			</div>
		</div>
		<script>
			var i = sessionStorage.getItem("UserID");
			var z1 = sessionStorage.getItem("readlength");
			var x1 = sessionStorage.getItem("favlength");
			console.log(x1);
			var storedData = JSON.parse(localStorage.getItem("database"));
			var item;
			for(var j=0;j<storedData.users.length;j++){
				if(storedData.users[j].username == sessionStorage.getItem("profileuser")){
					item = storedData.users[j];
				}
			}
			console.log(item);
			var profileurl = item.imageURL;
			var profilename = item.username;
			document.getElementById("switch").innerHTML += "<a href='Blank1.jsp'><img src= 'https://img.freepik.com/free-icon/group-of-people-in-a-formation_318-44341.jpg?size=338c&ext=jpg'></a>";
			document.getElementById("userpic").innerHTML += "<a href='Personal.jsp'><img src=" + localStorage.getItem("imageURL") + "></a>";
			document.getElementById("userprofile").innerHTML += "<img src=" + profileurl + ">";
			document.getElementById("user-left").innerHTML += "@" + profilename;
			document.getElementById("top").innerHTML += "<h2>" + profilename + "'s Library. </h2>";
			var toFollow = true;
			for(var d=0;d<storedData.users.length;d++){
				if(sessionStorage.getItem("username" + i) == storedData.users[d].username){
					for(var g=0;g<storedData.users[d].followers.length;g++){
						console.log(storedData.users[d].followers[g]);
						if(storedData.users[d].followers[g] == localStorage.getItem("username")){
							toFollow = false;
							break;
						}
					}
				}
			}
			if(toFollow == true){
				document.getElementById("followbutton").innerHTML = "Follow";
			}
			else{
				document.getElementById("followbutton").innerHTML = "Unfollow";
			}
			function follow(){
				if(toFollow == true){
					for(var j=0;j<storedData.users.length;j++){
						if(storedData.users[j].username == sessionStorage.getItem("username" + i)){
							storedData.users[j].followers.push(localStorage.getItem("username"));
							for(var ddd=0;ddd<storedData.users[j].followers.length;ddd++){
								document.getElementById("Followers").innerHTML += "@";
								document.getElementById("Followers").innerHTML += storedData.users[j].followers[ddd];
								document.getElementById("Followers").innerHTML += "<br/>";
							}
							alert("Success");
						}
						if(storedData.users[j].username == localStorage.getItem("username")){
							storedData.users[j].following.push(sessionStorage.getItem("username" + i));
						}
					}
				}
				else{
					for(var j=0;j<storedData.users.length;j++){
						if(storedData.users[j].username == sessionStorage.getItem("username" + i)){
							for(var z1=0;z1<storedData.users[j].followers.length;z1++){
								if(storedData.users[j].followers[z1] == localStorage.getItem("username")){
									storedData.users[j].followers.splice(z1, 1);
									document.getElementById("Followers").innerHTML = "";
									for(var ddd=0;ddd<storedData.users[j].followers.length;ddd++){
										document.getElementById("Followers").innerHTML += "@";
										document.getElementById("Followers").innerHTML += storedData.users[j].followers[ddd];
										document.getElementById("Followers").innerHTML += "<br/>";
									}
									alert("Success.");
								}
							}
						}
						if(storedData.users[j].username == localStorage.getItem("username")){
							for(var z1=0;z1<storedData.users[j].following.length;z1++){
								if(storedData.users[j].following[z1] == sessionStorage.getItem("username" + i)){
									storedData.users[j].following.splice(z1, 1);
								}
							}
						}
					}
				}
				console.log(storedData);
				localStorage.setItem("database", JSON.stringify(storedData));
			}
			
			for(var x=0;x<z1;x++){
				document.getElementById("r"+x).innerHTML += sessionStorage.getItem("read"+i+x);
				document.getElementById("r"+x).innerHTML += "<br/>";
				document.getElementById("r"+x).innerHTML += "<img src=" + sessionStorage.getItem("readbookURL"+i+x) + ">";
				document.getElementById("r"+x).innerHTML += "<br/>";
				document.getElementById("r"+x).innerHTML += sessionStorage.getItem("readauthors"+i+x);
				console.log(sessionStorage.getItem("bookURL"+i+x));
			}
			for(var y1=0;y1<x1;y1++){
				document.getElementById("f"+y1).innerHTML += sessionStorage.getItem("favorite"+i+y1);
				document.getElementById("f"+y1).innerHTML += "<br/>";
				document.getElementById("f"+y1).innerHTML += "<img src=" + sessionStorage.getItem("favbookURL"+i+y1) + ">";
				document.getElementById("f"+y1).innerHTML += "<br/>";
				document.getElementById("f"+y1).innerHTML += sessionStorage.getItem("favauthors"+i+y1);
				
			}
			for(var fo1=0;fo1<item.followers.length;fo1++){
				document.getElementById("Followers").innerHTML += "@";
				document.getElementById("Followers").innerHTML += item.followers[fo1];
				document.getElementById("Followers").innerHTML += "<br/>";
			}
			for(var fo2=0;fo2<item.following.length;fo2++){
				document.getElementById("Following").innerHTML += "@";
				document.getElementById("Following").innerHTML += item.following[fo2];
				document.getElementById("Following").innerHTML += "<br/>";
			}
			/* document.getElementById("Followers").innerHTML += sessionStorage.getItem("addon") ; */
			document.logo.hiddenValue.value = localStorage.getItem("database");
			
			console.log(document.logo.hiddenValue.value);
			function openCity(evt, cityName) {
			    // Declare all variables
			    var i, tabcontent, tablinks;

			    // Get all elements with class="tabcontent" and hide them
			    tabcontent = document.getElementsByClassName("tabcontent");
			    for (i = 0; i < tabcontent.length; i++) {
			        tabcontent[i].style.display = "none";
			    }

			    // Get all elements with class="tablinks" and remove the class "active"
			    tablinks = document.getElementsByClassName("tablinks");
			    for (i = 0; i < tablinks.length; i++) {
			        tablinks[i].className = tablinks[i].className.replace(" active", "");
			    }

			    // Show the current tab, and add an "active" class to the button that opened the tab
			    document.getElementById(cityName).style.display = "block";
			    evt.currentTarget.className += " active";
			}
			
		</script>
	</body>
</html>