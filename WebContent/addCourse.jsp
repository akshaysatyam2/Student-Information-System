<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Course</title>

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
	height: 200px;
	width: 380px;
	padding:15px;
	background-color: bisque;
	border: 2px solid black;
	border-radius:10px;
}
button{
hight:20px;
width:100px;
font-size:15px;
border-radius:10px;
}
.whitesmokeBG{
background-color: whitesmoke;

}
</style>

</head>
<body>
<%@ include file="employeeNav.jsp" %>
<form action="addCourseJDBC.jsp">
		<h1 >
			<center>
			<u>Add Course</u>
			</center>
		</h1>
		<table>
			<tr>
				<td>Course:</td>
				<td><input type="text" name="course"></td>
			</tr>
			<tr>
				<td>Course Price:</td>
				<td><input type="text" name="coursePrice"></td>
			</tr>
			<tr>
				<td>Course Duration:</td>
				<td><input type="text" name="courseDuration"></td>
			</tr>
			
			<tr>
				<td><button type="reset">Reset</button></td>
				<td><button type="submit">Add Course</button></td>
			</tr>
		</table>
	</form>
	<h1 class="whitesmokeBG">
		
			<u>Currently Avilable Courses and its details</u>
		
	</h1>
		<div class="container">

				<table class="table table-fluid idl" id="myTable">
					<thead>
			<tr >
				<th>Course ID</th>
				<th>Course Name</th>
				<th>Course Price</th>
				<th>Course Duration</th>
				<th>Delete/Update</th>
			</tr>
			</thead>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin",
							"admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery("select * from sAcademicCourse");
					while (rs.next() == true) {
			%>
		<tbody id="qq">
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><a href="deleteCourse.jsp?id=<%=rs.getString(1) %> "><button type="button"  class="delete">Delete</button></a>
					<a href="updateCourse.jsp?id=<%=rs.getString(1) %>"><button type="button"  class="update">Update</button></a>
				</td>
			</tr>
			</tbody>
			<%
				}
			%>
		</table>
		</div>
		<%
			} catch (Exception e) {
				System.out.println(e);
			}
		%>

	<br><br>
<%@ include file="footer.jsp" %>
<script>
				$(document).ready(function() { var table =
				$('#myTable').DataTable({ pageLength : 15, lengthMenu :
				[ [ 15, 25, 35 ], [ 15, 25, 35 ] ] }) });
			</script>
</body>
</html>