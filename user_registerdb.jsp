<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>efficient traceable</title>
</head>
<body>
<%

String name=null,email=null;
String a=request.getParameter("name");
String d=request.getParameter("password");
String f=request.getParameter("email");
String h=request.getParameter("dateofbirth");
String e=request.getParameter("place");
String g=request.getParameter("country");
String i=request.getParameter("access_type");

String status="pending";
String status1="pending";
PreparedStatement ps = null;
ResultSet rs = null;
		
	try
	{
		
		Connection con = Databasecon.getconnection();
        ps = con.prepareStatement("insert into user_register(uname,Password,email,dob,place,country,access_type,public_key,attribute_key) values(?,?,?,?,?,?,?,?,?)");
		ps.setString(1,a); 
        ps.setString(2,d);
        ps.setString(3,f);
        ps.setString(4,h);
        ps.setString(5,e);
        ps.setString(6,g);
        ps.setString(7,i);
      
        ps.setString(8,status);
        ps.setString(9,status1);
        ps.executeUpdate();%>
 <script>
 alert("Registered Successfully\nAttribute Key and Public Key is Sent to Your E-mail");
 window.location="user.jsp";
 </script>
<%
}
catch(Exception e1)
{
out.println(e1.getMessage());
}

%>
</body>
</html>