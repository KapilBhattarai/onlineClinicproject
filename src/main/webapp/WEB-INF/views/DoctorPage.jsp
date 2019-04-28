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
<body>
<button type="button" class="btn btn-primary btn-block"><h2>Welcome To Online Clinic : DR.${userf} ${userl} [${spc}]</h2></button> 
<button type="button" onClick="doctorLogout()" style="margin-left:1435px;margin-top:-60px;" class="btn btn-success"><h4>Logout</h4></button>  
<!-- Start navbar -->
    <nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <h3 ><a class="navbar-brand" href="#" style="color:green;margin-left:-200px;">ONLINE CLINIC MANAGEMENT SYSTEM</a></h3>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
           <li class="active" style="color:bLue"><a href="#" onClick="$('#addDoctor').hide();$('#doctorRegidterForm').hide();$('#doctorTable').show();$('#patientTable').show();"><h4> HOME </h4></a></li> 
          </ul>
          <div style="margin-left:50px;">
          <ul class="nav navbar-nav navbar-right">
               <li><a href="#" onClick="$('#doctorTable').show();$('#patientTable').hide();$('#doctorRegidterForm').hide();"><h4>View Doctors </h4></a></li>
               
              <li><a href="#" onClick="$('#appTable').show();$('#doctorTable').hide();"><h4> Appointment Requests</h4></a></li>
              
               <li><a href="#" onClick="$('#appTableA').show();$('#doctorTable').hide();$('#appTable').hide();"><h4> Approved Appointments</h4></a></li>
              
              <li><a href="#" onClick="$('#appTableC').show();$('#doctorTable').hide();$('#appTable').hide();$('#appTableA').hide();" ><h4>Checked Appointments</h4></a></li>

             <li><a href="gallery"><h4>Gallery   </h4></a></li>
                          
               
          </ul>
          </div>
        </div> 
      </div>
    </nav>
    <!-- End navbar -->
    
    
    
    
    
    
    
    
    
    
     <!-------------------------------------------------- start of Doctor table view -------------------------------------------------->
	
	<div id="doctorTable" style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med4.png');padding:20px;margin-top:-19px;width:1530px;height:1000px;background-repeat:no-repeat;">
	
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
				<td>Involved Date</td>
				<td>Country</td>
				<td>City</td>
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
					<td>${stud.involveddate}</td>
					<td>${stud.address.country}</td>
					<td>${stud.address.city}</td>

				</tr>
			</c:forEach>

		</tbody>


	</table>

   

	<script type="text/javascript">
  
	
    function doctorLogout(){
    	  
    	  window.location= "${pageContext.request.contextPath}/doctorLogout";

      }
	
	
  
  $(document).ready( function () {
	    $('#myTabled').DataTable();
	} );
  
      </script>
</div>
	<!-- -----------------------End of Doctor table ---------------------------- -->
	
	
	<!-- ----------------------------------------------------Start of Appointment request  table ------------------------------------------------------------------------------------------ -->



<div id="appTable" style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med4.png');padding:20px;margin-top:-19px;width:1530px;height:1000px;background-repeat:no-repeat;display:none;">
	
	<div>
	<button type="button" class="btn btn-primary btn-block" style="margin-top:-15px;"><h4>Below is the List of Appointment Request From Patients </h4></button>
	</div>
	
	<table id="myTableapp" class="table table-bordered table-dark" style="background-color:#FFFFE0;" >
		<thead>
			<tr class="sucess" style="background-color:#BDB76B;">
				<td>Appointment Requested Date</td>
				<td>Patient Name</td>
				<td>Patient Address</td>
				<td>Patient Gender</td>
				<td>Patient DOB</td>
				<td>Status</td>
				<td>Action</td>

			</tr>

		</thead>


		<tbody onload="check(${applist});">
			<c:forEach var="stud" items="${applist}" >
			<c:if test="${stud.status=='Request pending'}">
				<tr class="danger" >
					<td>${stud.reqdate}</td>
					<td>${stud.patient.fname} ${stud.patient.lname} </td>
					<td>${stud.patient.address.street},${stud.patient.address.city},${stud.patient.address.country} </td>
					<td>${stud.patient.gender} </td>
					<td>${stud.patient.dob}</td>
					<td>${stud.status}</td>
					<td>
					<input type="submit" class="btn btn-success" id="btnAccept" value="Accept Request" onClick="updateAppointment(${stud.aid});">
					</td>
				</tr>
				</c:if>
			</c:forEach>

		</tbody>


	</table>

	<script type="text/javascript">

    function updateAppointment(id){
  	  
  	  window.location= "${pageContext.request.contextPath}/"+id+"/acceptAppointment";

    }
      

  
  
  $(document).ready( function () {
	    $('#myTableapp').DataTable();
	} );
  
  
  
  
  
      </script>

	</div>
