<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 730px) {
  .topnav.responsive {position: relative;}
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


.mainBody{
padding:10px;
margin:10px;
}
h1{
background-color: gray;
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
  <a class="active">Student Information System</a>
  <a href="studentHome.jsp">Home</a>
  <a href="takeCourses.jsp">Take Courses</a>
  <a href="payFees.jsp">Pay Fees</a>
  <a href="home.jsp">Logout</a>
  <a href="javascript:void(0);" class="icon" onclick="myResponsiveFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>

<div class="mainBody">

	<h1><center><u>Student Details:-</u></center></h1>
	
		<%
		String suser=(String)session.getAttribute("suser"); 
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin", "admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery("select * from sDetails where user like \"" + suser + "\"");
					while (rs.next() == true) {
			%>
				<table border="3px solid black">
				<tr><td>Username :</td><td><%=rs.getString(2)%></td></tr>
				<tr><td>First Name :</td><td><%=rs.getString(3)%></td></tr>
				<tr><td>Last Name :</td><td><%=rs.getString(4)%></td></tr>
				<tr><td>Phone Numbers :</td><td><%=rs.getString(5)%></td></tr>
				<tr><td>Email Address:</td><td><%=rs.getString(6)%></td></tr>
				<tr><td>Date of Birth :</td><td><%=rs.getString(7)%></td></tr>
				<tr><td>Gender :</td><td><%=rs.getString(8)%></td></tr>
			</table>

			<%
				}
			
			} catch (Exception e) {
				System.out.println(e);
			}
		%>

</div>

<div class="mainBody">

	<h1><center><u>Course Exam Details:-</u></center></h1>
	<table border="3px solid black">
	<tr>
		
		<td>Course Name</td>
		<td>Course Exam Date</td>
		<td>Course Exam Time</td>
		<td>Course Exam Duration</td>
		<td>Course Exam Status</td>
	</tr>
		<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin", "admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery("SELECT * FROM sAcademicCourseExams INNER JOIN sCourseTaken ON sAcademicCourseExams.courseName = sCourseTaken.courseName where user = \"" + suser + "\"");
					while (rs.next() == true) {
			%>
				<tr>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><a href="giveExam.jsp?c=<%=rs.getString(1) %>& cn=<%=rs.getString(6) %>&status=<%=rs.getString(10)%>"><%=rs.getString(10)%></a></td>
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

	<h1><center><u>Choosen Course Details:-</u></center></h1>
	<table border="3px solid black">
	<tr>
		
		<td>courseID</td>
		<td>courseName</td>
		<td>coursePrice</td>
		<td>courseDuration</td>
		<td>user</td>
		<td>sFatherName</td>
	</tr>
		<%
		 double totalFees=0;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin", "admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery("SELECT * FROM sAcademicCourse INNER JOIN sCourseTaken ON sAcademicCourse.courseName = sCourseTaken.courseName where user = \"" + suser + "\"");
					while (rs.next() == true) {
			%>
				<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<% totalFees+=Integer.parseInt(rs.getString(3)); %>
			</tr>

			<%
			System.out.println(totalFees);
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