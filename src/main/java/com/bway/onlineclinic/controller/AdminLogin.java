package com.bway.onlineclinic.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bway.onlineclinic.dao.AppointmentDao;
import com.bway.onlineclinic.dao.DoctorDao;
import com.bway.onlineclinic.dao.PatientDao;
import com.bway.onlineclinic.model.Appointment;
import com.bway.onlineclinic.model.Doctor;
import com.bway.onlineclinic.model.Patient;
import com.bway.onlineclinic.model.User;


@Controller
public class AdminLogin {
	
	
	@Autowired
	private PatientDao pdao;
	
	@Autowired
	private DoctorDao ddao;
	
	@Autowired
	private AppointmentDao adao;
	
	
	
	@RequestMapping(value="/AdminLogin", method= RequestMethod.GET)
	public String getAdminLoginForm() {
		
		
		return"AdminLogin";
	}
	
	
	@RequestMapping(value="/adminLogout",method=RequestMethod.GET)
	public String logOut(HttpSession session) {
		
		
		session.invalidate();
		return"home";
	}
	
	
	

	@RequestMapping(value="/AdminPage", method= RequestMethod.GET)
	public String getAdminPage() {
		
		
		return"AdminPage";
	}
	
	
	

	@RequestMapping(value="/AdminLogin",method=RequestMethod.POST)
	public String isExist(@ModelAttribute User u,Model model,HttpServletRequest req,HttpSession session) throws IOException {
		
		String input=req.getParameter("g-recaptcha-response");
		boolean res=VerifyRecaptcha.verify(input);
		
		if(res) {
			if( u.getUsername().equalsIgnoreCase("admin") && u.getPassword().equalsIgnoreCase("123")) {
				
				
				model.addAttribute("user","Admin");
				model.addAttribute("plist", pdao.getAll());
	            model.addAttribute("dlist", ddao.getAll());
	
				
				return "AdminPage";
			}else {
				model.addAttribute("error","User does not Exist!!");
				return "AdminLogin";	
			}
		}else {
			
		}
		model.addAttribute("error","You are no Human!!");
		return "AdminLogin";
	}
	
	
	
	
	@RequestMapping(value="/{id}/editdoctor", method=RequestMethod.GET)
	public String edit(@PathVariable("id") int id,Model model,HttpSession session ) {
		
		Doctor d=ddao.getById(id);
		
		model.addAttribute("user","Admin");		
		model.addAttribute("Doctorinfo",d);
			
		
		return "EditDoctorPage";
	}	
	
	
	@RequestMapping(value="/{id}/editpatient", method=RequestMethod.GET)
	public String editPatient(@PathVariable("id") int id,Model model,HttpSession session ) {
		
		Patient p=pdao.getById(id);
		model.addAttribute("user","Admin");		
		
		model.addAttribute("Patientinfo",p);
			
		
		return "EditPatientPage";
	}
	
	
	
	
	
	
	@RequestMapping(value= "/updateDoctor", method=RequestMethod.POST)
	public String updateDoctor(@ModelAttribute Doctor d,Model model,HttpSession session) {
		
		ddao.updateDoctor(d);
		
		model.addAttribute("user","Admin");
		model.addAttribute("plist", pdao.getAll());
        model.addAttribute("dlist", ddao.getAll());
		
		
		return"AdminPage";
	}
	
	
	@RequestMapping(value= "/updatePatient", method=RequestMethod.POST)
	public String updatePatient(@ModelAttribute Patient p,Model model,HttpSession session) {
		
		
		pdao.updatepatient(p);
		
		model.addAttribute("user","Admin");
		model.addAttribute("plist", pdao.getAll());
        model.addAttribute("dlist", ddao.getAll());
		
		
		return"AdminPage";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String saveFile(@RequestParam("file") MultipartFile file, Model model) throws IOException {
		
		   if(!file.isEmpty()) {
			   
			   FileOutputStream  fout = new FileOutputStream("C:\\Users\\Dell\\Documents\\workspace-sts-3.9.7.RELEASE\\onlineClinic\\src\\main\\webapp\\resources\\imgs\\"+file.getOriginalFilename());
			   fout.write(file.getBytes());
			   fout.close();
			   
			   model.addAttribute("msg","upload success!!");
		   }
			model.addAttribute("user","Admin");
			model.addAttribute("plist", pdao.getAll());
	        model.addAttribute("dlist", ddao.getAll());
	        model.addAttribute("msg","upload failed!!");
		return "AdminPage";
	}
	
	
	
	
	
	
	@RequestMapping(value="/{id}/deleteDoctor", method=RequestMethod.GET)
	public String deleteDoctor(@PathVariable("id") int id,Model model,HttpSession session) {
		
	     for(Appointment a:adao.getAll()) {
	    	 Doctor d1=a.getDoctor();
		        if(id==d1.getDid()) {		        	
		        	adao.removeAppointment(a.getAid());	
		        }

		        }
	
    ddao.removeDoctor(id);
    
	model.addAttribute("user","Admin");
	model.addAttribute("plist", pdao.getAll());
    model.addAttribute("dlist", ddao.getAll());

		return"AdminPage";
	}
	
	
	
	@RequestMapping(value="/{id}/deletePatient", method=RequestMethod.GET)
	public String deletePatient(@PathVariable("id") int id,Model model,HttpSession session) {
	
		
	     for(Appointment a:adao.getAll()) {
	    	 Patient p1=a.getPatient();
		        if(id==p1.getPid()) {		        	
		        	adao.removeAppointment(a.getAid());	
		        }

		        }	
		
    pdao.removePatient(id);
	model.addAttribute("user","Admin");
	model.addAttribute("plist", pdao.getAll());
    model.addAttribute("dlist", ddao.getAll());

		return"AdminPage";
	}
	
	
	
	
	
	
	
	
	
}