<!-- ----------------------------------------------------End of Appointment table ------------------------------------------------------------------------------------------ -->	



<!-- ----------------------------------------------------Start of Accepted Appointment request  table ------------------------------------------------------------------------------------------ -->



<div id="appTableA" style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med4.png');padding:20px;margin-top:-19px;width:1530px;height:1000px;background-repeat:no-repeat;display:none;">
	
	<div>
	<button type="button" class="btn btn-primary btn-block" style="margin-top:-15px;"><h4>Below is the List of Approved Appointment Requests</h4></button>
	</div>
	
	<table id="myTableapp" class="table table-bordered table-dark" style="background-color:#FFFFE0;" >
		<thead>
			<tr class="sucess" style="background-color:#BDB76B;">
				<td>Visit Date</td>
				<td>Patient Name</td>
				<td>Category</td>
				<td>Patient Gender</td>
				<td>Patient DOB</td>
				<td>Status</td>
				<td>Patient Feedback</td>
				<td>Action</td>

			</tr>

		</thead>


		<tbody onload="check(${appRlist});">
			<c:forEach var="stud" items="${appRlist}" >
			<c:if test="${stud.status=='Request accepted'}">
				<tr class="danger" >
					<td>${stud.appdate}</td>
					<td>${stud.patFname} ${stud.patLname} </td>
					<td>${stud.category}</td>
					<td>${stud.patGender}</td>
					<td>${stud.patDob}</td>
					<td>${stud.status}</td>
					<td>${stud.patFeedback}</td>
					<td>
					<input type="submit" class="btn btn-success"  onClick="checkedAppointment(${stud.aid});" value="Mark Checked">
					</td>
				</tr>
				</c:if>
			</c:forEach>

		</tbody>


	</table>



	<script type="text/javascript">

    function checkedAppointment(id){
  	  
 	  window.location= "${pageContext.request.contextPath}/"+id+"/checkedAppointment";

    }
      

  
  
  $(document).ready( function () {
	    $('#myTableapp').DataTable();
	} );
  
  
  
  
  
      </script>

	</div>
<!-- ----------------------------------------------------End of Accepted Appointment table ------------------------------------------------------------------------------------------ -->	

<!-- ----------------------------------------------------Start of Checked Appointment request  table ------------------------------------------------------------------------------------------ -->



<div id="appTableC" style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med4.png');padding:20px;margin-top:-19px;width:1530px;height:1000px;background-repeat:no-repeat;display:none;">
	
	<div>
	<button type="button" class="btn btn-primary btn-block" style="margin-top:-15px;"><h4>Below is the List of Visited Appointment Requests</h4></button>
	</div>
	
	<table id="myTableapp" class="table table-bordered table-dark" style="background-color:#FFFFE0;" >
		<thead>
			<tr class="sucess" style="background-color:#BDB76B;">
				<td>Visit Date</td>
				<td>Patient Name</td>
				<td>Patient Gender</td>
				<td>Patient DOB</td>
				<td>Status</td>
				<td>Your Feedback</td>
				<td>Patient Feedback</td>

			</tr>

		</thead>


		<tbody onload="check(${appRlist});">
			<c:forEach var="stud" items="${appRlist}" >
			<c:if test="${stud.status=='Checked'}">
				<tr class="danger" >
					<td>${stud.appdate}</td>
					<td>${stud.patFname} ${stud.patLname} </td>
					<td>${stud.patGender}</td>
					<td>${stud.patDob}</td>
					<td>${stud.status}</td>
					<td>${stud.docFeedback}</td>
					<td>${stud.patFeedback}</td>
				</tr>
				</c:if>
			</c:forEach>

		</tbody>


	</table>



	<script type="text/javascript">

      

  
  
  $(document).ready( function () {
	    $('#myTableapp').DataTable();
	} );
  
  
  
  
  
      </script>

	</div>
<!-- ----------------------------------------------------End of Checked Appointment table ------------------------------------------------------------------------------------------ -->	


    
    
    
    
    </body>
</html>