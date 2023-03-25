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
String name=request.getParameter("name"); 
String phone=request.getParameter("phone"); 
String email=request.getParameter("email"); 
String questions=request.getParameter("questions"); 
if(questions.isEmpty()==false){

try
    {
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
        PreparedStatement ps = cn.prepareStatement("insert into contact values(Null,?,?,?,?)");
        if(questions!=""||questions!=""){
        ps.setString(1,name);
        ps.setString(2,phone);
        ps.setString(3,email);
        ps.setString(4,questions);
        ps.executeUpdate();
        %>
    	<jsp:include page="home.jsp"></jsp:include>
        <script type="text/javascript">
        alert("Query Posted...........");
        </script>
        <%
        }
        
       
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }
}
else{
	 %>
	<jsp:include page="home.jsp"></jsp:include>
    <script type="text/javascript">
    alert("Query Not Posted, try again...........");
    </script>
    <%
}
    %>
   
</body>
</html>