<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="java.util.ArrayList"%>
<%@page import="com.chart2.graph"%>
<%@page import="org.apache.poi.hwpf.model.types.HRESIAbstractType"%>


<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Efficient Traceable </title>
	<!-- Meta tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Heaven Booking Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
	/>
	<script type="application/x-javascript">
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
	</script>
	<!-- Meta tags -->
	<!--stylesheets-->
	<link href="css/style.css" rel='stylesheet' type='text/css' media="all">
	<link href="css/style1.css" rel='stylesheet' type='text/css' media="all">
	<link href="css/style3.scss" rel='stylesheet' type='text/css' media="all">
	<!--//style sheet end here-->

	<link href="//fonts.googleapis.com/css?family=Barlow:300,400,500,600" rel="stylesheet">
</head>

<body>
	<h2 class="header-w3ls">
		Efficient Traceable Authorization Search System for Secure Cloud Storage</h2>
	<div class="left_column" style="width:950px;margin-left:300px;">
	          <a href="cloud_home.jsp">VIEW KEY REQUEST</a>
			  <a href="cloudviewfiles.jsp">VIEW FILES</a>
			   <a href="view_graph.jsp">VIEW GRAPH</a>
			  <a href="cloud.jsp">LOGOUT</a>
			 
	</div>
	<!--login form-->
	<div class="hotel-bothside">
		<h2>VIEW KEY REQUEST</h2>
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
	String qry2 ="select count(*) as a1,access_type from key_request group by fileid,uid "; 
	rs2 = st2.executeQuery(qry2);
	while(rs2.next())
	{
		
		trust= rs2.getString("access_type");
		System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP:"+trust);
		count =rs2.getInt("a1");
		
		System.out.println("count:"+count);
		graph as=new graph();
		//as.setFname(trust);
		//as.setCount1(count);
		list.add(as);
	} 
for(Integer i =0;i<list.size(); i++){
		
		graph a = list.get(i);
		//s=s+"{label: \""+a.getFname()+"\",y:"+a.getCount1()+"},";
		
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
			type: "line",
			dataPoints: [
			             <%=s%>
			]
		}
		]
	});
	chart.render();
}
</script>    
<div id="chartContainer" style="height: 300px; width:800px;margin-left:90px;margin-top:40px;"></div>  <br></br>
	</div>

	
</body>

</html>