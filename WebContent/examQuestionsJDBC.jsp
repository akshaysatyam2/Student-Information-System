<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<%
String c=(String)session.getAttribute("cou"); 
System.out.println(c);
String q1 = request.getParameter("q1");
String q2 = request.getParameter("q2");
String q3 = request.getParameter("q3");
String q4 = request.getParameter("q4");
String q5 = request.getParameter("q5");
int count=0;
if(q1.equals("T")){
	count+=1;
	System.out.println(count);
}
if(q2.equals("T")){
	count+=1;
	System.out.println(count);
}
if(q3.equals("T")){
	count+=1;
	System.out.println(count);
}
if(q4.equals("T")){
	count+=1;
	System.out.println(count);
}
if(q5.equals("T")){
	count+=1;
	System.out.println(count);
}
String res=count+"/5";
System.out.println(res);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
    PreparedStatement ps = cn.prepareStatement("update  scoursetaken set sCourseExamStatus=? where count=?");
    ps.setString(1,res);
    ps.setString(2,c);
    ps.executeUpdate();
    
    count=1;
      	
}
catch(Exception e)
{
	System.out.println(e);
}
if(count==1){
%>
<jsp:include page="studentHome.jsp"></jsp:include>
		<script type="text/javascript">
    alert("Exam Details Updated...........");
    </script>

<% 
}
else{
%>

		<jsp:include page="studentHome.jsp"></jsp:include>
		<script type="text/javascript">
    alert("Exam Details Updated...........");
    </script>
    <%
    } 
session.removeAttribute("c");
    %>
</body>
</html>