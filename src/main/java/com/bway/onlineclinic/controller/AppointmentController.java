package com.bway.onlineclinic.controller;

import java.sql.Date;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bway.onlineclinic.dao.AppointmentDao;
import com.bway.onlineclinic.dao.AppointmentHistoryDao;
import com.bway.onlineclinic.dao.DoctorDao;
import com.bway.onlineclinic.dao.PatientDao;
import com.bway.onlineclinic.model.Appointment;
import com.bway.onlineclinic.model.AppointmentHistory;
import com.bway.onlineclinic.model.Doctor;
import com.bway.onlineclinic.model.Patient;

@Controller
public class AppointmentController {
	
	
	@Autowired
	private PatientDao pdao;
	
	@Autowired
	private DoctorDao ddao;
	
	@Autowired
	private AppointmentDao adao;
	
	@Autowired
	private AppointmentHistoryDao ahdao;
	
	


	@RequestMapping(value="/{aid}/acceptAppointment", method=RequestMethod.GET)
	public String edit(@PathVariable("aid") int aid,Model model,HttpSession session ) {
		
		
		
//==========================================create appointment history==================================
		Appointment a= adao.getById(aid);
		Patient p= a.getPatient();
		Doctor d= a.getDoctor();
		AppointmentHistory ah=new AppointmentHistory();
		ah.setDocFname(d.getFname());
		ah.setDocLname(d.getLname());
		ah.setPatFname(p.getFname());
		ah.setPatLname(p.getLname());
		ah.setCategory(a.getCategory());
		ah.setDid(d.getDid());
		ah.setPid(p.getPid());
		ah.setStatus("Request accepted");
		ah.setAppid(a.getAid());
		ah.setReqdate(a.getReqdate());
		ah.setAppdate(a.getAppdate());
		ah.setPatGender(p.getGender());
		ah.setPatDob(p.getDob());

//==========================================end of create appointment history==================================		
		
		model.addAttribute("Appinfo",ah);
		return "EditAppointment";
	}	
	
	
	
	
	@RequestMapping(value="/{pid}/{did}/appointmentRequest", method=RequestMethod.GET)
	public String delete(@PathVariable("did") int did,@PathVariable("pid") int pid,Model model,HttpSession session) {

		     Patient p=pdao.getById(pid);
		     Doctor d=ddao.getById(did);
			 AppointmentHistory ah=new AppointmentHistory();

			if(pdao.patientLogin(p.getUsername(),p.getPassword())) {
		

				
				model.addAttribute("plist", pdao.getAll());
	            model.addAttribute("dlist", ddao.getAll());
				
				model.addAttribute("userf",p.getFname());
				model.addAttribute("userl",p.getLname());
				model.addAttribute("pid",p.getPid());
				model.addAttribute("test","0");
				
				
	//===========================================add appointment==================================			
				int flag=0;

		     for(Appointment a:adao.getAll()) {
		    	 Doctor d1=a.getDoctor();
		    	 Patient p1=a.getPatient();
			        if(p.getPid()==p1.getPid() && d.getDid()==d1.getDid()) {
			        	flag=1;
			        	break;
			        }

				}
		     if(flag==0) {
				Appointment a = new Appointment();
				a.setCategory(d.getSpecialist());
				a.setStatus("Request pending");
				a.setReqdate(new Date(System.currentTimeMillis()));
				a.setAppdate(new Date(System.currentTimeMillis()));
				a.setDoctor(d);
				a.setPatient(p);
				
				adao.addAppointment(a);
				
				
		     }else {
		    	 model.addAttribute("test",p.getPid());
		    	 
		     }
				
	//===========================================End of add appointment==================================			
		     model.addAttribute("appRlist",ahdao.getPatientAppointment(p.getPid()));
		     model.addAttribute("applist",adao.getPatientAppointment(p.getPid()));
				return "PatientPage";

			}
			
		return"PatientLogin";
	}
	
	
	
	
	
	
	@RequestMapping(value="/{aid}/{pid}/cancelAppointment", method=RequestMethod.GET)
	public String deleteDoctor(@PathVariable("aid") int aid,@PathVariable("pid") int pid,Model model,HttpSession session) {
		
     adao.removeAppointment(aid);
     Patient p=pdao.getById(pid);
     
     
		model.addAttribute("plist", pdao.getAll());
        model.addAttribute("dlist", ddao.getAll());
		
		model.addAttribute("userf",p.getFname());
		model.addAttribute("userl",p.getLname());
		model.addAttribute("pid",p.getPid());     
     
     
		if(StringUtils.isEmpty(session.getAttribute("activeuser")))
		{
			
			return"PatientLogin";
		}
     
	     model.addAttribute("appRlist",ahdao.getPatientAppointment(p.getPid()));
	     model.addAttribute("applist",adao.getPatientAppointment(p.getPid()));    

//		return"redirect:/PatientPage";
		return"PatientPage";
	}
	
	
	
