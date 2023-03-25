<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
double coursePricePaid, newCoursePricePaid, coursePricetoPay;
String user, totalCoursePrice;

user = request.getParameter("user");
totalCoursePrice = request.getParameter("totalCoursePrice");
coursePricePaid = Double.parseDouble(request.getParameter("coursePricePaid"));
newCoursePricePaid = Double.parseDouble(request.getParameter("newCoursePricePaid"));
coursePricetoPay = Double.parseDouble(request.getParameter("coursePricetoPay"));

if(coursePricetoPay<newCoursePricePaid ){
	%>
	<jsp:include page="payFees.jsp"></jsp:include>
			<script type="text/javascript">
	    alert("Course Fees Paid Could Not be more than course fee...........");
	    </script>

	<% 
}
else if(newCoursePricePaid<0){
	%>
	<jsp:include page="payFees.jsp"></jsp:include>
			<script type="text/javascript">
	    alert("Course Fees Paid Could Not be less than zero...........");
	    </script>

	<% 
}
else{
	newCoursePricePaid+=coursePricePaid;
String s=String.valueOf(newCoursePricePaid);  


System.out.println("Entered Pay Fees JDBC");
int count=0;
System.out.println(coursePricePaid);


try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
	System.out.println("Connection established");
    PreparedStatement ps = cn.prepareStatement("update  sAcademicCourseFees set totalCoursePrice=?, coursePricePaid=? where user=?");
    ps.setString(1,totalCoursePrice);
    ps.setString(2,s);
    ps.setString(3,user);
    ps.executeUpdate();
    System.out.println("Statement Exucuted");
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
    alert("Course Fees Paid...........");
    </script>

<% 
}
else{
%>

		<jsp:include page="studentHome.jsp"></jsp:include>
		<script type="text/javascript">
    alert("Course Fees could  not be paid...........");
    </script>
    <%
    }
}
%>
</body>
</html>