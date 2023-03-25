<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exam</title>
<style type="text/css">
body{
margin:0px;
padding:10px;
background:url("bg4.avif");
}
form{
	border:3px solid black;
	hight:600px;
	width:600px;
	margin-left:auto;
	margin-right:auto;
	border-radius:15px;
	padding:10px;
	background-color:whitesmoke;
	text-align:justify;
}
h1{
text-align:center;
font-size:50px;
background-color:gray;
}
.btn{
item-align:center;
hight:60px;
width:100px;
border-radius:15px;
	padding:10px;
	background-color:white;
	margin-left:20px;
	margin-right:20px;
}
select, option{
padding:10px;
}

option:hover {
      background-color: gray;
    }
</style>
</head>
<body>

<h1>Questions</h1>

<form action="examQuestionsJDBC.jsp">
  <p>1) Which of the following language was developed as the first purely object programming language?
</p>
	<select name="q1" multiple size=3>
			   <option value="T">1) SmallTalk</option>
  			  <option value="F">2) Kotlin</option>
  			  <option value="F">3) Java</option>
</select><br><br>


  <br>  

  <p>2) Who developed object-oriented programming?</p>
 <select name="q2" multiple size=3>
			   <option value="F">1) Dennis Ritchie</option>
  			  <option value="T">2) Alan Kay</option>
  			  <option value="F">3) Andrea Ferro</option>
</select><br><br>
 
  
   <br>  

  <p>3) Which of the following is not an OOPS concept?</p>
  <select name="q3" multiple size=3>
			   <option value="T">1) Exception</option>
  			  <option value="F">2) Polymorphism</option>
  			  <option value="F">3) Abstraction</option>
</select><br><br>
  
  
  <br>  

  <p>4) Which feature of OOPS described the reusability of code?</p>
  <select name="q4" multiple size=3>
			   <option value="F">1) Encapsulation</option>
  			  <option value="F">2) Polymorphism</option>
  			  <option value="T">3) Inheritance</option>
</select><br><br>
 
  
  <br>  

  <p>5) Which of the following language supports polymorphism but not the classes?</p> 
  <select name="q5" multiple size=3>
			   <option value="T">1) Ada programming language</option>
  			  <option value="F">2) C++ programming language</option>
  			  <option value="F">3) C# programming language</option>
</select><br><br>
  
  
  <center>
  <input type="reset" value="Reset" class="btn">
  <input type="submit" value="Submit" id="sub" class="btn">
  </center>
  
  
</form>

<script type="text/javascript">
var count=0;
if (document.getElementById('q1o1').checked) {
	  count++;
	}
if (document.getElementById('q2o2').checked) {
	  count++;
	}
if (document.getElementById('q3o2').checked) {
	  count++;
	}
if (document.getElementById('q4o3').checked) {
	  count++;
	}
if (document.getElementById('q5o1').checked) {
	  count++;
	}
	
	}
</script>

</body>
</html>