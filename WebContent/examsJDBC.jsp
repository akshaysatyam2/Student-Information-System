<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
int count=0;
String courseName = request.getParameter("courseName");
String courseExamDate = request.getParameter("courseExamDate");
String courseExamTime = request.getParameter("courseExamTime");
String courseExamDuration = request.getParameter("courseExamDuration");
try
    {
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
        PreparedStatement ps = cn.prepareStatement("insert into sAcademicCourseExams values(null,?,?,?,?)");
        ps.setString(1, courseName);
        ps.setString(2, courseExamDate);
        ps.setString(3, courseExamTime);
        ps.setString(4, courseExamDuration);
        ps.executeUpdate();
        count=1;
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }
if (count==1){
	%>
	<jsp:include page="employeeHome.jsp"></jsp:include>
    <script type="text/javascript">
    alert("Exam Added...........");
    </script>
    <%
}
else{
	%>
	<jsp:include page="employeeHome.jsp"></jsp:include>
    <script type="text/javascript">
    alert("Exam Could Not be Added, try again...........");
    </script>
    <%
}
%>

</body>
</html>