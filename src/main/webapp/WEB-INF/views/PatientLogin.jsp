<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dataTables.bootstrap.css">
    
    <script  type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.js"></script>
    
    
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>


<meta charset="ISO-8859-1">
<title>Patient Login </title>
</head>
<body>

<button type="button" class="btn btn-primary btn-block" style="margin-top:0px;"><h2>Welcome : Please Enter Your Details To Login or Register If You Dont Have Account </h2></button>  <hr>


<div class="container" style="background-image:url('resources/imgs/med1.jpg');padding:50px;margin-top:-40px;width:1515px;height:700px;background-repeat:no-repeat;">    
        <div id="loginbox" style="margin-top:-5px;margin-left:500px;width:400px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Patient Sign In</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="patientloginform" class="form-horizontal" role="form" action="PatientLogin" method="post" onsubmit="return required1()">
                        
                            <p style ="color:red"> ${error}</p>
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="username" value="" placeholder="username or email">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="password" placeholder="password">
                                    </div>
                                    

                                
                            <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                      </div>
                                    </div>
                                          
                                          
                                            <div class="g-recaptcha" data-sitekey="6LfwZ5AUAAAAAES-fH1sLfSBQ7HUVXEOsjw6ZJ-r"></div>
                                            
                                            
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">

                                       <input type="submit" class="btn btn-success" value ="login">

                                      <a id="btn-fblogin" href="facebook" class="btn btn-primary">Login with Facebook</a>

                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            Don't have an account! 
                                        <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            Sign Up Here
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                            </form>     



                        </div>                     
                    </div>  
        </div>
        
                         <script >
                            
                            
                            function required1()
                            {
                            var empt = document.forms["patientloginform"]["username"].value;
                            if (empt == "")
                            {
                            alert("Please input a Value Username");
                            return false;
                            }

                            var empt = document.forms["patientloginform"]["password"].value;
                            if (empt == "")
                            {
                            alert("Please input a Value Password");
                            return false;
                            }

                            }
 
                            </script>
        
        
        
        <!----------------------------------- signup Box------------------------------------------>
        
        
        
        <div id="signupbox" style="display:none; margin-top:-45px;margin-left:400px;width:600;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Sign Up</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
                        </div>  
                        <div class="panel-body" >
                        
                        
                        
                        
                   <form id="signupform" class="form-horizontal" role="form" action="PatientSignup" method="post"  onsubmit="return required()">
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                    
                                
                                  
                               
                                    
                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">First Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="fname" placeholder="Enter your First Name">
                                    </div>
                                </div>
						<div class="form-group">
							<label for="lastname" class="col-md-3 control-label">Last
								Name</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="lname"
									placeholder="Enter your Last Name">
							</div>


						</div>
						<div class="form-group">
							<label for="gender" class="col-md-3 control-label">Gender</label>
							<div class="col-md-9">
								<input type="radio" name="gender" value="male"> Male
								<input type="radio" name="gender" value="female"> Female
								<input type="radio" name="gender" value="other"> Other
							</div>



						</div>
						
						
						
							<div class="form-group">
                                    <label for="dob" class="col-md-3 control-label">Date Of Birth</label>
                                    <div class="col-md-9">
                                        <input type="date" class="form-control" name="dob">
                                    </div>

                                    
                                </div>
						
						
						
						<div class="form-group">
                                    <label for="username" class="col-md-3 control-label">UserName</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="username" placeholder="Enter your username">
                                    </div>

                                    
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" name="password" placeholder="Enter your Password">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="email" placeholder="Enter your Email">
                                    </div>
                                </div>
                                
                                
                                
                                <div class="form-group">
                                <label for="bloodgroup" class="col-md-3 control-label">Blood group</label>
                                <div class="col-md-9">
								<select name="bloodgroup">
								    <option value="Select">---Select your Blood Group--</option>
									<option value="A+">A+</option>
									<option value="A-">A-</option>
									<option value="O+">O+</option>
									<option value="O-">O-</option>
									<option value="B+">B+</option>
									<option value="B-">B-</option>
									<option value="AB+">AB+</option>
									<option value="AB-">AB-</option>
								</select>
							</div>
						</div>
						
						
						
						 <div class="form-group">
                                    <label for="country" class="col-md-3 control-label">Country</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="address.country" placeholder="Enter your country name">
                                    </div>
                                </div>
                                
                                
                                
                                
                                <div class="form-group">
                                    <label for="city" class="col-md-3 control-label">City</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="address.city" placeholder="Enter your city name">
                                    </div>
                                </div>
                                
                                
                                
                                
                                <div class="form-group">
                                    <label for="street" class="col-md-3 control-label">Street</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="address.street" placeholder="Enter your street name">
                                    </div>
                                </div>
                                
                                
                                
                                    

                                <div class="form-group">
                                    <!-- Button -->    
                                                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <input id ="patientSignup" type="submit" class="btn btn-primary" style="height:50px; width:150px;"><i class="icon-hand-right"></i>
                                    </div>
                                </div>
                                
                                
                        
                        
                          <script >
                            
                            
                            function required()
                            {
                            	
                            	
                                var empt = document.forms["signupform"]["fname"].value;
                                if (empt == "")
                                {
                                alert("Please input a Value  First name");
                                return false;
                                }                        	
                            	
                                var empt = document.forms["signupform"]["lname"].value;
                                if (empt == "")
                                {
                                alert("Please input a Value  last name");
                                return false;
                                }


                                var empt = document.forms["signupform"]["gender"].value;
                                if (empt == "")
                                {
                                alert("Please input a Value  Gender");
                                return false;
                                }



                                
                                
                                var empt = document.forms["signupform"]["dob"].value;
                                if (empt == "")
                                {
                                alert("Please input a Value  Date Of Birth");
                                return false;
                                }

                                
                            var empt = document.forms["signupform"]["username"].value;
                            if (empt == "")
                            {
                            alert("Please input a Value Username");
                            return false;
                            }

                            var empt = document.forms["signupform"]["password"].value;
                            if (empt == "")
                            {
                            alert("Please input a Value Password");
                            return false;
                            }
                            
                            var empt = document.forms["signupform"]["bloodgroup"].value;
                            if (empt == "Select")
                            {
                            alert("Please Select Your Blood-Group");
                            return false;
                            }
                            
                            
                            
                            
                            }
                            


                            
                            
                            
                            
                            </script>
                        
                        
                        
                        
                                    
                                   
                                   
   <!-- -------------------- signup with FB ------------------------------------------------------------------- -->
   
      <!-- -------------------------   <div style="border-top: 1px solid #999; padding-top:20px"  class="form-group">       
                                       <div class="col-md-offset-3 col-md-9">
                                        <button id="btn-fbsignup" type="button" class="btn btn-primary"><i class="icon-facebook"></i>   Sign Up with Facebook</button>
                                    </div>
                                     </div>
                  ------------------------------------------------------------------------->

                                         
                                        
                                
                                
                                
                                
                            </form>
                         </div>
                    </div>

               
               
                
         </div> 
    </div>

        



</body>
</html>