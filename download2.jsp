<%@ page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%
java.util.Date now = new java.util.Date();
String date=now.toString();
String DATE_FORMAT = "HH.mm";
SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
String strDateNew = sdf.format(now);%>
<html>
<head>
<title>Fault tolerance</title>
<script language="JavaScript">

</script>
</head>

<body>		
<%

String fname1="file";

		Blob b = (Blob)session.getAttribute("resumeBlob");
		if(b != null)
		{
			
			byte[] ba = b.getBytes(1, (int)b.length());
			response.setContentType("text");
			response.setHeader("Content-Disposition","attachment; fileName=\""+fname1+"\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
			//session.removeAttribute("document1");
		}
		else
		{
			//response.sendRedirect("cost_recharge2.jsp");
			System.out.println("null");
		}
%>

</body>
</html>