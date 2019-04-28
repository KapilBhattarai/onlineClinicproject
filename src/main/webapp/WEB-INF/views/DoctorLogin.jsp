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
<title>Doctor Login </title>
</head>
<body>

<hr>

<button type="button" class="btn btn-primary btn-block"   style="margin-top:-15px;"><h1>Welcome Doctor : Please Enter Your Details To Login </h1></button>  <hr>


<div class="container" style="background-image:url('resources/imgs/med1.jpg');padding:50px;margin-top:-38px;width:1515px;height:650px;background-repeat:no-repeat;">    
        <div id="loginbox" style="margin-top:20px;margin-left:500px;width:400px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Doctor Sign In</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="doctorloginform" class="form-horizontal" role="form" action="DoctorLogin" method="post" onsubmit="return required()">
                        
                            <p style ="color:red"> ${error}</p>
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="username"  placeholder="username ">                                        
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


                                    </div>
                                </div>
                            </form>     



                        </div>                     
                    </div>  
        </div>
        </div>
        
                                    <script >
                            
                            
                            function required()
                            {
                            var empt = document.forms["doctorloginform"]["username"].value;
                            if (empt == "")
                            {
                            alert("Please input a Value Username");
                            return false;
                            }

                            var empt = document.forms["doctorloginform"]["password"].value;
                            if (empt == "")
                            {
                            alert("Please input a Value Password");
                            return false;
                            }

                            }
 
                            </script> 
        



</body>
</html>