	@RequestMapping(value= "/updateAppointment", method=RequestMethod.POST)
	public String updateAppointment(@ModelAttribute AppointmentHistory ah,Model model,HttpSession session) {
		
        int pid=ah.getPid();
        Patient p=pdao.getById(pid);
        ah.setPatDob(p.getDob());
		ahdao.addAppointment(ah);
		
		int aid=ah.getAppid();
		adao.removeAppointment(aid);
		int did=ah.getDid();
		Doctor d=ddao.getById(did);

		
		model.addAttribute("plist", pdao.getAll());
        model.addAttribute("dlist", ddao.getAll());

		model.addAttribute("userf",d.getFname());
		model.addAttribute("userl",d.getLname());
		model.addAttribute("pid",d.getDid());
		model.addAttribute("spc",d.getSpecialist());
		
		model.addAttribute("applist",adao.getDoctorAppointment(d.getDid()));
		model.addAttribute("appRlist",ahdao.getDoctorAppointment(d.getDid()));
		
		return"DoctorPage";
	}
	
	
	
@RequestMapping(value="/{aid}/checkedAppointment", method=RequestMethod.GET)
public String doctorFeedback(@PathVariable("aid") int aid,Model model,HttpSession session ) {
		
		AppointmentHistory a= ahdao.getById(aid);
	
		
		model.addAttribute("Appinfo",a);
		return "doctorFeedback";
	}



@RequestMapping(value= "/doctorFeedback", method=RequestMethod.POST)
public String checkedAppointment(@ModelAttribute AppointmentHistory ah,Model model,HttpSession session) {
	

	ah.setStatus("Checked");
	ahdao.updateAppointment(ah);
	
	int did=ah.getDid();
	Doctor d=ddao.getById(did);

	
	model.addAttribute("plist", pdao.getAll());
    model.addAttribute("dlist", ddao.getAll());

	model.addAttribute("userf",d.getFname());
	model.addAttribute("userl",d.getLname());
	model.addAttribute("pid",d.getDid());
	model.addAttribute("spc",d.getSpecialist());
	
	model.addAttribute("applist",adao.getDoctorAppointment(d.getDid()));
	model.addAttribute("appRlist",ahdao.getDoctorAppointment(d.getDid()));
	
	return"DoctorPage";
}


@RequestMapping(value="/{aid}/feedbackAppointment", method=RequestMethod.GET)
public String patientFeedback(@PathVariable("aid") int aid,Model model,HttpSession session ) {
		
		AppointmentHistory a= ahdao.getById(aid);
	
		
		model.addAttribute("Appinfo",a);
		return "patientFeedback";
	}	
	
@RequestMapping(value= "/patientFeedbackAppointment", method=RequestMethod.POST)
public String feedbackAppointment(@ModelAttribute AppointmentHistory ah,Model model,HttpSession session) {
	
	ahdao.updateAppointment(ah);
	
	int pid=ah.getPid();
	Patient p=pdao.getById(pid);

	
	model.addAttribute("plist", pdao.getAll());
    model.addAttribute("dlist", ddao.getAll());

	model.addAttribute("userf",p.getFname());
	model.addAttribute("userl",p.getLname());
	model.addAttribute("pid",p.getPid());
	
	model.addAttribute("applist",adao.getPatientAppointment(p.getPid()));
	model.addAttribute("appRlist",ahdao.getPatientAppointment(p.getPid()));
	
	return"PatientPage";
}

	
	

}
