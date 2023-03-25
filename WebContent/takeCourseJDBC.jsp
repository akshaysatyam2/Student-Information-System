<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%!
double totalCoursePrice,coursePricePaid;
%>
<%
int count=0;
String suser=(String)session.getAttribute("suser");
String sFatherName = request.getParameter("sFatherName");
String courseName = request.getParameter("courseName");
try
    {
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
        PreparedStatement ps = cn.prepareStatement("insert into sCourseTaken values(null,?,?,?,?)");
        ps.setString(1, suser);
        ps.setString(2, sFatherName);
        ps.setString(3, courseName);
        ps.setString(4, "Not Given");
        ps.executeUpdate();
        count=1;
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }
if (count==1){
	%>
	<jsp:include page="studentHome.jsp"></jsp:include>
    <script type="text/javascript">
    alert("Course Selected...........");
    </script>
    <%
}
else{
	%>
	<jsp:include page="studentHome.jsp"></jsp:include>
    <script type="text/javascript">
    alert("Course Not Selected, try again...........");
    </script>
    <%
}
%>

		<%
		 
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin", "admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery("SELECT * FROM sAcademicCourseFees where user like \"" + suser + "\"");
					while (rs.next() == true) {
						totalCoursePrice=Integer.parseInt(rs.getString(2));
						coursePricePaid=Integer.parseInt(rs.getString(3)); 
				}
			
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
		
		<%
		 double coursePrice;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin", "admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery("SELECT * FROM sAcademicCourse where courseName like \"" + courseName + "\"");
					while (rs.next() == true) {
						coursePrice=Double.parseDouble(rs.getString(3)); 
						totalCoursePrice+=coursePrice;
				}
					
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
	<%
	try
	{
		String totalCoursePrice1=String.valueOf(totalCoursePrice);
		String coursePricePaid1=String.valueOf(coursePricePaid); 
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
	    PreparedStatement ps = cn.prepareStatement("update  sAcademicCourseFees set totalCoursePrice=? where user=?");
	    ps.setString(1,totalCoursePrice1);
	    ps.setString(2,suser);
	    System.out.println(totalCoursePrice1);
	    System.out.println(coursePricePaid1);
	    System.out.println(suser);
	    ps.executeUpdate();
	    
	    count=1;
	      	
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
</div>

</body>
</html>