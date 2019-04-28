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
<title>test page</title>
</head>
<body  style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med4.png');padding:20px;margin-top:-19px;width:1530px;height:1000px;background-repeat:no-repeat;">

 <div>
 
 <div style="position: absolute;border:2px solid blue;background-color:#FFFFC0;top: 250px;left:500"><a href="https://www.facebook.com"><h1>CLICK TO GO TO FACEBOOK</h1></a></div>
 
  <div style="position: absolute;border:2px solid blue;background-color:#FFFFC0;top: 150px;left:500"><a href="https://www.youtube.com"><h1>CLICK TO GO TO YOUTUBE</h1></a></div>
 
 
 <div style="position: absolute;border:2px solid blue;background-color:#FFFFC0;top: 350px;left:500"><a href="https://www.tiktok.com"><h1>CLICK TO GO TO TIK-TOK</h1></a></div>
            Click to login <input type="button" id="btnLogin"value ="           Click here   " />
        </div>
        <div id="locator" style="display:none;">
            <!-- your form controls -->
                    <div class="panel-heading" id= "locator1">
                        <div class="panel-title" >HELLO</div>
                    </div>
                    
                 <div style="padding-top:30px" class="panel-body" >

             <form id="doctorFeedbackform" class="form-horizontal" "role="form" action="test" method="post">



                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">

                                       <input type="submit" class="btn btn-success" id="btnSubmit" value ="login">


                                    </div>
                                </div>
                            </form>
                            </div>
            
            

        </div>
        <script  type="text/javascript">
            $(document).ready(function() {
                $('#btnLogin').click(function() {
                     $('#locator').show();
                });
                $('#btnSubmit').click(function() {
                         $('#inputForm').hide();
                         // collect form data
                         // make your AJAX request
                });
            });
        </script>






<!--   ===========================================================================================================================================                                                              





                                
            <table>
			<tr>
				<td><spring:input path="patient.email" /></td>
			</tr>

			<tr>
				<td><spring:input path="patient.username" /></td>
			</tr>

			<tr>
				<td><spring:input path="patient.password" /></td>
			</tr>

			<tr>
				<td><spring:input path="patient.bloodgroup" /></td>
			</tr>

			<tr>
				<td><spring:input path="patient.dob" type="date" /></td>
			</tr>

              
             <tr>
				<td><spring:radiobutton path="patient.gender" value="male" />Male 
				<spring:radiobutton path="patient.gender" value="female" />Female
				<spring:radiobutton path="patient.gender" value="other" />Other</td>
			</tr>
             

			<tr>
				<td><spring:input path="patient.address.did" /></td>
			</tr>

			<tr>
				<td><spring:input path="patient.address.country" /></td>
			</tr>

			<tr>
				<td><spring:input path="patient.address.city" /></td>
			</tr>
			
			<tr>
				<td><spring:input path="patient.address.state" /></td>
			</tr>			

			<tr>
				<td><spring:input path="patient.address.street" /></td>
			</tr>
			
			<tr>
				<td><spring:input path="patient.history.mid" /></td>
			</tr>

             <tr>
			<td><spring:input path="patient.history.lastvisit" /></td>
			</tr>
             
			<tr>
				<td><spring:input path="patient.history.Disease" /></td>
			</tr>
             
			<tr>
				<td><spring:input path="patient.history.lastfeedback" /></td>
			</tr>  			
             
             
			
		</table>
                                
                                
        
        
        
        
        
        

              <br>
              <br>

			<tr>
				<td><spring:input path="doctor.fname" /></td>
			</tr>  
                                    
			<tr>
				<td><spring:input path="doctor.fname" /></td>
			</tr>                                    


                                    

			<tr>
				<td><spring:input path="doctor.lname" /></td>
			</tr>
                                    
                  
			<tr>
				<td><spring:input path="doctor.email" /></td>
			</tr>

			<tr>
				<td><spring:input path="doctor.username" /></td>
			</tr>

			<tr>
				<td><spring:input path="doctor.password" /></td>
			</tr>






			<tr>
				<td><spring:input path="patient.dob" type="date" /></td>
			</tr>

              
             <tr>
				<td><spring:radiobutton path="doctor.gender" value="male" />Male 
				<spring:radiobutton path="doctor.gender" value="female" />Female
				<spring:radiobutton path="doctor.gender" value="other" />Other</td>
			</tr>
             

			<tr>
				<td><spring:input path="doctor.address.did" /></td>
			</tr>

			<tr>
				<td><spring:input path="doctor.address.country" /></td>
			</tr>

			<tr>
				<td><spring:input path="doctor.address.city" /></td>
			</tr>
			
			<tr>
				<td><spring:input path="doctor.address.state" /></td>
			</tr>	
        
			<tr>
				<td><spring:input path="doctor.address.street" /></td>
			</tr>        
        






============================================================================================================================================================== -->






</body>
</html>