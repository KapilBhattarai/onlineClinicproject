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
<title>Accept appointment</title>
</head>
<body style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med4.png');padding:20px;margin-top:-19px;width:1530px;height:1000px;background-repeat:no-repeat;">
<button type="button" class="btn btn-primary btn-block"><h2>Welcome To Online Clinic : ${user}</h2></button>  







        <div id="addDoctor" margin-top:-10px;margin-left:450px;width:600;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                    <div class="panel-title"><h4>Please Enter the Visit Date For Patient</h4></div></div>
                         
                        </div>  
                        <div class="panel-body" style="background-color:#FFFFE0;margin-top:-20px">

 <spring:form  class="form-horizontal" action="${pageContext.request.contextPath}/updateAppointment" method="post" modelAttribute="Appinfo" >
 
 
 
 						<div class="form-group">
                                  <label for="appointmentDate" class="col-md-3 control-label">Request Date</label>     
                              <div style="margin-bottom: 5px;margin-left: 5px;" class="input-group">
                                        <spring:input path="reqdate" type="date" class="form-control" readonly="true" />                                       
                                    </div>
                                </div> 
 
                       <div class="form-group">
                      <label for="firstname" class="col-md-3 control-label">Appointment ID</label>
                                <div class="col-md-9">
                                   <spring:input path="appid" class="form-control" readonly="true"/>
                               </div>
                               </div>
  
                                
 						<div class="form-group">
							<label for="lastname" class="col-md-3 control-label">Patient name</label>
							<div class="col-md-9">
								<spring:input path="patFname" class="form-control" readonly="true" />
								<spring:input path="patLname" class="form-control" readonly="true" />
							</div>
                                </div>
                                
                                
						<div class="form-group">
                                    <label for="username" class="col-md-3 control-label">Patient Date of Birth</label>
                                    <div class="col-md-9">
                                        <spring:input  class="form-control" path="patDob" type="date" readonly="true"/>
                                    </div>
 
                                </div>                                
                                

						<div class="form-group">
                                    <label for="username" class="col-md-3 control-label">Assign date</label>
                                    <div class="col-md-9">
                                        <spring:input  class="form-control" path="appdate" type="date"/>
                                    </div>
 
                                </div>                                
                                
                                
                                <div class="form-group">
                                        <spring:hidden  class="form-control" path="docFeedback" />
                                </div>
                                
                                

                                <div class="form-group">
                                    <!-- Button -->    
                                                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <input id ="doctorSignup" type="submit" value="Accept Appointment" class="btn btn-primary" style="height:50px; width:150px;"><i class="icon-hand-right"></i>  
                                    </div>
                                </div>
                                 
                            
                                
                                

 
 
                <spring:hidden path="aid" />
                
                <spring:hidden path="category" />
                
                <spring:hidden path="status" />

				<spring:hidden path="patFeedback" />

				<spring:hidden path="did" />
				
				<spring:hidden  path="pid" />

				<spring:hidden path="docFname"  />

				<spring:hidden path="docLname"/>
				
				<spring:hidden path="patGender"/>				
                
                <input type ="hidden">

 

 
 </spring:form>
 </div>
</div>











</body>
</html>