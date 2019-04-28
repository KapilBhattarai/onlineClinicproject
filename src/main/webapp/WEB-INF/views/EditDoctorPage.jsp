<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<html>
<head>

<link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dataTables.bootstrap.css">
    
    <script  type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.js"></script>


<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med4.png');padding:20px;margin-top:-19px;width:1530px;height:1000px;background-repeat:no-repeat;">
<button type="button" class="btn btn-primary btn-block"><h2>Welcome To Online Clinic : ${user}</h2></button>  







        <div id="addDoctor" margin-top:-10px;margin-left:450px;width:600;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                    <div class="panel-title"><h4>Edit The Details Below</h4></div></div>
                         
                        </div>  
                        <div class="panel-body" style="background-color:#FFFFE0;margin-top:-20px">

 <spring:form  class="form-horizontal" action="${pageContext.request.contextPath}/updateDoctor" method="post" modelAttribute="Doctorinfo" >
 
 
 
 
 
                       <div class="form-group">
                      <label for="firstname" class="col-md-3 control-label">First Name</label>
                                <div class="col-md-9">
                                   <spring:input path="fname" class="form-control"/>
                               </div>
                               </div>
                              
                                
 						<div class="form-group">
							<label for="lastname" class="col-md-3 control-label">Last Name</label>
							<div class="col-md-9">
								<spring:input path="lname" class="form-control" />
							</div>
                                </div>

						
						<div class="form-group">
							<label for="gender" class="col-md-3 control-label">Gender</label>
							<div class="col-md-9">
								<spring:radiobutton path="gender" value="male"/> Male
								<spring:radiobutton  path="gender" value="female"/> Female
								<spring:radiobutton  path="gender" value="other"/> Other
							</div>



						</div>
						

						<div class="form-group">
                                    <label for="username" class="col-md-3 control-label">UserName</label>
                                    <div class="col-md-9">
                                        <spring:input type="text" class="form-control" path="username" />
                                    </div>

                                    
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                        <spring:input type="password" class="form-control" path="password" />
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <spring:input type="text" class="form-control" path="email" />
                                    </div>
                                </div>
                            
                                
                                
                                
                                  <div class="form-group">
                                <label for="specialist" class="col-md-3 control-label">Specialist</label>
                                <div class="col-md-9">
								<spring:select path="specialist">
								    <spring:option value="Select">---Select Doctor's Department----</spring:option>
								    
                                    <spring:option  value="Family Physicians ">Family Physicians</spring:option>
									<spring:option  value="General Surgeons  ">General Surgeons</spring:option>
									<spring:option  value="Cardiologists ">Cardiologists</spring:option>
									<spring:option  value="Anesthesiologists  ">Anesthesiologists</spring:option>
									<spring:option  value="Pathologists  ">Pathologists</spring:option>
									<spring:option  value="Gastroenterologists  ">Gastroenterologists</spring:option>
									<spring:option  value="Emergency Medicine Specialists  ">Emergency Medicine Specialists</spring:option>
									<spring:option  value="Colon and Rectal Surgeons  ">Colon and Rectal Surgeons</spring:option>
									<spring:option  value="Critical Care Medicine Specialists ">Critical Care Medicine Specialists</spring:option>
									<spring:option  value="Dermatologists ">Dermatologists</spring:option>
									<spring:option  value="Infectious Disease Specialists ">Infectious Disease Specialists</spring:option>
									<spring:option  value="Endocrinologists ">Endocrinologists</spring:option>
									<spring:option  value="Urologists  ">Urologists</spring:option>
									<spring:option  value="Hematologists ">Hematologists</spring:option>
									<spring:option  value="Sports Medicine Specialists  ">Sports Medicine Specialists</spring:option>
									<spring:option  value="Medical Geneticists   ">Medical Geneticists</spring:option>
									<spring:option  value="Obstetricians and Gynecologists "> Obstetricians and Gynecologists</spring:option>
									<spring:option  value="Neurologists  ">Neurologists</spring:option>
									<spring:option  value="Plastic Surgeons">Plastic Surgeons</spring:option>
									<spring:option  value="Physiatrists  ">Physiatrists</spring:option>
									<spring:option  value="Psychiatrists   ">Psychiatrists</spring:option>
									<spring:option  value="Pulmonologists  ">Pulmonologists</spring:option>
								</spring:select>
							</div>
						</div>
                                
                                
                                
                                <div class="form-group">
                                <label for="timeshift" class="col-md-3 control-label">Timeshift</label>
                                <div class="col-md-9">
								<spring:select path="timeshift">
								    <spring:option value="Select">---Select Timeshift--</spring:option>
									<spring:option value="morning">Morning</spring:option>
									<spring:option value="day">Day</spring:option>
									<spring:option value="night">Night</spring:option>

								</spring:select>
							</div>
						</div>
                                
                                


						<div class="form-group">
                                    <label for="country" class="col-md-3 control-label">Country</label>
                                    <div class="col-md-9">
                                        <spring:input type="text" class="form-control" path="address.country" />
                                    </div>
                                </div>
                                
   
                                <div class="form-group">
                                    <label for="city" class="col-md-3 control-label">City</label>
                                    <div class="col-md-9">
                                        <spring:input type="text" class="form-control" path="address.city" />
                                    </div>
                                </div>
                                

                                <div class="form-group">
                                    <label for="street" class="col-md-3 control-label">Street</label>
                                    <div class="col-md-9">
                                        <spring:input type="text" class="form-control" path="address.street" />
                                    </div>
                                </div>
   

                                <div class="form-group">
                                    <!-- Button -->    
                                                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <input id ="doctorSignup" type="submit" value="Update" class="btn btn-primary" style="height:50px; width:150px;"><i class="icon-hand-right"></i>  
                                    </div>
                                </div>
 
 
 
 
                 <spring:hidden path="did" />
                
                <spring:hidden path="involveddate" />
                
                <input type ="hidden">

 

 
 </spring:form>
 </div>
</div>











</body>
</html>