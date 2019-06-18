<html>


<body>
<style>
.myButton {
	background-color:#44c767;
	-moz-border-radius:16px;
	-webkit-border-radius:16px;
	border-radius:15px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	padding:15px 18px;
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
<head>
	<title>Badminton Court System</title>
</head>

<h2>Add New Badminton Court Booking</h2>
</p>

<form class="myForm" method="get" enctype="application/x-www-form-urlencoded" action="process.jsp">
     <p>
      <label for="name">Name : </label>
      <input required type="text" step="any" name="name">  
     </p>

	 <p>
      <label for="court">Court: </label>
	<select required name="court">
    <option value="Court A">Court A</option>
	<option value="Court B">Court B</option>
	<option value="Court C">Court C</option>
	
	</select>
     </p>
	 
	 <p>
      <label for="price"> Price : </label>
      <input required type="number" step="any" name="price">  
     </p>
	 <p>
      <label for="hour">Hour  : </label>
      <input required type="number" step="any" name="hour">  
     </p>
 	 
		<p>
		<input type="reset" value="Reset" class="myButton" name="reset" id="reset" />
		<input type="submit" value="Booking" class="myButton" name="submit" id="submit" />
	
		</p>
		</br>
		 	<a href="index.jsp" class="myButton">Home</a>

</form> 

</body>
</html>