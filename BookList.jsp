<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>

<html>
<head>
	<title> Details Badminton Booking Court </title>
	<style>
	.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	-webkit-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	box-shadow:inset 0px 1px 0px 0px #97c4fe;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #3d94f6), color-stop(1, #1e62d0));
	background:-moz-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background:-webkit-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background:-o-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background:-ms-linear-gradient(top, #3d94f6 5%, #1e62d0 100%);
	background:linear-gradient(to bottom, #3d94f6 5%, #1e62d0 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3d94f6', endColorstr='#1e62d0',GradientType=0);
	background-color:#3d94f6;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #337fed;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #1570cd;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #1e62d0), color-stop(1, #3d94f6));
	background:-moz-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:-webkit-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:-o-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:-ms-linear-gradient(top, #1e62d0 5%, #3d94f6 100%);
	background:linear-gradient(to bottom, #1e62d0 5%, #3d94f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0', endColorstr='#3d94f6',GradientType=0);
	background-color:#1e62d0;
}
.myButton:active {
	position:relative;
	top:1px;
}

.redButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #f5978e;
	-webkit-box-shadow:inset 0px 1px 0px 0px #f5978e;
	box-shadow:inset 0px 1px 0px 0px #f5978e;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f24537), color-stop(1, #c62d1f));
	background:-moz-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background:-webkit-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background:-o-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background:-ms-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background:linear-gradient(to bottom, #f24537 5%, #c62d1f 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24537', endColorstr='#c62d1f',GradientType=0);
	background-color:#f24537;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #d02718;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #810e05;
}
.redButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f24537));
	background:-moz-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background:-webkit-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background:-o-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background:-ms-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background:linear-gradient(to bottom, #c62d1f 5%, #f24537 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f', endColorstr='#f24537',GradientType=0);
	background-color:#c62d1f;
}
.redButton:active {
	position:relative;
	top:1px;
}


.ogButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #f9eca0;
	-webkit-box-shadow:inset 0px 1px 0px 0px #f9eca0;
	box-shadow:inset 0px 1px 0px 0px #f9eca0;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f0c911), color-stop(1, #f2ab1e));
	background:-moz-linear-gradient(top, #f0c911 5%, #f2ab1e 100%);
	background:-webkit-linear-gradient(top, #f0c911 5%, #f2ab1e 100%);
	background:-o-linear-gradient(top, #f0c911 5%, #f2ab1e 100%);
	background:-ms-linear-gradient(top, #f0c911 5%, #f2ab1e 100%);
	background:linear-gradient(to bottom, #f0c911 5%, #f2ab1e 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f0c911', endColorstr='#f2ab1e',GradientType=0);
	background-color:#f0c911;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #e65f44;
	display:inline-block;
	cursor:pointer;
	color:#c92200;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ded17c;
}
.ogButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f2ab1e), color-stop(1, #f0c911));
	background:-moz-linear-gradient(top, #f2ab1e 5%, #f0c911 100%);
	background:-webkit-linear-gradient(top, #f2ab1e 5%, #f0c911 100%);
	background:-o-linear-gradient(top, #f2ab1e 5%, #f0c911 100%);
	background:-ms-linear-gradient(top, #f2ab1e 5%, #f0c911 100%);
	background:linear-gradient(to bottom, #f2ab1e 5%, #f0c911 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f2ab1e', endColorstr='#f0c911',GradientType=0);
	background-color:#f2ab1e;
}
.ogButton:active {
	position:relative;
	top:1px;
}

td.myclassa
{
  text-align:center;
  vertical-align:middle;

}
	</style>
</head>
<body>
	<center>
	<p>&nbsp;</p>
		<h1>Badminton Court Booking Management</h1>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
        <h2>
        <a href="index.jsp" class="myButton" >Home</a>
       	 &nbsp;&nbsp;&nbsp;
        	<a href="addbooking" class="myButton">Add New Booking</a>
        	&nbsp;&nbsp;&nbsp;
        	<a href="BookList.jsp" class="myButton">List All Booking</a>
        	
        </h2>
	</center>

<%
 try
 {
	Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/badmintonx?user=root&password=iqbal100&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");    
    PreparedStatement pstt = conn.prepareStatement("Select * from book");

    ResultSet resultset = pstt.executeQuery();                        
%>
	
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>Details of The Booking</h2></caption>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Court</th>
                <th>Price</th>
                <th>Booking Hour</th>
                <th>Total Booking Price</th>
                <th>Actions</th>
            </tr>
			 <% while(resultset.next()){ %>
		<tr>
		<td><%=resultset.getString(1)%></td>
		<td><%=resultset.getString(2)%></td>
		<td><%=resultset.getString(3)%></td>
		<td>RM <%=resultset.getString(4)%></td>
		<td class='myclassa'><%=resultset.getString(5)%> Hours</td>
		
		<% double a=Double.parseDouble(resultset.getString(4));  %>
		<% double b=Double.parseDouble(resultset.getString(5));  
			double totalprice = a * b ;
		%>
		      <c:set var = "total" value = '<%=totalprice %>' />
		
		
	 <td class='myclassa'>RM <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2"  value =  "${total}"/></td> <!-- convert siap2 keopada 2 decimal -->
         <td>
          <a href="edit?id=<c:out value='<%=resultset.getString(1)%>' />"class="ogButton" >Edit</a>
           &nbsp;&nbsp; | &nbsp;&nbsp;
          <a href="delete?id=<c:out value='<%=resultset.getString(1)%>' />"class="redButton">Delete</a>                    	
		</td>
		
		
	
        </tr>
		</form>
         <% } %>
        
        </table>
<%	
 }
 catch (Exception e)
 {
     out.println("<div id=\"error\">");
     e.printStackTrace(new java.io.PrintWriter(out));
    out.println("</div>");
 }
%>
    </div>	
</body>
</html>
