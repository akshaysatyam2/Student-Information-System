<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Student</title>
<style>
body {
padding:0px;
margin:0px;
	background-image:url("bg4.avif");
}

form {
display: block;
	margin-left: auto;
	margin-right: auto;
	margin-top: 5%;
	height: 370px;
	width: 380px;
	padding:15px;
	background-color: bisque;
	border: 2px solid black;
	border-radius:10px;
}
button{
hight:25px;
width:120px;
font-size:18px;
border-radius:10px;
}
</style>
</head>
<body>
<%@ include file="employeeNav.jsp" %>
<form action="addStudentJDBC.jsp">
		<h1>
			<center><u>Add Student</u></center>
		</h1>
		<table>
			<tr>
				<td>Username:</td>
				<td><input type="text" name="usname"></td>
			</tr>
			<hr>
			<tr>
				<td>First Name:</td>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lname"></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td>Date Of Birth:</td>
				<td><input type="date" name="dob"></td>
			</tr>
			<tr>
				<td>Gender :</td>
				<td>
				<select name="gender">
 				   <option value="M">Male</option>
  					  <option value="F">Female</option>
  					  
</select>
				</td>
				
			</tr>
			<td>CREATE PASSWORD:</td>
			<td><input type="password" name="uspass"></td>
			</tr>
			<tr>
				<td><button type="reset">Reset</button></td>
				<td><button type="submit">Submit</button></td>
			</tr>
		</table>
	</form>
	
	<br><br>
<%@ include file="footer.jsp" %>

</body>
</html>