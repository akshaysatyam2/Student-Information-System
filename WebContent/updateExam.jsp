<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exams</title>
<script
				src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
				integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
				crossorigin="anonymous">
			</script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
				integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
				crossorigin="anonymous">
			</script>
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
				integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
				crossorigin="anonymous">
			</script>

			<script src="http://code.jquery.com/jquery-3.3.1.min.js"
				integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
				crossorigin="anonymous">
			</script>
			<link rel="stylesheet"
				href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
			<script
				src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
			</script>
			<style type="text/css">
				.idl { background-color: gray; color: black; padding:
				5px; }
			</style>
<style type="text/css">
body {
padding:0px;
margin:0px;
	background-image:url("bg4.avif");
}

form {
display:block;
	height: 310px;
	width: 380px;
	padding:15px;
	margin-left: auto;
	margin-right: auto;
	background-color: bisque;
	border: 2px solid black;
	border-radius:10px;
}
button{
hight:25px;
width:100px;
font-size:15px;
border-radius:10px;
}
.whitesmokeBG{
background-color: whitesmoke;

}
table, tr, td{
padding:10px;
	margin-left: auto;
	margin-right: auto;
}

</style>
</head>
<body>
<%@ include file="employeeNav.jsp" %>
<br><br><br>
 <%
 String c=request.getParameter("count");
 session.setAttribute("c", c);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
	Statement st = cn.createStatement();
	ResultSet rs=st.executeQuery("select * from sAcademicCourseExams WHERE count Like "+c);
    while(rs.next()==true)
    {
 	   %>
	<form action="updateExamsJDBC.jsp">
	<h1><center><u>Update Exam</u></center></h1>
	<table>
	<tr>
	<td>Course Exam Date :</td>
	<td><input type="date" name="courseExamDate" value="<%=rs.getString(3) %>"></td>
	</tr>
	<tr>
	<td>Course Exam Time:</td>
	<td><input type="time" name="courseExamTime" value="<%=rs.getString(4) %>"></td>
	</tr>
	<tr>
	<td>Course Exam Duration:</td>
	<td><input type="time" name="courseExamDuration" value="<%=rs.getString(5) %>"></td>
	</tr>
	
	<td>COURSE:</td>
	
	<td><input type="text" name="courseExamDuration" value="<%=rs.getString(2) %>" readOnly></td>
    	   <%
       }
}
       catch(Exception e)
       {
    	   System.out.println(e);
       }
       %>
       
      <tr>
      <td> <button type="reset">Reset</button></td>
      <td> <button type="submit">SUBMIT</button></td>
      </tr>
      </table>
	</form>
	
	
</body>
</html>