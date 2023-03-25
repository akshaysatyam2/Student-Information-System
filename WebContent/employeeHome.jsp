<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<title>Employee Home</title>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
			
<style>
body {
	margin: 0;
	background-image: url("bg4.avif");
	font-family: 'Times New Roman', Times, serif;
}

.idl { background-color: gray; color: black; padding:
				5px; }

.center {
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
}

#addNotice {
	border: 3px solid black;
	border-radius: 15px;
	background-color: azure;
	padding: 5px;
	font-size: 20px;
}
textarea{
font-size:20px;
font-weight:200;
}
#postNotice{
hight:300px;
width:180px;
font-size:40px;
border-radius:7px 25px 7px 25px;
background-color:gray;
color:black;
box-shadow: 5px 10px whitesmoke;
}
</style>
</head>
<body>

	<%@ include file="employeeNav.jsp" %>



	<h1>
		<center>
			<u>Queries</u>
		</center>
	</h1>
	<div class="container">
				<table class="table table-fluid idl" id="myTable">
					<thead>
						<tr class="idl">
				<th>Serial Number</th>
				<th>Name</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Questions</th>
			</tr>
			</thead>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin",
							"admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery("select * from contact ORDER BY (count)Desc");
					while (rs.next() == true) {
			%>
			<tbody id="qq">
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
			</tr>
			</tbody>
			<%
				}
			%>
				</table>
		<%
			} catch (Exception e) {
				System.out.println(e);
			}
		%>

	</div>
	<br>
	<hr>
	<br>
	<div id="addNotice">
		<form action="addNoticeJDBC.jsp">
			<table>
				<tr>
					<td>
					<center>
					<h2>Enter the message for Notice</h2>
					</center>
					</td>
				</tr>
				<tr>
					<td><textarea rows="8" cols="60" name="notice"></textarea></td>
				</tr>
				<tr>
					<td>
					<center>
						<button type="submit" id="postNotice">Post</button>
						</center>
					</td>
				</tr>
			</table>



		</form>
	</div>

	<br>
	<br>
	
<%@ include file="footer.jsp" %>

	<script>
				$(document).ready(function() { var table =
				$('#myTable').DataTable({ pageLength : 15, lengthMenu :
				[ [ 15, 25, 35 ], [ 15, 25, 35 ] ] }) });
			</script>
	

</body>

</html>