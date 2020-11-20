<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*,databaseconnection.*" %>
<!DOCTYPE html>
<html lang="en">
<%
StringBuffer buffer = new StringBuffer();
String characters = "123456789";
int charactersLength = characters.length();

for (int i = 0; i <5 ; i++) {
	double index = Math.random() * charactersLength;
	buffer.append(characters.charAt((int) index));
}
String b1=buffer.toString();
String uid=(String)session.getAttribute("id");
String name1=(String)session.getAttribute("name"); 
String email1=(String)session.getAttribute("email"); 
    ResultSet rs1=null;
	int m=0;
	try{
		
		Connection con=Databasecon.getconnection();
		Statement st=con.createStatement();
		String sql1="select max(fid) from upload";
		rs1=st.executeQuery(sql1);
		while(rs1.next())
		{
		if(rs1.getInt(1)==0)
		m=100;
		else
		m=rs1.getInt(1)+1;
		session.setAttribute("fid",m);
		}
%>
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
    <a href="owner_home.jsp" class="w3-bar-item w3-button w3-padding-large">Home</a>
    <a href="index.html" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Logout</a>
  </div>
</div>
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px;color:white" id="band">
    <h2 class="w3-wide">Cyber Security as a Service in Cloud Computing </h2>
  </div>
			<div id="f" style="overflow:auto; height:700px;
			width:800px; margin-left:700px; margin-top:-50px;">
		<form action="uploaddb.jsp" method="post" ENCTYPE="multipart/form-data">
		<fieldset>
				<legend><h4 style="max-width:800px;color:white">File Upload</h4></legend>
					
			
					<div class="main">
						<div class="form-left-to-w3l">

							<input type="text" name="fileid" value="<%=m%>" required="" style="width:350px;" readonly="true">
							<div class="clear"></div>
						</div>
					</div>
				   <div class="main">
						<div class="form-left-to-w3l">

							<input type="text" name="fname" placeholder="Filename" required="" style="width:350px;">
							<div class="clear"></div>
						</div>
					</div>
					  <div class="main">
						<div class="form-left-to-w3l">

							<input type="text" name="keyword_index" placeholder="Keyword Index" required="" style="width:350px;">
							<div class="clear"></div>
						</div>
						</div>
						  <div class="main">
						  <div class="form-left-to-w3l">
                          <div id="a1" style="font-family:georgia;font-size:20px;color:white;">File Key</div><br>
							<input type="text" name="file_key"  value="<%=b1%>" required="" readonly="true" style="width:350px;">
							<div class="clear"></div>
						</div>
						</div>
						 <div class="main">
						<div class="form-left-to-w3l">
                          <div id="a1" style="font-family:georgia;font-size:20px;color:white;">Select File</div><br>
							<input type="file" name="image"  required="">
							<div class="clear"></div>
						</div>
					</div>
					<div class="main">
					<div class="btnn">
						<button type="submit" style="width:350px;">Submit</button><br>
					</div></div><br><hr/>
		</fieldset>
		</form>
	</div>
</body>
<%
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</html>