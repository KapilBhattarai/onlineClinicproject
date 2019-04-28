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
<body>
<button type="button" class="btn btn-primary btn-block"><h2>Welcome To Online Clinic : ${user}</h2></button> 
 <button type="button" onClick="adminLogout()" class="btn btn-success" style="margin-left:1435px;margin-top:-60px;"><h4>Logout</h4></button> 
<!-- Start navbar -->
    <nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <h2 ><a class="navbar-brand" href="#" style="color:green;margin-left:-100px;">ONLINE CLINIC MANAGEMENT SYSTEM</a></h2>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
           <li class="active" style="color:bLue"><a href="#" onClick="$('#addDoctor').hide();$('#doctorRegidterForm').hide();$('#doctorTable').show();$('#patientTable').show();"><h4> HOME </h4></a></li> 
          </ul>
          <ul class="nav navbar-nav navbar-right">
               <li><a href="#" onClick="$('#doctorTable').show();$('#patientTable').hide();$('#doctorRegidterForm').hide();"><h4>View Doctors </h4></a></li>
               
              <li><a href="#" onClick="$('#doctorTable').hide();$('#doctorRegidterForm').hide();$('#patientTable').show();"><h4> View Patients</h4></a></li>
                           
               <li><a href="gallery"><h4> View Gallery   </h4></a></li> 
               
               <button type="button" onClick="$('#formLoad').show();"class="btn btn-success" style="margin-top: 5px;"><h4>Upload Image</h4></button>
                         
             
          </ul>
        </div> 
      </div>
    </nav>
    <!-- End navbar -->


       <div id="formLoad" style="position: absolute;background-color:#FFFFC0;top: 157px;left: 1232px;display:none;" >
      <form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
      
        Select File  :  <input type="file" style="margin-left:5px;" name="file"> 
        				<input type="submit" style="margin-top:10px;margin-left:5px;"class="btn btn-success" value="upload">
      
      </form>               
               
               
               
               </div>









 <!-------------------------------------------------- start of Doctor table view -------------------------------------------------->
	
	<div id="doctorTable" style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med1.jpg');padding:20px;margin-top:-19px;width:1525px;height:630px;background-repeat:no-repeat;">
	
	<div>
	<button type="button" class="btn btn-primary btn-block" style="margin-top:-15px;"><h4>Below is the List of Doctors </h4></button>
	<a href="#"  class="btn btn-primary" onClick="$('#addDoctor').show();$('#doctorRegidterForm').show();$('#patientTable').hide();$('#doctorTable').hide();" > <h4 style="padding-left: 625;padding-right: 635"> Click To Add New Doctor</h4></a>
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
					<td>${stud.involveddate}</td>
					<td>${stud.address.country}</td>
					<td>${stud.address.city}</td>

					<td><input type="submit" class="btn btn-success" onClick="editDoctor(${stud.did})"value="Edit"> 
					<input type="submit"    class="btn btn-success"  onClick="deleteDoctor(${stud.did})" value="Delete"></td>   
				</tr>
			</c:forEach>

		</tbody>


	</table>

   

	<script type="text/javascript">
      
      function editDoctor(id){
    	  
    	  window.location= "${pageContext.request.contextPath}/"+id+"/editdoctor";
  
      }
      
      function adminLogout(){
    	  
    	  window.location= "${pageContext.request.contextPath}/adminLogout";
  
      }
            
      
      
  function deleteDoctor(id){
    	  
	      var msg= confirm("Do you want to delete??");
	      
	      if(msg==true){
    	  window.location= "${pageContext.request.contextPath}/"+id+"/deleteDoctor";
	      }
      }
  
  
  $(document).ready( function () {
	    $('#myTabled').DataTable();
	} );
  
      </script>
</div>
	<!-- -----------------------End of Doctor table ---------------------------- -->





	<!-- ==============================================  start of patient table view ================================================= -->
	
	<div id="patientTable" style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med1.jpg');padding:20px;margin-top:-19px;width:1525px;height:700px;background-repeat:no-repeat;">
	<div><button type="button" class="btn btn-primary btn-block"><h4>Below is the List of Patients</h4></button> </div><br>
	
	<table id="myTablep" class="table table-bordered table-dark" style="background-color:#FFFFE0;">
		<thead>
			<tr class="sucess" style="background-color:#BDB76B;">
				<td>First Name</td>
				<td>Last Name</td>
				<td>Email</td>
				<td>Blood group</td>
				<td>Country</td>
				<td>City</td>
				<td>Action</td>
			</tr>

		</thead>


		<tbody>
			<c:forEach var="stud" items="${plist}">
				<tr class="danger">
					<td>${stud.fname}</td>
					<td>${stud.lname}</td>
					<td>${stud.email}</td>
					<td>${stud.bloodgroup}</td>
					<td>${stud.address.country}</td>
					<td>${stud.address.city}</td>

					<td>
					   <input type="submit" class="btn btn-success" onClick="editPatient(${stud.pid})" value="Edit">
					   <input type="submit" class="btn btn-success" onClick="deletePatient(${stud.pid})" value="Delete"> 
						</td>
				</tr>
			</c:forEach>

		</tbody>


	</table>

	<script type="text/javascript">
      
      function editPatient(id){
    	  
    	  window.location= "${pageContext.request.contextPath}/"+id+"/editpatient";
  
      }
      
  function deletePatient(id){
    	  
	      var msg= confirm("Do you want to delete??");
	      
	      if(msg==true){
    	  window.location= "${pageContext.request.contextPath}/"+id+"/deletePatient";
	      }
      }
  
  
  $(document).ready( function () {
	    $('#myTablep').DataTable();
	} );
  
      </script>
