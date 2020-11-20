
<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<html>
<head>
<title>Temporary Keyword</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;
String email=null,name1=null,id=null,access_type=null;

String name = request.getParameter("name");
	//session.setAttribute("oname",name);
String password = request.getParameter("password");

try
			{
			Connection con=Databasecon.getconnection();
			st=con.createStatement();
	String qry =" select  * from user_register where uname='"+name+"' and password='"+password+"' "; 
	rs = st.executeQuery(qry);
	if(!rs.next()){
	%>
	<script>
	alert("Incorrect UserID or Password");
	window.location="user.jsp";
</script>
	<% }
	else{
	
	
	id=rs.getString("id");
	session.setAttribute("id",id);
	
	name1=rs.getString("uname");
	session.setAttribute("name",name1);
	email=rs.getString("email");
	session.setAttribute("email",email);
	//System.out.println(email);
	access_type=rs.getString("access_type");
	session.setAttribute("access_type", access_type);
	response.sendRedirect("user_home.jsp");
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


