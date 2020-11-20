<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
    <%
String uid=(String)session.getAttribute("id");
String name1=(String)session.getAttribute("name"); 
String email1=(String)session.getAttribute("email");
String access_type=(String)session.getAttribute("access_type"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

Statement st = null;
ResultSet rs = null;





try
			{
			Connection con=Databasecon.getconnection();
			st=con.createStatement();
	String qry =" select  * from anomaly where uid='"+uid+"' and access_type='"+access_type+"' "; 
	rs = st.executeQuery(qry);
	if(!rs.next()){
		response.sendRedirect("revoke2.jsp");
	%>
	
	<% }
	else{
	    response.sendRedirect("updaterevoke.jsp");
	}
	con.close();
	st.close();
}
catch(Exception ex){
	out.println(ex);
}
%>

</body>
</html>