</div>
	<!-- ----------------=====================-------End of Patient table ------=======================---------------------- -->
    
    
    
    
    
    
   
    
    
    
    
    
     <!-----------------========================------------------ Start of Add Doctor Box--------======================---------------------------------->
           
 
        <div id="doctorRegidterForm" style="background-image:url('${pageContext.request.contextPath}/resources/imgs/med4.png');padding:20px;margin-top:-19px;width:1530px;height:1000px;background-repeat:no-repeat;display:none;">
      
           
        <div id="addDoctor" style="display:none; margin-top:-10px;margin-left:450px;width:600;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title"><h4>Enter Details Below To Register Doctor</h4></div></div>
                            <div style="float:right; font-size: 85%; position: relative; top:-35px"><a id="cancelRegistrationLink" href="#" onclick="$('#addDoctor').hide();$('#doctorRegidterForm').hide();$('#doctorTable').show();$('#patientTable').show();"> <h4> Cancel Registration </h4></a></div>
                        </div>  
                        <div class="panel-body" style="background-color:#FFFFE0;margin-top:-20px">
                            <form id="signupform" class="form-horizontal" role="form" action="DoctorSignup" method="post" onsubmit="return required()">
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
      
      

                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">First Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="fname" placeholder="Enter First Name">
                                    </div>
                                </div>
						<div class="form-group">
							<label for="lastname" class="col-md-3 control-label">Last Name</label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="lname" placeholder="Enter Last Name">
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
                                    <label for="username" class="col-md-3 control-label">UserName</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="username" placeholder="Enter username">
                                    </div>

                                    
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" name="password" placeholder="Enter Password">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="email" placeholder="Enter Email">
                                    </div>
                                </div>
                            
                                
                                
                                
                                  <div class="form-group">
                                <label for="specialist" class="col-md-3 control-label">Specialist</label>
                                <div class="col-md-9">
								<select name="specialist">
								    <option value="Select">---Select Doctor's Department----</option>
								    
                                    <option value="Family Physicians ">Family Physicians</option>
									<option value="General Surgeons  ">General Surgeons</option>
									<option value="Cardiologists ">Cardiologists</option>
									<option value="Anesthesiologists  ">Anesthesiologists</option>
									<option value="Pathologists  ">Pathologists</option>
									<option value="Gastroenterologists  ">Gastroenterologists</option>
									<option value="Emergency Medicine Specialists  ">Emergency Medicine Specialists</option>
									<option value="Colon and Rectal Surgeons  ">Colon and Rectal Surgeons</option>
									<option value="Critical Care Medicine Specialists ">Critical Care Medicine Specialists</option>
									<option value="Dermatologists ">Dermatologists</option>
									<option value="Infectious Disease Specialists ">Infectious Disease Specialists</option>
									<option value="Endocrinologists ">Endocrinologists</option>
									<option value="Urologists  ">Urologists</option>
									<option value="Hematologists ">Hematologists</option>
									<option value="Sports Medicine Specialists  ">Sports Medicine Specialists</option>
									<option value="Medical Geneticists   ">Medical Geneticists</option>
									<option value="Obstetricians and Gynecologists "> Obstetricians and Gynecologists</option>
									<option value="Neurologists  ">Neurologists</option>
									<option value="Plastic Surgeons">Plastic Surgeons</option>
									<option value="Physiatrists  ">Physiatrists</option>
									<option value="Psychiatrists   ">Psychiatrists</option>
									<option value="Pulmonologists  ">Pulmonologists</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
                                    <label for="involveddate" class="col-md-3 control-label">Involved Date</label>
                                    <div class="col-md-9">
                                        <input id="today" type="date" class="form-control" name="involveddate" >
                                    </div>
                                </div>
                                
                                
                                
                                <div class="form-group">
                                <label for="timeshift" class="col-md-3 control-label">Timeshift</label>
                                <div class="col-md-9">
								<select name="timeshift">
								    <option value="Select">---Select Timeshift--</option>
									<option value="morning">Morning</option>
									<option value="day">Day</option>
									<option value="night">Night</option>

								</select>
							</div>
						</div>
                                
                                


						<div class="form-group">
                                    <label for="country" class="col-md-3 control-label">Country</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="address.country" placeholder="Enter country name">
                                    </div>
                                </div>
                                
   
                                <div class="form-group">
                                    <label for="city" class="col-md-3 control-label">City</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="address.city" placeholder="Enter city name">
                                    </div>
                                </div>
                                

                                <div class="form-group">
                                    <label for="street" class="col-md-3 control-label">Street</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="address.street" placeholder="Enter street name">
                                    </div>
                                </div>
   

                                <div class="form-group">
                                    <!-- Button -->    
                                                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <input id ="doctorSignup" type="submit" class="btn btn-primary" style="height:50px; width:150px;"><i class="icon-hand-right"></i>  
                                    </div>
                                </div>
                                
                                 </form> 
                                </div>
                                
                                    
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
                            
                            

                            var empt = document.forms["signupform"]["specialist"].value;
                            if (empt == "Select")
                            {
                            alert("Please Select Doctor's department");
                            return false;
                            }

                            
                            
                            var empt = document.forms["signupform"]["timeshift"].value;
                            if (empt == "Select")
                            {
                            alert("Please Select Doctor's Time Shift");
                            return false;
                            }                            
                            
                            var empt = document.forms["signupform"]["address.country"].value;
                            if (empt == "")
                            {
                            alert("Please Fill Doctor's Country name");
                            return false;
                            }                            
                            
                            
                            
                            
                            
                            }
                            


                            
                            
                            
                            
                            </script>
         
         
                


         <!------------------=========================----------------- End of Add Doctor Box------===========================------------------------------------>              
                                
                                
    
    
    
    
    
    
    
    
    



</body>
</html>