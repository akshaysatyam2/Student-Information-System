<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Notices</title>
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
 .idl{
   background-color: gray;
   color: black;
   padding: 5px;
 }

</style>

<style>
body {
	margin: 0;
	background-image: url("bg4.avif");
	font-family: 'Times New Roman', Times, serif;
}

.center {
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
}

footer {
	position: relative;
	background-color: darkgray;
	width: 100%;
	color: black;
	height: 170px;
	bottom: 0px;
	z-index: 2;
}

footer h2 {
	position: absolute;
	text-align: right;
	left: 70%;
	bottom: 5px;
	padding: 5px;
}


#addNotice {
	border: 3px solid black;
	border-radius: 15px;
	background-color: azure;
	padding: 5px;
	font-size: 20px;
}
#priority{
width:50px;
}
button{
margin:3px;
}

</style>

</head>
<body>
<%@ include file="employeeNav.jsp" %>
 <div class="container">
 <h1>
		<center>
			<u>Notices:-</u>
		</center>
	</h1>
     
     <table class="table table-fluid idl" id="myTable">
     <thead>
     <tr class="idl">
     <th>S. No.</th>
    <th>Notice</th>
    <th>Priority</th>
    <th>Delete/Re-arrange</th>
    </tr>
     </thead>
     <%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin",
						"admin");
				Statement st = cn.createStatement();
				ResultSet rs = st.executeQuery("select * from Notices ORDER BY (priority)Desc");
				while (rs.next() == true) {
		%>
     <tbody id="qq">
     <tr>
     <td><%=rs.getString(1)%></td>
     <td><%=rs.getString(2)%></td>
     <td>
     <%=rs.getString(3)%>
     
     </td>
     <td><a href="deleteNotice.jsp?count=<%=rs.getString(1) %>"><button type="button"  >Delete</button></a>
     <a href="noticeUp.jsp?count=<%=rs.getString(1) %>&priority=<%=rs.getString(3)%>"><button type="submit"  >Up</button></a>
     <a href="noticeDown.jsp?count=<%=rs.getString(1) %>&priority=<%=rs.getString(3)%>"><button type="submit"  >Down</button></a>
     </td>
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
 </div>
 
 <br>
	<br>
	<footer>
		<h2>
			&copy; Copyright Rights<br> Author: Akshay Kumar<br>Email
			ID: <a href="akshay.k@quadwave.com" target="_blank">akshay.k@quadwave.com</a>
		</h2>

	</footer>

	<script>
		function myResponsiveFunction() {
			var x = document.getElementById("myTopnav");
			if (x.className === "topnav") {
				x.className += " responsive";
			} else {
				x.className = "topnav";
			}
		}
	</script>
 
 <script>
   
  $(document).ready( function () 
  {
  var table = $('#myTable').DataTable( {
    pageLength : 5,
    lengthMenu: [[5, 10, 15], [5, 10, 15]]
  } )
} );
     </script>
 </body>
 </html>