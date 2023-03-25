<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Take Courses</title>
<style type="text/css">
body {
	display: block;
	margin-left: 30%;
	margin-top: 10%;
	background-image:url("bg4.avif");
}

form {
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

 <%
 String suser=(String)session.getAttribute("suser");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
	Statement st = cn.createStatement();
	ResultSet rs=st.executeQuery("select courseName from sAcademicCourse");
	%>
	<form action="takeCourseJDBC.jsp">
	<h1><center><u>Take Course</u></center></h1>
	<table>
	<tr>
	<td>Username :</td>
	<td><u><%=suser %></u></td>
	</tr>
	<tr>
	<td>FATHER NAME:</td>
	<td><input type="text" name="sFatherName"></td>
	</tr>
	
	<td>SELECT COURSE:</td>
	<td>
	<select name="courseName">Choose Course:
	
       <%
       while(rs.next()==true)
       {
    	   %>
    	   
    	   <option value="<%=rs.getString(1) %>" ><%=rs.getString(1) %></option>
    	   
    	   <%
       }
}
       catch(Exception e)
       {
    	   System.out.println(e);
       }
       %>
      </select>
       </td>
       
      <tr>
      <td> <button type="reset">Reset</button></td>
      <td> <button type="submit">SUBMIT</button></td>
      </tr>
      </table>
	</form>
	
	
	
	<h1>
		
			<u>Currently Avilable Courses and its details</u>
		
	</h1>
	<div>
		<table border="2px solid black" class="center whitesmokeBG">
			<tr >
				<td>Course ID</td>
				<td>Course Name</td>
				<td>Course Price</td>
				<td>Course Duration</td>
			</tr>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin",
							"admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery("select * from sAcademicCourse");
					while (rs.next() == true) {
			%>

			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
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

</body>
</html>