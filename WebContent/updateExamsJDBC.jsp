<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<%
String c=(String)session.getAttribute("c"); 
String courseExamDate = request.getParameter("courseExamDate");
String courseExamTime = request.getParameter("courseExamTime");
String courseExamDuration = request.getParameter("courseExamDuration");
int count=0;

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
    PreparedStatement ps = cn.prepareStatement("update  sAcademicCourseExams set courseExamDate=?, courseExamTime=?, courseExamDuration=? WHERE count Like "+c);
    ps.setString(1,courseExamDate);
    ps.setString(2,courseExamTime);
    ps.setString(3,courseExamDuration);
    ps.executeUpdate();
    
    count=1;
      	
}
catch(Exception e)
{
	System.out.println(e);
}
if(count==1){

	session.removeAttribute("id");
%>
<jsp:include page="exams.jsp"></jsp:include>
		<script type="text/javascript">
    alert("Course Exam Details Updated...........");
    </script>

<% 
}
else{
%>

		<jsp:include page="exams.jsp"></jsp:include>
		<script type="text/javascript">
    alert("Course Exams Details Updated...........");
    </script>
    <%} %>
</body>
</html>