<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
<head>
<title>Security-as-a-Service</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;
String name = request.getParameter("name");
System.out.println("name="+name);
String password = request.getParameter("password");
System.out.println("password="+password);

session.setAttribute("name",name);
session.setAttribute("password",password);
if((name.equals("cloud"))&(password.equals("cloud")))
{
	response.sendRedirect("cloud_home.jsp");

}
	
	else{
		%>
	<script>
	alert("Incorrect UserID or Password");
	window.location="cloud.jsp";
	</script>
	<%
	}	


%>
</body>
</html>

