<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
<head>
<title>Temporary Keyword</title>
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
if((name.equals("admin"))&(password.equals("admin")))
{
	response.sendRedirect("kgc_home.jsp");

}
	
	else{
		%>
	<script>
	alert("Enter Correct Username and Password");
	window.location="kgc.jsp";
	</script>
	<%
	}	


%>
</body>
</html>

