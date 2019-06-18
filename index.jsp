<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<style>
.myButton {
	background-color:#44c767;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:28px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:17px;
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
<title> Welcome to System </title>

</head>
<body>
<center>
<p>&nbsp;</p>
<h1 style="color: #5e9ca0;">Welcome to the Badminton Court Booking System</h1>
<p>&nbsp;</p>

<a href="addbooking" class="myButton">Add Booking</a>
<p>&nbsp;</p>
<a href="list" class="myButton">View Booking</a>




</center>
</body>
</html>