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
<%String uid=(String)session.getAttribute("id");
String name1=(String)session.getAttribute("name"); 
String email1=(String)session.getAttribute("email");
String access_type=(String)session.getAttribute("access_type");
String fileid=(String)session.getAttribute("fileid");
String fileindex=null,filecontent=null;
%>
<% 
	
    ResultSet rs1=null;
	int m=0;
	try{
		
		Connection con=Databasecon.getconnection();
		Statement st=con.createStatement();
		String sql1="select * from upload where fid='"+fileid+"'";
		rs1=st.executeQuery(sql1);
		while(rs1.next())
		{
			
			fileindex=rs1.getString("keyword_index");
			filecontent=rs1.getString("ff");
		}
	}
	catch(Exception e)
	{
	e.printStackTrace();
	}
%>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a href="user_home.jsp" class="w3-bar-item w3-button w3-padding-large">Home</a>
    <a href="user.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Logout</a>
  </div>
</div>
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px;color:white" id="band">
    <h2 class="w3-wide">Cyber Security as a Service in Cloud Computing </h2>
  </div>
			<div id="f" style="overflow:auto; height:700px;
			width:800px; margin-left:300px;">
		<form action="download1.jsp" method="post">
		<fieldset>
				<legend><h4 style="max-width:800px;color:white">File Download</h4></legend>
					
			
					<div class="main">
						<div class="form-left-to-w3l">
							<div id="a1" style="font-family:georgia;font-size:20px;color:white;">File ID</div><br>
							<input type="text" name="fileid" value="<%=fileid%>" required="" style="width:350px;" readonly="true">
							<div class="clear"></div>
						</div>
					</div>
				 
					  <div class="main">
						<div class="form-left-to-w3l">
							<div id="a1" style="font-family:georgia;font-size:20px;color:white;">Keyword Index</div><br>
							<input type="text" name="keyword_index" value="<%=fileindex%>" required="" style="width:350px;">
							<div class="clear"></div>
						</div>
						</div>
						  <div class="main">
						  <div class="form-left-to-w3l">
                          <div id="a1" style="font-family:georgia;font-size:20px;color:white;">File Content</div><br>
                          <textarea name="fcontent" rows="10" cols="43" style="overflow:scroll;"><%=filecontent%></textarea>
							<div class="clear"></div>
						</div>
						</div>
						<br/>
					<div class="main">
					<div class="btnn">
						<button type="submit" style="width:350px;">Download</button><br>
					</div></div><br><hr/>
		</fieldset>
		</form>
	</div>
</body>
</html>