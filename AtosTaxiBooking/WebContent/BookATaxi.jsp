<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">	
    
<title>Atos Taxi Services</title>
 <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script>

function generateFare(){
	var x = Math.random() * 100;
	//alert(x);
	document.getElementById("estimatedFare").value = Math.round(x);
}
</script>
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


    
    <div class="brand">Atos Taxi Services </div>
    <div class="address-bar">Atos India Pvt Ltd</div>

    <!-- Navigation -->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.html">Business Casual</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">Back</a>
                    </li>
                    <li>
                        <a href="#">Changed My Mind</a>
                    </li>
                   
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="container">

        <div class="row">
            <div class="box">
            
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Book Me A
                        <strong>TAXI</strong>
                    </h2>
                    <hr>
                </div>
  
<div class="row">
		

		<div class="col-lg-12 " >	
	
<div class="row">
	<div class="col-lg-4"></div>
	<div class="col-lg-4"><h2>Hey Rider</h2></div>
	<div class="col-lg-4"></div>
</div> 
<%--   <form method="GET" action="bookMyTaxi.jsp?name=<%out.print(name);%> &number=<%out.print(number);%> &source='<%out.print(source);%>' &dest='<%out.print(dest);%>' &time='<%out.print(time); %>' &date='<%out.print(date); %>' &estimatedFare='<% out.print(estimatedFare);%>' &carType='<%out.print(carType);%>'"  > --%>
<div class="row">  
<div class="form-group col-lg-6">
 	 <label for="usr">Name:</label>
  	 <input type="text" class="form-control" id="name" name="name" required >
</div>

<div class="form-group col-lg-6">
 	 <label for="usr">Number:</label>
  	 <input type="number" class="form-control" id="number" name="number" required >
</div>
</div>

<div class="row">
<div class="form-group col-lg-6">
  	<label for="pwd">Pick up from:</label>
  	<input type="text" class="form-control" id="source" name="source" required >
</div>

<div class="form-group col-lg-6">
  	<label for="pwd">Drop me at:</label>
  	<input type="text" class="form-control" id="dest" name="dest"  required>
</div>
</div>

<div class="row">
<div class="form-group col-lg-6">
  	<label for="pwd">Pick up time:</label>
  	<input type="time" class="form-control" id="time" name="time" required>
</div>

<div class="form-group col-lg-6">
  	<label for="pwd">Date:</label>
  	<input type="date" class="form-control" id="date" name="date" required>
</div>
</div>


<div class="row">
<div class="form-group col-lg-12">
  <label for="sel1">Car Type</label>
  <select class="form-control " id="carType" name="carType" onChange="generateFare();">
    <option value="1">Sedan</option>
    <option value="2">Prime</option>
    <option value="3">Merc</option>
    <option value="4">Porche</option>
  </select>
</div>

<div class="form-group col-lg-12">
 	 <label for="usr">Estimation:</label>
  	 <input type="number" class="form-control" id="estimatedFare" name="estimatedFare" readonly>
  	 
</div>
</div>

<div class="row">
	<div class="col-lg-2"></div>
	<div class="form-group col-lg-2">
	<input type="submit" class="btn btn-default "  value="Confirm Booking" >
	</div>
	<div class="col-lg-2"></div>
	<div class="col-lg-2"></div>
	<div class="form-group col-lg-2">
	<button type="reset" class="btn btn-default" value="Reset">Reset </button>
	</div>
	<div class="col-lg-2"></div>

</div>

</form>

</div>

		
</div>
                    
                
                
                
            
        </div><!--box ends  -->

    </div>
    </div>
    <!-- /.container -->

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>