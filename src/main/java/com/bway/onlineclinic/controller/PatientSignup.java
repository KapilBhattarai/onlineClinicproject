package com.bway.onlineclinic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bway.onlineclinic.dao.PatientDao;
import com.bway.onlineclinic.model.Patient;

@Controller
public class PatientSignup {
	
	
	
	@Autowired
	private PatientDao pdao;
	
	

    @RequestMapping(value="/PatientSignup", method= RequestMethod.GET)
	public String getPatientLoginForm() {
		
		
		return"PatientLogin";
}
	
    
    
    
	@RequestMapping(value="/PatientSignup",method=RequestMethod.POST)
	public String signUp(@ModelAttribute Patient p) {
		
		
		pdao.patientSignup(p);
		
		
		return"PatientLogin";
		
	}
	
}
