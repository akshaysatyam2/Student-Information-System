<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<%
String id=(String)session.getAttribute("id"); 
String cname = request.getParameter("cname");
String cprice = request.getParameter("cprice");
String cduration = request.getParameter("cduration");
int count=0;
System.out.println(id);
System.out.println(cname);
System.out.println(cprice);
System.out.println(cduration);

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
    PreparedStatement ps = cn.prepareStatement("update  sAcademicCourse set courseName=?, coursePrice=?, courseDuration=? where courseID=?");
    ps.setString(1,cname);
    ps.setString(2,cprice);
    ps.setString(3,cduration);
    ps.setString(4,id);
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
<jsp:include page="addCourse.jsp"></jsp:include>
		<script type="text/javascript">
    alert("Course Details Updated...........");
    </script>

<% 
}
else{
%>

		<jsp:include page="addCourse.jsp"></jsp:include>
		<script type="text/javascript">
    alert("Course Details Updated...........");
    </script>
    <%} %>
</body>
</html>