<%@ page import="java.sql.*,databaseconnection.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.chart2.graph"%>
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
<div id="f" style="overflow:auto; height:700px;width:800px;margin-left:250px; margin-top:-50px;">
		<form action="decryptkey.jsp" method="post">
		<fieldset>
				<legend><h4 style="max-width:800px;color:white">File Access Graph</h4></legend>
<% 
				  String trust = null; 
int count = 0;
Double count1 = 0.0000;
String privacydata=null;
ArrayList<graph> list=new ArrayList<graph>();  
String s ="";  	
String s1 ="";        
Connection con2=null;
Statement st2= null;
ResultSet rs2= null;
/* int trust=0; */


   
try{
	
	
	 /* con=databasecon.getConnection(); */
	 con2=Databasecon.getconnection();
	   
	st2 = con2.createStatement();
	String qry2 ="select count(*) as a1,fileid from key_request group by fileid "; 
	rs2 = st2.executeQuery(qry2);
	while(rs2.next())
	{
		
		trust= rs2.getString("fileid");
		System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP:"+trust);
		count =rs2.getInt("a1");
		
		System.out.println("count:"+count);
		graph as=new graph();
		as.setFileid(trust);
		as.setCount2(count);
		list.add(as);
	} 
for(Integer i =0;i<list.size(); i++){
		
		graph a = list.get(i);
		s=s+"{label: \""+a.getFileid()+"\",y:"+a.getCount2()+"},";
		
	}
 
}
catch(Exception ex){
	out.println(ex);
}
%>
        
	<script src="js/canvasjs.min.js"></script>
<script type="text/javascript">

window.onload = function () {
	
	var chart = new CanvasJS.Chart("chartContainer", {
		theme: "theme2",//theme1
		title:{
			text: "File Access"              
		},
		 axisX: [{
	          title: "FILE ID",
	          lineColor: "#369EAD",
	        }], 
	        axisY: [{
		          title: "VIEW COUNT",
		          lineColor: "#369EAD",
		        }],
		animationEnabled: false,   // change to true
		data: [              
		{
			// Change type to "bar", "area", "spline", "pie",etc.
			type: "column",
			dataPoints: [
			             <%=s%>
			]
		}
		]
	});
	chart.render();
}
</script>    
<div id="chartContainer" style="height: 300px; width:800px;margin-left:90px;margin-top:40px;"></div></br>
		</fieldset>
		</form>
	</div>
</body>
</html>