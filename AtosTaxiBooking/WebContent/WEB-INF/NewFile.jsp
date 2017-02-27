<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import ="javax.sql.*" %>
<%

String name=request.getParameter("name");

String number=request.getParameter("number");
//out.print("Number: "+number);
String source=request.getParameter("source");
String dest=request.getParameter("dest");
String time=request.getParameter("time");
String date=request.getParameter("date");
String carType=request.getParameter("carType");
String estimatedFare=request.getParameter("estimatedFare");

if(name != null){

	String temp ="trip";
	String temp1 = number.substring(6);
	temp = temp + temp1;
	
	time = time.replace(":","");
	date = date.replace("-","");
	
Class.forName("com.mysql.jdbc.Driver");
System.out.println("Connecting to database...");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/atos_taxi_service","root","SYSTEM"); 
Statement stmt=con.createStatement();  

String sql = "INSERT INTO `atos_taxi_service`.`tripdetails`(`tripCustomerName`,`tripContactDetails`,`tripSource`,`tripDestination`,`tripTime`,`tripDate`,`tripCarID`,`tripCost`,`tripAlphaNumericID`) VALUES('"+name+"',"+number+",'"+source+"','"+dest+"',"+time+","+date+","+carType+","+estimatedFare+",'"+temp+"');";

System.out.println(sql);

stmt.execute(sql);


//ResultSet rs=stmt.executeQuery('INSERT INTO `atos_taxi_service`.`tripdetails`(`tripCustomerName`,`tripContactDetails`,`tripSource`,`tripDestination`,`tripTime`,`tripDate`,`tripCarID`,`tripCost`,`tripAlphaNumericID`)VALUES("+name+",number,"source","pHASE 2",083006,20170202,1,23,"lavin245"); '");  


//String sql = "insert into table(a,b) values('"+dst+"','"+da+"')";





//while(rs.next())  
//System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));  
//con.close();  







	System.out.println(name);
	System.out.println(number);
	System.out.println(source);
	System.out.println(dest);
	System.out.println(time);
	System.out.println(date);
	System.out.println(carType);
	System.out.println(estimatedFare);
	//System.out.println(number);
	//System.out.println("Name: "+name);
	//System.out.print("Added Successfully");
}


%>



<div class="container">


  <h2>Hey Rider,</h2>
  
  <form method="GET" action="bookMyCab.jsp?name=<%out.print(name);%> &number=<%out.print(number);%> &source='<%out.print(source);%>' &dest='<%out.print(dest);%>' &time='<%out.print(time); %>' &date='<%out.print(date); %>' &estimatedFare='<% out.print(estimatedFare);%>' &carType='<%out.print(carType);%>'" 
  
  >
  
<div class="form-group">
 	 <label for="usr">Name:</label>
  	 <input type="text" class="form-control" id="name" name="name" required >
</div>

<div class="form-group">
 	 <label for="usr">Number:</label>
  	 <input type="number" class="form-control" id="number" name="number" required >
</div>

<div class="form-group">
  	<label for="pwd">Pick up from:</label>
  	<input type="text" class="form-control" id="source" name="source" required >
</div>

<div class="form-group">
  	<label for="pwd">Drop me at:</label>
  	<input type="text" class="form-control" id="dest" name="dest"  required>
</div>

<div class="form-group">
  	<label for="pwd">Pick up time:</label>
  	<input type="time" class="form-control" id="time" name="time" required>
</div>

<div class="form-group">
  	<label for="pwd">Date:</label>
  	<input type="date" class="form-control" id="date" name="date" required>
</div>




<div class="form-group">
  <label for="sel1">Car Type</label>
  <select class="form-control" id="carType" name="carType" onChange="generateFare();">
    <option value="1">Sedan</option>
    <option value="2">Prime</option>
    <option value="3">Merc</option>
    <option value="4">Porche</option>
  </select>
</div>

<div class="form-group">
 	 <label for="usr">Estimation:</label>
  	 <input type="number" class="form-control" id="estimatedFare" name="estimatedFare" readonly>
  	 
</div>

<table >
<tr>
<td>
<input type="submit" class="btn btn-default" value="Confirm Booking"> &nbsp  &nbsp &nbsp
</td>
<td>
<button type="reset" class="btn btn-default" value="Reset">Reset</button>
</td>
</tr>
</table>
</form>
</div>



</body>
</html>

<script>

function generateFare(){
	var x = Math.random() * 100;
	//alert(x);
	document.getElementById("estimatedFare").value = Math.round(x);
}
</script>



