package com.bway.onlineclinic.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bway.onlineclinic.dao.AppointmentDao;
import com.bway.onlineclinic.dao.AppointmentHistoryDao;
import com.bway.onlineclinic.dao.DoctorDao;
import com.bway.onlineclinic.dao.PatientDao;
import com.bway.onlineclinic.model.Doctor;

@Controller
public class DoctorLogin {
	
	
	
	@Autowired
	private DoctorDao ddao;
	
	@Autowired
	private PatientDao pdao;
	
	@Autowired
	private AppointmentDao adao;
	
	@Autowired
	private AppointmentHistoryDao ahdao;	
	
	
	
	@RequestMapping(value="/DoctorLogin", method= RequestMethod.GET)
	public String getDoctorLoginForm() {
		
		
		return"DoctorLogin";
	}
	
	
	
	
	@RequestMapping(value="/doctorLogout",method=RequestMethod.GET)
	public String logOut(HttpSession session) {
		
		
		session.invalidate();
		return"home";
	}

	
	
	
	@RequestMapping(value="/DoctorLogin",method=RequestMethod.POST)
	public String isExist(@ModelAttribute Doctor d,Model model,HttpServletRequest req,HttpSession session) throws IOException {
		
		
		String input=req.getParameter("g-recaptcha-response");
		boolean res=VerifyRecaptcha.verify(input);
		String un=d.getUsername();
		String psw=d.getPassword();
		if(res) {
			if(ddao.doctorLogin(d.getUsername(),d.getPassword())) {
		
		
				Doctor d1=ddao.getByUn(un,psw);
				model.addAttribute("plist", pdao.getAll());
	            model.addAttribute("dlist", ddao.getAll());
	
				model.addAttribute("userf",d1.getFname());
				model.addAttribute("userl",d1.getLname());
				model.addAttribute("pid",d1.getDid());
				model.addAttribute("spc",d1.getSpecialist());
				
				model.addAttribute("applist",adao.getDoctorAppointment(d1.getDid()));
				model.addAttribute("appRlist",ahdao.getDoctorAppointment(d1.getDid()));
				
				
				return "DoctorPage";
			}else {
				model.addAttribute("error","User does not Exist!!");
				return "DoctorLogin";	
			}
		}else {
			
		}
		model.addAttribute("error","You are no Human!!");
		return "DoctorLogin";
	}
	
	
}

