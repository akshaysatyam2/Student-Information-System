<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Home</title>

			<link rel="stylesheet"
				href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
				integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
				crossorigin="anonymous">
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
				.idl { 
				background-color: gray; 
				color: black; 
				padding: 5px;
				 }
				 
			</style>
<style type="text/css">
body {
	margin: 0px;
	background-image: url("bg4.avif");
	font-family: 'Times New Roman', Times, serif;
}
</style>
</head>
<body>
<%@ include file="administratorNav.jsp" %>

<div class="container">
 <h1>
		<center>
			<u>Employee Details:-</u>
		</center>
	</h1>
     
     <table class="table table-fluid idl" id="myTable">
     <thead>
     <tr class="idl">
     <th>Username</th>
    <th>Password</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Father's Name</th>
    <th>Phone Number</th>
    <th>Email Address</th>
    <th>Date Of Birth</th>
    <th>Gender</th>
    </tr>
     </thead>
     <%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin",
						"admin");
				Statement st = cn.createStatement();
				ResultSet rs = st.executeQuery("select *  FROM euid INNER JOIN eDetails ON eDetails.user = euid.user");
				while (rs.next() == true) {
		%>
     <tbody id="qq">
     <tr>
     <td><%=rs.getString(1)%></td>
     <td><%=rs.getString(2)%></td>
     <td><%=rs.getString(5)%></td>
     <td><%=rs.getString(6)%></td>
     <td><%=rs.getString(7)%></td>
     <td><%=rs.getString(8)%></td>
     <td><%=rs.getString(9)%></td>
     <td><%=rs.getString(10)%></td>
     <td><%=rs.getString(11)%></td>
     </tr>
     <%
			}
		%>
     </tbody>
     </table>
     <%
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
 </div><br>


<%@ include file="footer.jsp" %>
<script>
				$(document).ready(function() { var table =
				$('#myTable').DataTable({ pageLength : 15, lengthMenu :
				[ [ 15, 25, 35 ], [ 15, 25, 35 ] ] }) });
			</script>
</body>
</html>