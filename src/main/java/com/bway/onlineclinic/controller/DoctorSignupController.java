package com.bway.onlineclinic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bway.onlineclinic.dao.DoctorDao;
import com.bway.onlineclinic.dao.PatientDao;
import com.bway.onlineclinic.model.Doctor;

@Controller
public class DoctorSignupController {

	@Autowired
	private DoctorDao ddao;
	
	@Autowired
	private PatientDao pdao;
	
	
  @RequestMapping(value="/DoctorSignup", method= RequestMethod.GET)
	public String getDoctorSignupForm() {
		
		
		return"DoctorSignup";
}
	
	
  
  
	@RequestMapping(value="/DoctorSignup",method=RequestMethod.POST)
	public String signUp(@ModelAttribute Doctor d,Model model) {
		
		ddao.addDoctor(d);
		model.addAttribute("user","Admin");
		model.addAttribute("plist", pdao.getAll());
        model.addAttribute("dlist", ddao.getAll());

		
		
		return"AdminPage";
		
	}
  
  
  
	
	
	
	
}
