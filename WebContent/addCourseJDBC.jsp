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
String course = request.getParameter("course");
String coursePrice = request.getParameter("coursePrice");
String courseDuration = request.getParameter("courseDuration");
try
    {
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
        PreparedStatement ps = cn.prepareStatement("insert into sAcademicCourse values(NULL,?,?,?)");
        ps.setString(1, course);
        ps.setString(2, coursePrice);
        ps.setString(3, courseDuration);
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
    alert("Course Added...........");
    </script>
    <%
}
else{
	%>
	<jsp:include page="employeeHome.jsp"></jsp:include>
    <script type="text/javascript">
    alert("Course Not Added, try again...........");
    </script>
    <%
}
%>

</body>
</html>