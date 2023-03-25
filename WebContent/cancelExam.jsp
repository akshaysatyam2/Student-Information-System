<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
String c=request.getParameter("count");
int count=0;
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin", "admin");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM sAcademicCourseExams WHERE count Like "+c);
count=1;
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
if(count==1){
%>
<jsp:include page="exams.jsp"></jsp:include>
		<script type="text/javascript">
    alert("Course Exam Cancled...........");
    </script>

<% 
}
else{
%>

		<jsp:include page="exams.jsp"></jsp:include>
		<script type="text/javascript">
    alert("Exam Could Not be Cancled...........");
    </script>
    <%} %>
</body>

%>


</body>
</html>