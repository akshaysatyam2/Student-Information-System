<%@page import="java.sql.*" %>
<html>
<head>
        <style>
            body{
                height: auto;
                width: auto;
                background-color: bisque;
                border: 2px solid black;
            }
        </style>
    </head>
<body>
<%
String c = request.getParameter("c");
String user = request.getParameter("user");
String uspass = request.getParameter("pass");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
    PreparedStatement ps = cn.prepareStatement("select * from auid where user=? and pass=?");
    ps.setString(1,user);
    ps.setString(2,uspass);
    ResultSet rs = ps.executeQuery();
    if(rs.next()==true)
    {
    	session.setAttribute("username", rs.getString(1));
    	%>
    	<jsp:include page="administratorHome.jsp"></jsp:include>
    	<script type="text/javascript">
    alert("WELCOME : <%=rs.getString(1) %>...........");
    </script>
    	<%
    	
    }
    else
    {
    	%>
    	<jsp:include page="home.jsp"></jsp:include>
    <script type="text/javascript">
    alert("WRONG ID OR PASSWORD...........");
    </script>
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