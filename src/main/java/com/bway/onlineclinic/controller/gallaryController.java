package com.bway.onlineclinic.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class gallaryController {
	
	
	@RequestMapping(value="/gallery", method=RequestMethod.GET)
	public String gallery(Model model) {
		
	
		
		
		List<String> imglist= Arrays.asList("002.jpg","003.jpg","005.jpg","DSC_1026.JPG","IMG_1778.JPG","005.jpg","006.jpg","007.jpg","008.jpg","kitchen_adventurer_caramel.jpg","kitchen_adventurer_donut.jpg","01.jpg","02.jpg","03.jpg","04.jpg","kitchen_adventurer_lemon.jpg");
		model.addAttribute("imglist", imglist);
		return"gallery";
	}

}
