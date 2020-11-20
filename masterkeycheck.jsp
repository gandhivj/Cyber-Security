
<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%
String uid=(String)session.getAttribute("id");
String name1=(String)session.getAttribute("name"); 
String email1=(String)session.getAttribute("email");  %>
<html>
<head>
<title>Temporary Keyword</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;



String mkey1 = request.getParameter("mkey");
	//session.setAttribute("oname",name);


try
			{
			Connection con=Databasecon.getconnection();
			st=con.createStatement();
	String qry =" select  * from owner_register where status='"+mkey1+"' and id='"+uid+"' "; 
	rs = st.executeQuery(qry);
	if(!rs.next()){
	%>
	<script>
	alert("Invalid Key");
	window.location="owner_home.jsp";
</script>
	<% }
	else{
	    response.sendRedirect("upload.jsp");
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


