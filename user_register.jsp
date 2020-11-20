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
    <a href="index.html" class="w3-bar-item w3-button w3-padding-large">Home</a>
    <a href="index.html" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Data Owner</a>
    <a href="user.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Data User</a>
    <a href="kgc.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">KGC</a>
    <a href="cloud.jsp" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Cloud</a>
  </div>
</div>
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px;color:white" id="band">
    <h2 class="w3-wide">Cyber Security as a Service in Cloud Computing </h2>
  </div>
			<div id="f" style="overflow:auto; height:700px;
			width:800px; margin-left:700px; margin-top:-50px;">
		<form action="user_registerdb.jsp" method="post">
		<fieldset>
				<legend><h4 style="max-width:800px;color:white">User Registration</h4></legend>
					
					<div class="main">
						<div class="form-left-to-w3l">

							<input type="text" name="name" placeholder="Username" required="" style="width:350px;">
							<div class="clear"></div>
						</div>
						

					</div>
					<div class="main">

						<div class="form-left-to-w3l">

							<input type="password" name="password" required="" placeholder="Password" style="width:350px;">
						</div>
						
					</div>
					<div class="main">

						<div class="form-left-to-w3l">

							<input type="email" name="email" required="" placeholder="Email" style="width:350px;">
						</div>
						
					</div>
					<div class="main">
						<div class="form-left-to-w3l">
<input type="date" name="dateofbirth" id="dateofbirth" placeholder="Date of Birth" required="" style="width:350px;">

						</div>
						</div>
						<div class="main">
						<div class="form-left-to-w3l">

							<input type="text" name="place" placeholder="Place" required="" style="width:350px;">
							<div class="clear"></div>
						</div>
						

					</div>
						<div class="main">
						<div class="form-left-to-w3l">

							<input type="text" name="country" placeholder="Country" required="" style="width:350px;">
							<div class="clear"></div>
						</div>
						

					</div>
					
					<div class="main">
						<div class="form-left-to-w3l">

							<input type="text" name="access_type" placeholder="Access Type" required="" style="width:350px;">
							<div class="clear"></div>
						</div>
						

					</div>
					
					<div class="main">
					<div class="btnn">
						<button type="submit" style="width:350px;">Register</button>
					</div>
				</div><br/><hr/>
		</fieldset>
		</form>
	</div>
</body>
</html>