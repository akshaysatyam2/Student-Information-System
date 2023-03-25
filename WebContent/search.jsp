<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Result</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  margin: 0;
  padding:0px;
  background-image:url("bg4.avif");
  font-family: 'Times New Roman', Times, serif;
}

.topnav {
	overflow: hidden;
	background-color: gray;
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
	background-color: white;
	color: grey;
}

.topnav .icon {
	display: none;
}

.topnav .search-container {
	float: right;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
}

.topnav .search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

.dropdown {
	float: left;
	overflow: hidden;
}

.dropdown .dropbtn {
	font-size: 17px;
	border: none;
	outline: none;
	color: whitesmoke;
	padding: 14px 16px;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.topnav a:hover, .dropdown:hover .dropbtn {
	background-color: #555;
	color: white;
}

.dropdown-content a:hover {
	background-color: #ddd;
	color: black;
}

.dropdown:hover .dropdown-content {
	display: block;
}

@media screen and (max-width: 750px) {
	.dropdown .dropbtn {
		display: none;
	}
	.topnav a:not(:first-child) {display: none;}
	.topnav a.icon {
		float: right;
		display: block;
	}
}


@media screen and (max-width: 750px) {
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
	.topnav.responsive .dropdown {
		float: none;
	}
	.topnav.responsive .dropdown-content {
		position: relative;
	}
	.topnav.responsive .dropdown .dropbtn {
		display: block;
		width: 100%;
		text-align: left;
	}
}


.mainBody{
padding:10px;
margin:10px;
}

footer {
    position: relative;
            background-color: darkgray;
            width: 100%;
            color: black;
            height: 100px;
            bottom: 0px;
            z-index: 2;
        }

        footer h2 {
            text-align: right;
            left: 70%;
            bottom: 5px;
            padding-right: 3px;
        }
        table, tr, td{
        background-color:azure;
        padding:10px;
        margin-left:auto;
        margin-right:auto;
        }
</style>

</head>
<body>
<div class="topnav" id="myTopnav">
		<a class="active">Search</a>
		<a href="employeeHome.jsp">Employee Home</a>
		
		<div class="dropdown">
			<button class="dropbtn">
				Show <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="showStudent.jsp">Show Students</a>
			</div>
		</div>
		
		<div class="dropdown">
			<button class="dropbtn">
				Add <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="addStudent.jsp">Add Student</a> 
				<a href="addCourse.jsp">Add Course</a> 
			</div>
		</div>
		
		<a href="home.jsp">Logout</a>
		
		<a href="javascript:void(0);" class="icon"
			onclick="myResponsiveFunction()"> <i class="fa fa-bars"></i>
		</a>
	</div>


<div class="mainBody">

	<h1><center><u>Student Details:-</u></center></h1>
	<table border="3px solid black">
	<tr>
		<td>Username</td>
		<td>First Name</td>
		<td>Last Name</td>
		<td>Phone Number</td>
		<td>Email Address</td>
		<td>DOB</td>
		<td>Gender</td>
		<td>Total Course Price</td>
		<td>Course Price Paid</td>
	</tr>
		<%
		String search = request.getParameter("search");
		String command="SELECT sDetails.user, sFirstName, sLastName, sPhoneNumber, sEmailAddress, sDOB, sGender, totalCoursePrice, coursePricePaid FROM sDetails INNER JOIN sAcademicCourseFees ON sDetails.user = sAcademicCourseFees.user where sDetails.user=\""+search+"\"";
		
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin", "admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery(command);
					while (rs.next() == true) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getString(9)%></td>
			</tr>

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

<div class="mainBody">

	<h1><center><u>Courses Taken :-</u></center></h1>
	<table border="3px solid black">
	<tr>
		<td>Username</td>
		<td>Course ID</td>
		<td>Course Name</td>
		<td>Course Price</td>
		<td>Course Duration</td>
	</tr>
		<%
		
		String command2="SELECT user, courseID, sAcademicCourse.courseName, coursePrice, courseDuration FROM sAcademicCourse INNER JOIN sCourseTaken ON sAcademicCourse.courseName = sCourseTaken.courseName where sCourseTaken.user=\""+search+"\""; 
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin", "admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery(command2);
					while (rs.next() == true) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
			</tr>

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
<footer>
    <h2>
        &copy; Copyright Rights<br>
        Author: Akshay Kumar<br>Email ID: <a href="akshay.k@quadwave.com" target="_blank">akshay.k@quadwave.com</a>
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