<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%
String uid=(String)session.getAttribute("id");
String name1=(String)session.getAttribute("name"); 
String email1=(String)session.getAttribute("email");
String access_type=(String)session.getAttribute("access_type"); %>
<!DOCTYPE html>
<html lang="en">
<title>Security-as-a-Service</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style1.css">
		<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif;background-image:url('images/bg1.jpg');background-repeat:no-repeat;background-size:cover}
.mySlides {display: none}
</style>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a href="search_result.jsp" class="w3-bar-item w3-button w3-padding-large">Home</a>
    <a href="user.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Logout</a>
  </div>
</div>
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px;color:white" id="band">
    <h2 class="w3-wide">Cyber Security as a Service in Cloud Computing </h2>
  </div>
<div id="f" style="overflow:auto; height:500px;width:800px;margin-left:250px; margin-top:-50px;">
		<form action="userkey_check.jsp" method="post">
		<fieldset>
				<legend><h4 style="max-width:800px;color:white">View Files</h4></legend>
		<table class="table">
        <thead>
          <tr> 
            <th>File ID</th>
            <th>Keyword Index</th>
            <th>Action</th>
          </tr>
          </thead>	  <tbody>
             <%

Statement st = null;
ResultSet rs = null;


/* int id=0; */
String rr = "pending";

	
try
			{
			Connection con=Databasecon.getconnection();
			st=con.createStatement();
	String qry =" select  * from upload where keyword_index='"+access_type+"'"; 
	rs = st.executeQuery(qry);
	while(rs.next())
	{
	String id1=rs.getString("id");%>
	     <tr class="info"> 
	        <td> <%=rs.getString("fid")%> </td>
            <td> <%=rs.getString("enc_index")%> </td>
           
           
            <td><a href="view_file1.jsp?id=<%=id1%>" style="color:blue;font-size:20px;">View</a> </td>
          </tr>
	  
		
	<%	
	}
}
catch(Exception ex){
	out.println(ex);
}
%>
      </tbody>
          </table>   
		</fieldset>
		</form>
	</div>
</body>
</html>