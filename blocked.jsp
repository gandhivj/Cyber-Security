<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
    <%
String uid=request.getParameter("uid");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int c1=0;
int c2=0;
String a1="blocked";
Statement st = null;
ResultSet rs = null;






		
		    try
		    {
		   // Class.forName("com.mysql.jdbc.Driver");
		   // Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/efficient_traceable", "root", "SKmysql@123");
		    Connection con=Databasecon.getconnection();
                    PreparedStatement ps=con.prepareStatement("update user_register set attribute_key='"+a1+"' where  id='"+uid+"' ");
		    ps.executeUpdate();
		    %>
		    <script>
		    alert("User Blocked");
		    window.location="traitor.jsp";
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