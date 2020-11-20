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

int count=1;
ResultSet rs=null;
String status="Anomaly Detected";
PreparedStatement psmt1=null;
try{

	
	
			Connection	con2=Databasecon.getconnection();

psmt1=con2.prepareStatement("insert into anomaly(uid,uname,email,count1,status,access_type) values(?,?,?,?,?,?)");
psmt1.setString(1,uid);
psmt1.setString(2,name1);
psmt1.setString(3,email1);
psmt1.setInt(4,count);
psmt1.setString(5,status);
psmt1.setString(6,access_type);
int s = psmt1.executeUpdate();%>
<script>
alert(" key is wrong");
window.location="user_home.jsp";
	</script>
<% 
con2.close();
psmt1.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}
%>
</body>
</html>