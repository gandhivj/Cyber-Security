<%@ page  import="java.sql.*,java.util.*,java.io.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="databaseconnection.*" %>
<%@ page import="email.*" %>
<%@ page import="helper.*" %>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%


String uid1=request.getParameter("uid");
String email1=request.getParameter("email1");
String characters = "abcdefghijklmnoABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
String b1=Utility.genarateKey(characters);
System.out.println(b1);
String to =email1; // out going email id
String subject=(String)session.getAttribute("subject");
//String subject ="welcome";
String messageText ="Your Master Key is="+b1+" ";
boolean result;
result= EmailHelper.sendMail(to, messageText, subject);

if(result)
{
       
%>
<script type="text/javascript">
    alert("Master Key Created Successfully and Sent to Your Mail........");
    window.location="kgc_home.jsp";</script>

<%
    }
else

    {
out.println("Message has not been sent successfully"); // assume it’s a fail
}

try
{
//Databasecon db = new Databasecon();
Connection con=Databasecon.getconnection();
//Class.forName("com.mysql.jdbc.Driver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/efficient_traceable", "root", "SKmysql@123");
PreparedStatement ps=con.prepareStatement("update owner_register set status='"+b1+"' where id='"+uid1+"'");
ps.executeUpdate();
//response.sendRedirect("view.jsp");
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
</body>
</html>
