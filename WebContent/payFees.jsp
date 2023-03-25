<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pay Fees</title>
<style type="text/css">
body {
	display: block;
	margin-left: 30%;
	margin-top: 5%;
	background-image:url("bg4.avif");
}

form {
	height: 500px;
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
table, tr, td{
padding:15px;
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
	ResultSet rs=st.executeQuery("select * from sAcademicCourseFees where user=\""+suser+"\"");
	%>
	<form action="payFeesJDBC.jsp">
	<h1><center><u>Pay Fees</u></center></h1>
	<table>
	
	
       <%
       while(rs.next()==true)
       {
    	   double totalCoursePrice=Double.parseDouble(rs.getString(2)),
    			   coursePricePaid=Double.parseDouble(rs.getString(3)),
    			   coursePricetoPay=totalCoursePrice-coursePricePaid;
    	   String user=(String)rs.getString(1);
    	   session.setAttribute("user", user);
    	   %>
    	   
    	   <tr>
    	   <td>Username :</td>
    	   <td><input type="text" value="<%=user %>" name="user" ReadOnly></td>
    	   </tr>
    	   <tr>
    	   <td>Total Course Price :</td>
    	   <td><input type="text" value="<%=totalCoursePrice %>" name="totalCoursePrice" ReadOnly></td>
    	   </tr>
    	   <tr>
    	   <td>Total Course Paid :</td>
    	   <td><input type="text" value="<%=coursePricePaid %>" name="coursePricePaid" ReadOnly></td>
    	   </tr>
    	   <tr>
    	   <td>Total Course Price Need to be Paid :</td>
    	   <td><input type="text" value="<%=coursePricetoPay %>" name="coursePricetoPay" ReadOnly></td>
    	   </tr>
    	   <tr>
    	   <td>Total Course Price being Paid :</td>
    	   <td><input type="text" name="newCoursePricePaid"></td>
    	   </tr>
    	   <tr>
      <td> <button type="reset">Reset</button></td>
      <td> <button type="submit">Pay Fee</button></td>
      </tr>
      </table>
	</form>
    	   
    	   <%
       }
}
       catch(Exception e)
       {
    	   System.out.println(e);
       }
       %>
       
      
	

</body>
</html>