<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*,databaseconnection.*" %>
<%String uid=(String)session.getAttribute("id");
String name1=(String)session.getAttribute("name"); 
String email1=(String)session.getAttribute("email");
String access_type=(String)session.getAttribute("access_type");
String fid1=request.getParameter("fid1");
String ownerid=null;
String aa="pending";%>
<% 
	
    ResultSet rs1=null;
	
	try{
		
		Connection con=Databasecon.getconnection();
		Statement st=con.createStatement();
		String sql1="select * from upload where fid='"+fid1+"'";
		rs1=st.executeQuery(sql1);
		while(rs1.next())
		{
			ownerid=rs1.getString("uid");
			
		}
	}
	catch(Exception e)
	{
	e.printStackTrace();
	}
%>
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




	//session.setAttribute("oname",name);


try
	{
			Connection con=Databasecon.getconnection();
			st=con.createStatement();
	String qry =" select  * from key_request where status='"+aa+"' and uid='"+uid+"' and fileid='"+fid1+"'"; 
	rs = st.executeQuery(qry);
	if(rs.next()){
		%>
	<script>
	alert("Alreday Sent Request,Your Request is Pending");
	window.location="user_home.jsp";
	</script>
		<% 
	}
	else
	{
try
{
//Class.forName("com.mysql.jdbc.Driver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/efficient_traceable", "root", "SKmysql@123");
PreparedStatement ps=con.prepareStatement("insert into key_request(ownerid,fileid,uid,uname,email,access_type,status)values('"+ownerid+"','"+fid1+"','"+uid+"','"+name1+"','"+email1+"','"+access_type+"','"+aa+"')");
ps.executeUpdate();
%>
<script>
alert("Key Request Sent Successfully");
window.location="user_home.jsp";
</script>

<% 
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
	}
	}
catch(Exception e11)
{
out.println(e11.getMessage());
}
%>
</body>
</html>