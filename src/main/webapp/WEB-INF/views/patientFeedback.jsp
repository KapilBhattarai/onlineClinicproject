<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<html>
<head>

    <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style1.css">
	

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dataTables.bootstrap.css">
    
    <script  type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.js"></script>


<meta charset="ISO-8859-1">
<title>Doctor Login</title>
</head>
<body style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med4.png');padding:20px;margin-top:-19px;width:1530px;height:1000px;background-repeat:no-repeat;">



<!-- ========================================doctor feedback box==================================================================== -->
        <div id="locator">
            <!-- your form controls -->
                    <div class="panel-heading" id= "locator1">
                        <div class="panel-title" >Please Send Feedback To Your Doctor</div>
                    </div>
                    
                 <div style="padding-top:30px" class="panel-body" >

  <spring:form id="doctorFeedbackform" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/patientFeedbackAppointment" method="post"  modelAttribute="Appinfo">


                                
 						<div class="form-group">
							<label for="lastname" class="col-md-3 control-label">Doctor name</label>
							<div class="col-md-9">
								<spring:input path="docFname" class="form-control" readonly="true" />
								<spring:input path="docLname" class="form-control" readonly="true" />
							</div>
                                </div>
                                
						<div class="form-group">
                                    <label for="username" class="col-md-3 control-label">Date OF Visit</label>
                                    <div class="col-md-9">
                                        <spring:input  class="form-control" path="appdate" type="date" readonly="true"/>
                                    </div>
                                </div>                                 


                              <div class="form-group">
                                 <label for="msg" class="col-md-3 control-label">Type your Feedback</label>
                                <spring:textarea path="patFeedback" rows="5" cols="39" name="msg"/>
                             </div>

                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                                    <div class="col-sm-12 controls">
                                       <input type="submit" class="btn btn-success" id="btnSubmit"  style="height:50px; width:150px;margin-left:150px;" value ="Send Feedback">
                                    </div>
                                </div>
                      <!-- =====hidden items========= -->
                                
                                

                           <spring:hidden path="reqdate"  class="form-control" readonly="true" />
                           <spring:hidden path="appid" class="form-control"/>
                                   <spring:hidden  class="form-control" path="patDob" readonly="true"/>
                                      <spring:hidden  class="form-control" path="appdate" />
                                

          
                <spring:hidden path="aid" />
                
                <spring:hidden path="category" />
                
                <spring:hidden path="status" />

				<spring:hidden path="docFeedback" />

				<spring:hidden path="did" />
				
				<spring:hidden  path="pid" />

				<spring:hidden path="patFname"  />

				<spring:hidden path="patLname"/>
				
				<spring:hidden path="patGender"/>				
                
                <input type ="hidden">
                                
     <!-- =====hidden items========= -->                           
                                
                                
                                
           </spring:form>
          </div>
      </div>
        
        
<!-- ========================================doctor feedback box==================================================================== -->





</body>
</html>