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
<title>Patient Login</title>
</head>
<body >
<button type="button" class="btn btn-primary btn-block"><h2>Welcome To Online Clinic : ${userf} ${userl}</h2></button>
<button type="button" onClick="patientLogout()" style="margin-left:1435px;margin-top:-60px;" class="btn btn-success" style="margin-top: 5px;"><h4>Logout</h4></button>  
<!-- Start navbar -->
    <nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <h2 ><a class="navbar-brand" href="#" style="color:green;margin-left:-100px;">ONLINE CLINIC MANAGEMENT SYSTEM</a></h2>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
           <li class="active" style="color:bLue"><a href="#" onClick="$('#doctorTable').show();"><h4> HOME </h4></a></li> 
          </ul>
          <ul class="nav navbar-nav navbar-right">
               <li><a href="#" onClick="$('#doctorTable').show();$('#patientTable').hide();"><h4>View Doctors </h4></a></li>

              
              <li><a href="#" onClick="$('#appTable').show();$('#doctorTable').hide();$('#appTableA').hide();" ><h4> Requested Appointments</h4></a></li>

              <li><a href="#" onClick="$('#appTableA').show();$('#doctorTable').hide();$('#appTable').hide();" ><h4> Accepted Appointments</h4></a></li>

              
             <li><a href="gallery"><h4> View Gallery   </h4></a></li>
             
             
          </ul>
        </div> 
      </div>
    </nav>
    <!-- End navbar -->




 <!-------------------------------------------------- start of Doctor table view -------------------------------------------------->
 
	<div  style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med4.png');padding:20px;margin-top:-19px;width:1530px;height:1000px;background-repeat:no-repeat;">
	
	<div id="doctorTable" >
	
	<div>
	<button type="button" class="btn btn-primary btn-block" style="margin-top:-15px;"><h4>Below is the List of Doctors </h4></button>
	</div>
	
	<table id="myTabled" class="table table-bordered table-dark" style="background-color:#FFFFE0;">
		<thead>
			<tr class="sucess" style="background-color:#BDB76B;">
				<td>First Name</td>
				<td>Last Name</td>
				<td>Gender</td>
				<td>Email</td>
				<td>Specialist</td>
				<td>TimeShift</td>
				<td>Country</td>
				<td>City</td>
				<td>Action</td>
			</tr>

		</thead>


		<tbody>
			<c:forEach var="stud" items="${dlist}">
				<tr class="danger">
					<td>${stud.fname}</td>
					<td>${stud.lname}</td>
					<td>${stud.gender}</td>
					<td>${stud.email}</td>
					<td>${stud.specialist}</td>
					<td>${stud.timeshift}</td>
					<td>${stud.address.country}</td>
					<td>${stud.address.city}</td>

					<td><input type="submit" class="btn btn-success" onClick="viewDoctorDetails(${stud.did})"value="View Details">
					<input type="submit" class="btn btn-success" onClick="appointDoctor(${stud.did},${pid});verify();" value="Request Appointment">
					</td>
				</tr>
			</c:forEach>

		</tbody>


	</table>

   

	<script type="text/javascript">

	
	
      
      function viewDoctorDetails(id){
    	  
    	  window.location= "${pageContext.request.contextPath}/"+id+"/view";
  
      }

      
  function appointDoctor(did,pid){
    	  
	      var msg= confirm("Do you want to send Appointment Request to doctor??");
	      
	      if(msg==true){
    	  window.location= "${pageContext.request.contextPath}/"+pid+"/"+did+"/appointmentRequest";
	      }
	      
	      
      }
  
  
  $(document).ready( function () {
	    $('#myTabled').DataTable();
	} );
  
      </script>
</div>

	<!-- -----------------------End of Doctor table ---------------------------- -->


<!-- ----------------------------------------------------Start of Requested Appointment table ------------------------------------------------------------------------------------------ -->



