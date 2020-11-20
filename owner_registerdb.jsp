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
String status="pending";
PreparedStatement ps = null;
ResultSet rs = null;
		
	try
	{
		
		Connection con = Databasecon.getconnection();
       ps = con.prepareStatement("insert into owner_register(uname,Password,email,dob,place,country,status) values(?,?,?,?,?,?,?)");
		ps.setString(1,a); 
        ps.setString(2,d);
        ps.setString(3,f);
        ps.setString(4,h);
        ps.setString(5,e);
        ps.setString(6,g);
        ps.setString(7,status);
        ps.executeUpdate();%>
 <script>
 alert("Registered Successfully and Master Key is Sent to Your E-mail!\nPlease Check the Email");
 window.location="index.html";
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