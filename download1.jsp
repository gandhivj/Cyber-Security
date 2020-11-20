<%@ page import="java.sql.*, javax.sql.*,databaseconnection.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<%@ page import="java.sql.*,java.io.*"  %>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%String uid=(String)session.getAttribute("id");
String name1=(String)session.getAttribute("name"); 
String email1=(String)session.getAttribute("email");
String access_type=(String)session.getAttribute("access_type");
String fileid=(String)session.getAttribute("fileid");
%>
<html>
<head>
<title>Temporary</title>
<script language="JavaScript">

</script>
</head>
<body>
<%
	
	
	Blob file= null;
	
	
	String id=null;
	
	PreparedStatement ps = null;
	ResultSet rs = null;
		String sql=null;
		Connection con=null;
	 sql = "select file from upload where fid='"+fileid+"'  ";
	
	try
	{
		con = Databasecon.getconnection();
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		rs.next();
		file = rs.getBlob("file");
		session.setAttribute("resumeBlob",file);
		 response.sendRedirect("download2.jsp");
	}
	catch(Exception e)
	{
	
	out.println("Exception :"+e);
	}
	finally
	{
		if(con != null)
			con.close();
		if(ps != null)
			ps.close();
		if(rs != null)
			rs.close();
	}
	

//}
//else
//{//response.sendRedirect("cost_recharge2.jsp");
//}

	%>


</body>
</html>