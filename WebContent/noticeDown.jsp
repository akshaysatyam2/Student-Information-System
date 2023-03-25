<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<%
int p = Integer.parseInt(request.getParameter("priority"));
String c = request.getParameter("count");
int count=0;
System.out.println(c +p);
String cs=Integer.toString(p-1);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
    PreparedStatement ps = cn.prepareStatement("update  Notices set priority=? where count=?");
    ps.setString(1,cs);
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
<jsp:include page="showNotice.jsp"></jsp:include>
		<script type="text/javascript">
    alert("Notice Re-arranged Downwards...........");
    </script>

<% 

}

else{

%>

		<jsp:include page="showNotice.jsp"></jsp:include>
		<script type="text/javascript">
    alert("Notice could not be Re-arranged Downwards...........");
    </script>
    <%
    
} 
    
    %>
</body>
</html>