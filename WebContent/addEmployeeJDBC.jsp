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
int count=0;
String user = request.getParameter("usname");
String  uFirstName= request.getParameter("fname");
String  uLastName= request.getParameter("lname");
String  fatherName= request.getParameter("fatherName");
String  uPhoneNumber= request.getParameter("phone");
String  uEmailAddress= request.getParameter("email");
String  uDOB= request.getParameter("dob");
String  uGender= request.getParameter("gender");
String uspass = request.getParameter("uspass");

try
    {
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
        PreparedStatement ps = cn.prepareStatement("insert into eDetails values(NULL,?,?,?,?,?,?,?,?)");
        System.out.println("ADD USER first part running and date given is "+uDOB);
        ps.setString(1,user);
        ps.setString(2,uFirstName);
        ps.setString(3,uLastName);
        ps.setString(4,fatherName);
        ps.setString(5,uPhoneNumber);
        ps.setString(6,uEmailAddress);
        ps.setString(7,uDOB);
        ps.setString(8,uGender);
        ps.executeUpdate();
        count=1;
        
          	
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }
    try
    {
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
        PreparedStatement ps = cn.prepareStatement("insert into euid values(?,?)");
        ps.setString(1, user);
        ps.setString(2,uspass);
        ps.executeUpdate();
    	count=2;
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }
    
    
    if (count==2){
    	%>
    	<jsp:include page="administratorHome.jsp"></jsp:include>
        <script type="text/javascript">
        alert("Employee Registered...........");
        </script>
        <%
    }
    else{
    	%>
    	<jsp:include page="administratorHome.jsp"></jsp:include>
        <script type="text/javascript">
        alert("Employee Not Registered, try again...........");
        </script>
        <%
    }
    %>
    

</body>
</html>