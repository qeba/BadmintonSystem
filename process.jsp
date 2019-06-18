<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
	<%@page import="javax.sql.*" %>
	<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Receipt</title>

<style>
.myButton {
	background-color:#44c767;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:14px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	padding:16px 31px;
	text-decoration:none;
	text-shadow:0px 1px 0px #2f6627;
}
.myButton:hover {
	background-color:#5cbf2a;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>

<script type="text/javascript" src="http://jqueryjs.googlecode.com/files/jquery-1.3.1.min.js" > </script> 
<script type="text/javascript">
function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;

    window.print();

    document.body.innerHTML = originalContents;
}
</script>

</head>
<body>

<div id="printableArea">

	<% 
		Connection conn = null;
		Statement stmt = null;
		
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/badmintonx?user=root&password=iqbal100&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
			  stmt = conn.createStatement();
	
		
		String name = request.getParameter("name");
		String court =request.getParameter("court");
		float price = Float.parseFloat(request.getParameter("price"));
		int hour = Integer.parseInt(request.getParameter("hour"));
		

		 
		DecimalFormat f = new DecimalFormat("##.00");
		  
		 String query ="INSERT into book (name, court, price, hour) VALUES (?,?,?,?)";
	 	 PreparedStatement pstmt = conn.prepareStatement(query);
	 	 pstmt.setString(1, name);
	 	 pstmt.setString(2, court);
	 	 pstmt.setDouble(3, price);
	 	 pstmt.setInt(4, hour);
	 	 pstmt.executeUpdate();
	 	 
	 	 double total = price * hour;
	
		out.println("<center><form class=\"myForm\" method=\"get\" enctype=\"application/x-www-form-urlencoded\" action=\"/adbooking.html\">");
		out.write("<h1 style='color:red'>***Badminton Court Booking Receipt***</h1>");
		
		
		  out.println("" + 
	        		"      <label for=\"court\">Name : </label>" + 
	        		"     ");
				 out.print(name);
        out.println("<p>" + 
        		"<label for=\"court\">Court : </label>");
					 out.print(court);
					 out.print("</p>");
					 
        out.println("<p>" + 
        		"<label for=\"price\">Price : </label>");
       			 out.print("RM ");
				 out.print(f.format(price));
				 out.print("<p>");
				 
				 
       			 out.println("<p>" + 
        		"<label for=\"hour\">Booking Hour : </label>");
      			  out.print(f.format(hour));
      		 	out.print("</p>");
        	

      		out.write("<h2 style='color:red'>***---------***</h1>");
      		 out.println("<h2 style='color:red'>" + 
             		"<label for=\"hour\">Total Booking Price: </label>");
      					out.print("RM ");
           			  out.print(f.format(total));
           		 	out.print("</h2>");
             	
      		out.write("<h2 style='color:red'>***---------***</h1>");
        out.println("</form></center>");
	
		

	%>
	</div>
	 	<center>
 	
 	
<p></p>
 	<p>
 	<a href="index.jsp" class="myButton">Home</a>
 	<input class="myButton" type="button" onclick="printDiv('printableArea')" value="Print Receipt" />

 	</p>
 	</center>
	
	<% 
		}
		catch(Exception e)
		{
			out.println("<div id=\"error\">");
		     e.printStackTrace(new java.io.PrintWriter(out));
		    out.println("</div>");
		}
 	%>
 	

 	

</body>
</html>