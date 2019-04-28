<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>

<link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dataTables.bootstrap.css">
    
    <script  type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.js"></script>


<title>Online Clinic</title>
</head>
<body>

<button type="button" class="btn btn-primary btn-block"><h1>Welcome To Online Clinic</h1></button>  <hr>



<!-- Start navbar -->
    <nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <h1 ><a class="navbar-brand" href="#" style="color:green">ONLINE CLINIC MANAGEMENT SYSTEM</a></h1>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
           <li class="active" style="color:bLue"><a href="#" onClick="$('#contactbox').hide();$('#about').hide();$('#services').hide();$('#logindetails').show()"><h3> HOME </h3></a></li> 
          </ul>
          <ul class="nav navbar-nav navbar-right">
          
               <li><a href="#" onClick="$('#logindetails').hide();$('#contactbox').hide();$('#about').hide();$('#services').show()" ><h3> Services  </h3></a></li>
               
              <li><a href="#" onClick="$('#logindetails').hide();$('#contactbox').hide();$('#services').hide();$('#about').show()"><h3> About </h3></a></li>
              
             <li><a href="gallery"><h3> Gallery   </h3></a></li>
             
             <li><a href="#" onClick="$('#logindetails').hide();$('#services').hide();$('#about').hide();$('#contactbox').show()"><h3> Contact   </h3></a></li>
             
          </ul>
        </div> 
      </div>
    </nav>
    <!-- End navbar -->



    
    <!-- C:\Users\Dell\Documents\workspace-sts-3.9.7.RELEASE\onlineClinic\src\main\webapp\resources\imgs\007.jpg -->
  
    <div id="logindetails" style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med1.jpg');padding:50px;width:1515px;height:500px;background-repeat:no-repeat;">
    
     <a href="AdminLogin"  class="btn btn-primary" > <h1 style="padding-left: 302">Admin Login </h1></a> <br><br>
     <a href="DoctorLogin" class="btn btn-primary"> <h1 style="padding-left: 300"> Doctor Login </h1></a> <br><br>
     <a href="PatientLogin" class="btn btn-primary"><h1 style="padding-left: 305"> Patient login </h1></a> <br><br>
     
     </div>
     
     
      
 
    
    
    <div id="about" style="display:none">
      <img alt="med2.jpg"src="resources/imgs/med2.jpg" STYLE="position:absolute; TOP:230px; LEFT:5px; WIDTH:1515px; HEIGHT:1000px" >
     </div>
     
     
     
      <div id="services" style="display:none">
      <img alt="serv1.png"src="resources/imgs/serv1.png" STYLE="position:absolute; TOP:230px; LEFT:5px; WIDTH:1515px; HEIGHT:800px" >
     </div>
     
     
     
     
     <!-- ================================= Contact Details ============================================== -->
     <div id="contactbox" style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med1.jpg');padding:50px;width:1515px;height:700px;background-repeat:no-repeat;display:none">
     
      <div id="contactdetailsbox" style="margin-top:-50"class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info" style="border:3px solid blue">
                        <div class="panel-heading" style="border:3px solid green">
                            <div class="panel-title"><h1>Send Us Message</h1></div>
                            <div style="float:right; font-size: 85%; position: relative; top:-50px"><a id="cancellink" href="#" onclick="$('#signupbox').hide(); $('#logindetails').show()"><h3>Cancel</h3></a></div>
                        </div> 
                         <br>
                        <div class="panel-body" style="border:3px solid blue" >
                            <form id="messageform" class="form-horizontal" role="form" action="#" method="post">
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
 
   
                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">Your Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="fname" placeholder="Enter your Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Your Email</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="lname" placeholder="Enter your Email">
                                        </div>
                                        
                                    </div>
                                     <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Your Phone Number</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="username" placeholder="Enter your Phone Number">
                                    </div>
                                    <br>

						<table border="0" width="35%" align="center">

							<caption>
								<h2 style="color:green">Create message</h2>
							</caption>

							<tr>
								<td>Subject</td>
								<td><input type="text" name="subject" size="50" /></td>
							</tr>

							<tr>
								<td>Message</td>
								<td><textarea rows="10" cols="39" name="msg"></textarea></td>
							</tr>
                            <tr>
								<td colspan="2" align="center"><input type="submit"
									value="Send" style="height:50px; width:150px; color:purple;" /></td>
							</tr>
						</table>
						
						
						</form>
                         </div>
                    </div>
     
         </div> 
</div> 
         
         
</body>
</html>