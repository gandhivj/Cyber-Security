
<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%
String uid=(String)session.getAttribute("id");
String name1=(String)session.getAttribute("name"); 
String email1=(String)session.getAttribute("email");  
String fileid=(String)session.getAttribute("fileid");
%>
<html>
<head>
<title>Efficient Search</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;



String dkey1 = request.getParameter("dkey");
	//session.setAttribute("oname",name);


try
			{
			Connection con=Databasecon.getconnection();
			st=con.createStatement();
	String qry =" select  * from key_request where status='"+dkey1+"' and uid='"+uid+"' and fileid='"+fileid+"'"; 
	rs = st.executeQuery(qry);
	if(!rs.next()){
	%>
	<script>
	alert("Invalid Key");
	window.location="user_home.jsp";
</script>
	<% }
	else{
	    response.sendRedirect("dercypt_file.jsp");
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


