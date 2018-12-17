<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Search Result Page</title>
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
				font: 15px arial, sans-serif;
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
				<form name="searchKey" method="GET" action="PremiumAPI" onsubmit="return validate()">
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
	          	<div id="switch">
	          	</div>
	          	<div id="userpic"></div>
	          	<div id="error"></div>
		        </form>   
			</div>
		</div>
		<script>
			document.getElementById("switch").innerHTML += "<a href='Blank.jsp' onclick='return clear()'><img src= 'https://png.icons8.com/metro/1600/book.png'></a>";
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
			console.log(storedData);
	      function handleResponse(response) {
		      for (var i = 0; i <= 11; i++) {
		        var item = response.items[i];
		        // in production code, item.text should have the HTML entities escaped.
		        document.getElementById("b"+i).innerHTML += "<br><a href='PremiumBooks.jsp'><img onclick='myFunction(" + i +")' src=" + item.volumeInfo.imageLinks.smallThumbnail + "></a>";
		        document.getElementById("b"+i).innerHTML += "<div id='bt'>" + item.volumeInfo.title + "</div>";
		        document.getElementById("b"+i).innerHTML += "<div id='ba'>By " + item.volumeInfo.authors + "</div>";
		        sessionStorage.setItem("bookTitle"+i, item.volumeInfo.title);
		        sessionStorage.setItem("bookAuthor"+i, item.volumeInfo.authors);
		        sessionStorage.setItem("bookPublisher"+i, item.volumeInfo.publisher);
		        sessionStorage.setItem("bookDescription"+i, item.volumeInfo.description);
		        sessionStorage.setItem("bookURL"+i, item.volumeInfo.imageLinks.thumbnail);
		        sessionStorage.setItem("bookRate"+i, item.volumeInfo.averageRating);
		      }
		    }
	      function myFunction(i){
	    	  sessionStorage.setItem("boxID", i);
	      }
	      document.logo.hiddenValue.value = localStorage.getItem("database");
    </script>
    
    <script src= <%=session.getAttribute("url") %>></script>
	</body>
</html>