<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*,databaseconnection.*" %>
<%String uid=(String)session.getAttribute("id");
String name1=(String)session.getAttribute("name"); 
String email1=(String)session.getAttribute("email");
String access_type=(String)session.getAttribute("access_type");
String fileid=request.getParameter("fileid");
session.setAttribute("fileid", fileid);
%>
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
<div id="f" style="overflow:auto; height:700px;width:800px;margin-left:250px; margin-top:-50px;">
		<form action="decryptkey_check.jsp" method="post">
		<fieldset>
				<legend><h4 style="max-width:800px;color:white">File Decryption</h4></legend>
					<div class="main">
						<div class="form-left-to-w3l">

							<input type="text" name="dkey" placeholder="Enter Decrypt Key" required="" style="width:350px;">
							<div class="clear"></div>
						</div>
						</div>
					
				
					<div class="main">
					<div class="btnn">
						<button type="submit" style="width:350px;">Decrypt</button><br>
					</div></div><br/>
						<a href="dkeyrequest.jsp?fid1=<%=fileid%>" style="font-family:georgia;font-size:20px;color:#ffe500;">Key Request</a>
				<br><hr/>
		</fieldset>
		</form>
	</div>
</body>
</html>