package com.bway.onlineclinic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class testController {
	
	
  @RequestMapping(value="/test", method= RequestMethod.GET)
	public String getTestPage() {
		
		
		return"test";
}
  
  
	@RequestMapping(value="/test",method=RequestMethod.POST)
	public String signUp() {
		
		
	
		
		
		return"DoctorPage";
		
	}

}
