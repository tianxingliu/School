<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Books Page</title>
		<style type="text/css">
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
		 </style>
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		 <script>
			function validate(){
				if(document.searchKey.context.value.trim().length == 0){
					document.getElementById("error").innerHTML = "<font color='red'><strong>Please enter something. </strong></font>";
					return false;
				}
				return true;
			}
			function myFunction() {
			    document.getElementById("myDropdown").classList.toggle("show");
			}

			// Close the dropdown menu if the user clicks outside of it
			window.onclick = function(event) {
			  if (!event.target.matches('.dropbtn')) {

			    var dropdowns = document.getElementsByClassName("dropdown-content");
			    var i;
			    for (i = 0; i < dropdowns.length; i++) {
			      var openDropdown = dropdowns[i];
			      if (openDropdown.classList.contains('show')) {
			        openDropdown.classList.remove('show');
			      }
			    }
			  }
			}
		</script>
	</head>
	<body>
		<div id="topbar">
			<div id="Libra"><a href="HomePage.jsp">LibraMate</a></div>
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
		<div class="clear"></div>
		<div id="searchResult">
			<div id="pics">
				<div id="realpics"></div>
			</div>
			<div id="texts">
				<h1 id="title"></h1>
				<h2 id="author">by </h2>
				<h3 id="publisher">Publisher: </h3>
				<h4>Description: </h4>
				<p id="description"></p>
				<h4 id="rating">Rating: </h4>
			</div>
			<script>
			 var i = sessionStorage.getItem("boxID");
			 document.getElementById("title").innerHTML += sessionStorage.getItem("bookTitle"+i);
			 document.getElementById("author").innerHTML += sessionStorage.getItem("bookAuthor"+i);
			 var pub = sessionStorage.getItem("bookPublisher"+i);
			 if(typeof pub == 'null'){ //how to check for undefined object
				 document.getElementById("publisher").innerHTML += "Publisher not found. ";
			 }
			 else{
				 document.getElementById("publisher").innerHTML += pub;
			 }
			 document.getElementById("description").innerHTML += sessionStorage.getItem("bookDescription"+i);
			 document.getElementById("realpics").innerHTML += "<img src=" + sessionStorage.getItem("bookURL"+i) + ">";
			 var rate = sessionStorage.getItem("bookRate"+i);
			 if(rate == "0"){
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
			 }
			 else if (rate == "0.5"){
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-half-full'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
			 }
			 else if (rate == "1"){
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
			 }
			 else if (rate == "1.5"){
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-half-full'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
			 }
			 else if (rate == "2"){
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
			 }
			 else if (rate == "2.5"){
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-half-full'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";				 
			 }
			 else if (rate == "3"){
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
			 }
			 else if (rate == "3.5"){
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-half-full'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
			 }
			 else if (rate == "4"){
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-o'></span>";
			 }
			 else if (rate == "4.5"){
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star-half-full'></span>";
			 }
			 else if (rate == "5"){
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
				 document.getElementById("rating").innerHTML += "<span class='fa fa-star checked'></span>";
			 }
			 </script>
		</div>
	</body>
</html>