<%@page import="databaseconnection.Databasecon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%String status1="pending";%>
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
    <a href="cloud_home.jsp" class="w3-bar-item w3-button w3-padding-large">Home</a>
    <a href="cloud_home.jsp" class="w3-bar-item w3-button w3-padding-large">Key Requests</a>
    <a href="cloudviewfiles.jsp" class="w3-bar-item w3-button w3-padding-large">Files</a>
    <a href="view_graph.jsp" class="w3-bar-item w3-button w3-padding-large">Graph</a>
    <a href="cloud.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Logout</a>
  </div>
</div>
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px;color:white" id="band">
    <h2 class="w3-wide">Cyber Security as a Service in Cloud Computing </h2>
  </div>
<div id="f" style="overflow:auto; height:700px;width:900px;margin-left:200px; margin-top:-50px;">
		<form action="decryptkey.jsp" method="post">
		<fieldset>
				<legend><h4 style="max-width:800px;color:white">Key Request</h4></legend>
<table class="table">
        <thead>
          <tr> 
            <th>File ID</th>
            <th>User Name</th>
            <th>E-Mail</th>
            <th>Access Type</th>
            <th>Generate Key</th>
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
	String qry =" select  * from Key_request where status='"+status1+"' "; 
	rs = st.executeQuery(qry);
	while(rs.next())
	{
	String id1=rs.getString("id");%>
	     <tr class="info"> 
	       
            <td> <%=rs.getString("fileid")%> </td>
           
            <td> <%=rs.getString("uname")%> </td>
            <td> <%=rs.getString("email")%> </td>
            <td> <%=rs.getString("access_type")%> </td>
            <td><a href="verificationkey.jsp?id11=<%=id1%>&&email1=<%=rs.getString("email")%>" style="color:blue;font-size:20px;"> <%=rs.getString("status")%> </a> </td>
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