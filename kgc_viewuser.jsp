<!DOCTYPE html>
<%@page import="databaseconnection.Databasecon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
    <a href="kgc_home.jsp" class="w3-bar-item w3-button w3-padding-large">Home</a>
         <div class="w3-dropdown-hover w3-hide-small">
      		<button class="w3-padding-large w3-button" title="More">Key Requests</button>
      		<div class="w3-dropdown-content w3-bar-block w3-card-4">
        		<a href="kgc_home.jsp" class="w3-bar-item w3-button">Data Owner</a>
        		<a href="kgc_viewuser.jsp" class="w3-bar-item w3-button">Data User</a>
      </div></div>
    <a href="traitor.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Traitor</a>
    <a href="kgc.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Logout</a>
  </div>
</div>
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px;color:white" id="band">
    <h2 class="w3-wide">Cyber Security as a Service in Cloud Computing </h2>
  </div>
			<div id="f" style="overflow:auto; height:700px;
			width:900px; margin-left:200px; margin-top:-50px;">
		<form action="user_registerdb.jsp" method="post">
		<fieldset>
				<legend><h4 style="max-width:800px;color:white">Data User Request</h4></legend>
	<table class="table">
        <thead>
          <tr> 
            <th>ID</th>
            <th>User Name</th>
            <th>E-Mail</th>
           
            <th>Access Type</th>
            <th>Key Status</th>
          </tr>
          </thead><tbody>
             <%

Statement st = null;
ResultSet rs = null;


/* int id=0; */
String rr = "pending";

	
try
			{
			Connection con=Databasecon.getconnection();
			st=con.createStatement();
	String qry =" select  * from user_register where public_key='"+rr+"' and attribute_key='"+rr+"'"; 
	rs = st.executeQuery(qry);
	while(rs.next())
	{
	String uid1=rs.getString("id");%>
	     <tr class="info"> 
	        <td> <%=rs.getString("id")%> </td>
            <td> <%=rs.getString("uname")%> </td>
           
            <td> <%=rs.getString("email")%> </td>
            <td> <%=rs.getString("access_type")%> </td>
           
            <td><a href="mkeygenerate2.jsp?uid=<%=uid1%>&&email1=<%=rs.getString("email")%>" style="color:blue;font-size:20px;">Generate Key</a> </td>
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