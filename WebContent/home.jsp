<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>Home</title>
<style>
body {
	margin: 0;
	background-image: url("bg4.avif");
	font-family: 'Times New Roman', Times, serif;
}

.topnav {
	overflow: hidden;
	background-color: gray;
	z-index: 2;
}

.topnav a {
	float: left;
	display: block;
	color: whitesmoke;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: whitesmoke;
	color: black;
}

.topnav a.active {
	background-color: gainsboro;
	color: black;
}

.topnav .icon {
	display: none;
}

@media screen and (max-width: 730px) {
	.topnav a:not(:first-child)
	 {
	 display: none;
	 }
	.topnav a.icon {
		float: right;
		display: block;
	}
}

@media screen and (max-width: 730px) {
	.topnav.responsive {
		position: relative;
	}
	.topnav.responsive .icon {
		position: absolute;
		right: 0;
		top: 0;
	}
	.topnav.responsive a {
		float: none;
		display: block;
		text-align: left;
	}
}

#leftSideBar {
	border: 3px solid black;
	display: block;
	border-radius: 15px;
	background-color: antiquewhite;
	width: 205px;
	text-align: justify;
	margin: 2px;
	padding: 4px;
}

.mainBody {
	display: block;
	border: 3px solid black;
	top: 0%;
	border-radius: 15px;
	background-color: antiquewhite;
	text-align: justify;
	margin: 2px;
	padding: 4px;
}

footer {
	position: relative;
	background-color: darkgray;
	width: 100%;
	color: black;
	height: 120px;
	bottom: 0px;
	z-index: 2;
}

footer h2 {
	position: absolute;
	text-align: right;
	left: 70%;
	bottom: 5px;
	padding-right: 3px;
}

table, tr, td {
	padding: 5px;
	border-radius: 10px;
}
</style>
</head>
<body>

	<div class="topnav" id="myTopnav">
		<a class="active">Student Information System</a> 
		<a href="studentLogin.html">Student Login</a> 
		<a href="employeeLogin.html">Employee Login</a> 
		<a href="administratorLogin.html">Administrator Login</a>
		<a href="contactUS.html">Contact Us</a> 
		<a href="javascript:void(0);" class="icon" onclick="myResponsiveFunction()"> 
			<i class="fa fa-bars"></i>
		</a>
	</div>

	<table>
		<tr>
			<td>

				<div id="leftSideBar">
					<h2>
						<u><center>About</center></u>
					</h2>
					<h3>A student information system (SIS), student management
						system, school administration software or student administration
						system is a management information system for education sector
						establishments used to manage student data. It integrates
						students, parents, teachers and the administration. Student
						information systems provide capabilities for registering students
						in courses; documenting grading, transcripts of academic
						achievement and co-curricular activities, and the results of
						student assessment scores; forming student schedules; tracking
						student attendance; generating reports and managing other
						student-related data needs in an educational institution.</h3>

				</div>
			</td>
			<td>
				
		<div class="mainBody">
	<h1>
		<center>
			<u>Notices:-</u>
		</center>
	</h1>
	<table border="3px solid black">
		<%int c=1;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "root", "admin");
				Statement st = cn.createStatement();
				ResultSet rs = st.executeQuery("select * from Notices ORDER BY (priority)Desc");
				while (rs.next() == true) {
		%>

		<tr>
			<td><%=c%></td>
			<td><%=rs.getString(2)%></td>
		</tr>

		<%
		c++;
			}
		%>
		</table>
		
		<%
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
	</div></td></tr></table>
	

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

</body>

</html>