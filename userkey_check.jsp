
<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%
String uid=(String)session.getAttribute("id");
String name1=(String)session.getAttribute("name"); 
String email1=(String)session.getAttribute("email");
String access_type=(String)session.getAttribute("access_type"); %>
<html>
<head>
<title>Searchable Encryption</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;



String pkey1 = request.getParameter("pkey");
	//session.setAttribute("oname",name);
String akey1=request.getParameter("akey");

try
			{
			Connection con=Databasecon.getconnection();
			st=con.createStatement();
	String qry =" select  * from user_register where public_key='"+pkey1+"' and attribute_key='"+akey1+"' and  id='"+uid+"' "; 
	rs = st.executeQuery(qry);
	if(!rs.next()){
		response.sendRedirect("revoke1.jsp");
	%>
	
	<% }
	else{
	    response.sendRedirect("search_result.jsp");
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


