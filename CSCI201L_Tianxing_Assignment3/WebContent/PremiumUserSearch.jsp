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
			console.log(localStorage.getItem("imageURL"));
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
		</script>
		<div class="clear"></div>
		<div id="searchResults">
			<div class="box" id="b0" value="0"></div>
			<div class="box" id="b1" value="1"></div>
			<div class="box" id="b2" value="2"></div>
			<div class="box" id="b3" value="3"></div>
			<div class="box" id="b4" value="4"></div>
			<div class="box" id="b5" value="5"></div>
			<div class="box" id="b6" value="6"></div>
			<div class="box" id="b7" value="7"></div>
			<div class="box" id="b8" value="8"></div>
			<div class="box" id="b9" value="9"></div>
			<div class="box" id="b10" value="10"></div>
			<div class="box" id="b11" value="11"></div>
		</div>
	    <script>
		    var storedData = JSON.parse(localStorage.getItem("database"));
		    sessionStorage.setItem("addon", "");
			console.log(storedData);
		      var j = 0;
		      for(var i=0; i<storedData.users.length; i++){
		    	  console.log(storedData.users[i].username);
		    	  if(storedData.users[i].username.startsWith(<%=session.getAttribute("name")%>) == true){
		    		  //console.log(storedData.users[i].username);
		    		  document.getElementById("b"+j).innerHTML += storedData.users[i].username;
		    		  document.getElementById("b"+j).innerHTML += "<br><a href='PremiumUsers.jsp'><img onerror='javascript:this.src='https://cdn.browshot.com/static/images/not-found.png' onclick='myFunction(" + i +")' src=" + storedData.users[i].imageURL + "></a>";
		    		 
		    		  sessionStorage.setItem("username"+i, storedData.users[i].username);
		    		  sessionStorage.setItem("password"+i, storedData.users[i].password);
		    		  sessionStorage.setItem("imageURL"+i, storedData.users[i].imageURL);
		    		  for(var fo1=0;fo1<storedData.users[i].followers.length;fo1++){
		    			  sessionStorage.setItem("followers"+i+fo1, storedData.users[i].followers[fo1]);
		    		  }
		    		  for(var fo2=0;fo2<storedData.users[i].following.length;fo2++){
		    			  sessionStorage.setItem("following"+i+fo2, storedData.users[i].following[fo2]);
		    		  }	
		    		  sessionStorage.setItem("followerlength"+i, storedData.users[i].followers.length);
		    		  sessionStorage.setItem("followinglength"+i, storedData.users[i].following.length);
		    		  var z = storedData.users[i].library.read.length;
		    		  var favlength = storedData.users[i].library.favorite.length;
		    		  sessionStorage.setItem("readlength", z);
		    		  sessionStorage.setItem("favlength", favlength);
		    		  for(var z1=0;z1<z;z1++){
		    			  sessionStorage.setItem("read"+i+z1, storedData.users[i].library.read[z1]);
		    			  var ns = storedData.users[i].library.read[z1].split(' ').join('+');
		    			  console.log(ns);
		    			  $.ajax({
		  			        type : 'GET',
		  			        dataType : 'json',
		  			      	async: false,
		  			        url: 'https://www.googleapis.com/books/v1/volumes?q=title:' + ns,
		  			        success : function(data) {
		  			            console.log(data.items[0].volumeInfo.imageLinks.smallThumbnail); 
		  			            sessionStorage.setItem("readbookURL"+i+z1, data.items[0].volumeInfo.imageLinks.smallThumbnail);
		  			          	sessionStorage.setItem("readauthors"+i+z1, data.items[0].volumeInfo.authors);
		  			         	console.log("readbookURL"+i+z1);
		  			        } 
		  			    });
		    		  }
		    		  for(var x1=0;x1<favlength;x1++){
		    			  sessionStorage.setItem("favorite"+i+x1, storedData.users[i].library.favorite[x1]);
		    			  var ns = storedData.users[i].library.favorite[x1].split(' ').join('+');
		    			  $.ajax({
			  			        type : 'GET',
			  			        dataType : 'json',
			  			      	async: false,
			  			        url: 'https://www.googleapis.com/books/v1/volumes?q=title:' + ns,
			  			        success : function(data) {
			  			            console.log(data.items[0].volumeInfo.imageLinks.smallThumbnail); 
			  			            sessionStorage.setItem("favbookURL"+i+x1, data.items[0].volumeInfo.imageLinks.smallThumbnail);
			  			         	sessionStorage.setItem("favauthors"+i+x1, data.items[0].volumeInfo.authors);
			  			         	console.log("favbookURL"+i+x1);
			  			        } 
			  			    });
		    		  }
		    		  j++;
		    	  }
		      }
		      document.logo.hiddenValue.value = localStorage.getItem("database");
		      
		      function myFunction(i){
		    	  sessionStorage.setItem("UserID", i);
		    	  sessionStorage.setItem("profileuser", sessionStorage.getItem("username"+i));
		      } 
		      
	
    </script>   
  
	</body>
</html>