<div id="appTable" style="display:none;">
	
	<div>
	<button type="button" class="btn btn-primary btn-block" style="margin-top:-15px;"><h4>Below is the List of Appointment Request Made By You </h4></button>
	</div>
	
	<table id="myTableapp" class="table table-bordered table-dark" style="background-color:#FFFFE0;" >
		<thead>
			<tr class="sucess" style="background-color:#BDB76B;">
				<td>Appointment Requested Date</td>
				<td>Doctor Name</td>
				<td>Category</td>
				<td>Status</td>
				<td>Action</td>

			</tr>

		</thead>


		<tbody onload="check(${applist});">
			<c:forEach var="stud" items="${applist}" >
			<c:if test="${stud.status=='Request pending'}">
				<tr class="danger" >
					<td>${stud.reqdate}</td>
					<td>${stud.doctor.fname} ${stud.doctor.lname} </td>
					<td>${stud.category}</td>
					<td>${stud.status}</td>
					<td>
					<input type="submit" class="btn btn-success"  onClick="deleteAppointment(${stud.aid},${stud.patient.pid})" value="Cancel Request Appointment" >
					</td>
				</tr>
				</c:if>
			</c:forEach>

		</tbody>


	</table>
	
	
		<script type="text/javascript">

	
	      
	function check(stud){

	    for(var key in stud) {
	        if(stud.hasOwnProperty(key))
	        	var msg= confirm("Sorry!! You do not have any sent Appointment");
	        return true
	    }

	      }

    function patientLogout(){
  	  
  	  window.location= "${pageContext.request.contextPath}/patientLogout";

    }
	
	
	function deleteAppointment(aid,pid){

	      var msg= confirm("Do you want to Cancel Request??");
	      
	      if(msg==true){
    	  window.location= "${pageContext.request.contextPath}/"+aid+"/"+pid+"/cancelAppointment";
	      }
	      }     

  
  
  $(document).ready( function () {
	    $('#myTableapp').DataTable();
	} );
  
      </script>
	
	
	
	
	</div>
<!-- ----------------------------------------------------End of Requested Appointment table ------------------------------------------------------------------------------------------ -->	


<!-- ----------------------------------------------------Start of Accepted Appointment table ------------------------------------------------------------------------------------------ -->



<div id="appTableA" style="display:none;">
	
	<div>
	<button type="button" class="btn btn-primary btn-block" style="margin-top:-15px;"><h4>Below is the List of Accepted Appointment  </h4></button>
	</div>
	
	<table id="myTableapp" class="table table-bordered table-dark" style="background-color:#FFFFE0;" >
		<thead>
			<tr class="sucess" style="background-color:#BDB76B;">
				<td>Visit Date</td>
				<td>Doctor Name</td>
				<td>Category</td>
				<td>Status</td>
				<td>Doctor Feedback</td>
				<td>Action</td>

			</tr>

		</thead>


		<tbody >
			<c:forEach var="stud" items="${appRlist}" >
				<tr class="danger" >
					<td>${stud.appdate}</td>
					<td>${stud.docFname} ${stud.docLname} </td>
					<td>${stud.category}</td>
					<td>${stud.status}</td>
					<td>${stud.docFeedback}</td>
					<td>
					<input type="submit" class="btn btn-success"  onClick="sendFeedback(${stud.aid})" value="Send Feedback" >
					</td>
				</tr>

			</c:forEach>

		</tbody>


	</table>
	
	
<script type="text/javascript">


	
	function sendFeedback(aid){

	      var msg= confirm("Do you want to send Feedback to Doctor??");
	      
	      if(msg==true){
     	  window.location= "${pageContext.request.contextPath}/"+aid+"/feedbackAppointment";
	      }
	      }     

  
  
  $(document).ready( function () {
	    $('#myTableapp').DataTable();
	} );
  
      </script>
	
	
	
	
	</div>
<!-- ----------------------------------------------------End of Accepted Appointment table ------------------------------------------------------------------------------------------ -->	










</div>
</body>
</html>