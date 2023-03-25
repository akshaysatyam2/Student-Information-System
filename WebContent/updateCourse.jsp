<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body {
	display: inline-block;
	margin-left: 30%;
	margin-top: 10%;
	background-image:url("smbg.jpg");
}

form {
	height: 330px;
	width: 380px;
	background-color: rgb(106, 106, 245);
	border: 2px solid black;
	padding:15px;
}
h1{
text-align:center;
}
button{
    
    height: 30px;
width:120px;
border-radius: 20px;

}

</style>
</head>
<body><%
String id=request.getParameter("id");
session.setAttribute("id", id);
%>

<form action="updateCourseJDBC.jsp" id="users">
			<h1>
				<u>Update Course Details</u>
			</h1>
			<table>
				<tr>
					<td>Course ID:</td>
					<td><h2><%=id %></h2></td>
				</tr>
				<hr>
				<tr>
					<td>Course Name:</td>
					<td><input type="text" name="cname" ></td>
				</tr>
				<tr>
				<tr>
					<td>Course Price:</td>
					<td><input type="text" name="cprice" ></td>
				</tr>
				<tr>
					<td>Course Duration:</td>
					<td><input type="text" name="cduration" ></td>
				</tr>
				
				<tr>
					<td><button type="reset">Reset</button></td>
					<td><button type="submit">Update</button></td>
				</tr>
			</table>
		</form> 

</body>
</html>