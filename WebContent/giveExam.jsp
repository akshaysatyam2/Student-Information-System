<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Give Exam</title>
</head>
<body>


<%
String c = request.getParameter("c");
String cou = request.getParameter("cn");
String status = request.getParameter("status");
session.setAttribute("cou", cou);
String courseName, courseExamDate;
String courseExamTime, courseExamDuration;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
    PreparedStatement ps = cn.prepareStatement("select * from sAcademicCourseExams where count=? ");
    ps.setString(1,c);
    ResultSet rs = ps.executeQuery();
    while(rs.next()==true)
    {
    	courseName=rs.getString(2);
    	courseExamDate=rs.getString(3);
    	courseExamTime=rs.getString(4);
    	courseExamDuration=rs.getString(5);
    }  	
}
catch(Exception e)
{
	System.out.println(e);
}
if(status.equals("Not Given"))
{
	%>
	<jsp:include page="examQuestions.jsp"></jsp:include>
<script type="text/javascript">
alert("Exam Starts...........");
</script>
	<%
}
else{
	%>
	<jsp:include page="studentHome.jsp"></jsp:include>
<script type="text/javascript">
alert("Can't Start Exam...........");
</script>
	<%
}
%>



</body>
</html>