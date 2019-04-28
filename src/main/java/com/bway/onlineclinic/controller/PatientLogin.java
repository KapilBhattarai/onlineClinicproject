package com.bway.onlineclinic.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bway.onlineclinic.dao.AppointmentDao;
import com.bway.onlineclinic.dao.AppointmentHistoryDao;
import com.bway.onlineclinic.dao.DoctorDao;
import com.bway.onlineclinic.dao.PatientDao;
import com.bway.onlineclinic.model.Patient;

@Controller
public class PatientLogin {
	
	
	
	@Autowired
	private PatientDao pdao;
	
	@Autowired
	private DoctorDao ddao;
	
	
	@Autowired
	private AppointmentDao adao;

	@Autowired
	private AppointmentHistoryDao ahdao;	
	

	@RequestMapping(value="/PatientLogin", method= RequestMethod.GET)
	public String getDoctorLoginForm() {
		
		
		return"PatientLogin";
	}
	
	
	@RequestMapping(value="/patientLogout",method=RequestMethod.GET)
	public String logOut(HttpSession session) {
		
		
		session.invalidate();
		return"home";
	}
	
	
	
	
	@RequestMapping(value="/PatientPage", method= RequestMethod.GET)
	public String getPatientPage(HttpSession session) {
		
		if(StringUtils.isEmpty(session.getAttribute("activeuser")))
		{
			
			return"PatientLogin";
		}
		
		
		
		return"PatientPage";
	}
	
	
	
	
	
	@RequestMapping(value="/PatientLogin",method=RequestMethod.POST)
	public String isExist(@ModelAttribute Patient p,Model model,HttpServletRequest req,HttpSession session) throws IOException {
		
		String input=req.getParameter("g-recaptcha-response");
		boolean res=VerifyRecaptcha.verify(input);
		String un=p.getUsername();
		String psw=p.getPassword();
		if(res) {
			if(pdao.patientLogin(p.getUsername(),p.getPassword())) {
				
				session.setAttribute("activeuser", p.getUsername());
				session.setMaxInactiveInterval(500);
				
				
				Patient p1=pdao.getByUn(un,psw);
				model.addAttribute("plist", pdao.getAll());
	            model.addAttribute("dlist", ddao.getAll());
				
				model.addAttribute("userf",p1.getFname());
				model.addAttribute("userl",p1.getLname());
				model.addAttribute("pid",p1.getPid());
				model.addAttribute("applist",adao.getPatientAppointment(p1.getPid()));
				model.addAttribute("appRlist",ahdao.getPatientAppointment(p1.getPid()));
	
				
				return "PatientPage";
			}else {
				model.addAttribute("error","User does not Exist!!");
				return "PatientLogin";	
			}
		}
		
		model.addAttribute("error","You are no Human!!");
		return "PatientLogin";
	}
	
	
	
	
	
	
	
	
	
	
	
	

	
	//===========================facebook login================================================

	@RequestMapping(value = "/facebook", method = RequestMethod.GET)
	public String fbLogin(){
		
		//String secret_key = "c85c3bbaeded9ce1ea6af891cc8733c2";
		//String app_id = "1439123129660532";
		
		return "redirect:https://www.facebook.com/dialog/oauth?client_id=619291118510894&redirect_uri=http://localhost:8080/onlineclinic/authorize/facebook&response_type=code&scope=email";
	}
	
	
	
	@RequestMapping(value = "/authorize/facebook", method = RequestMethod.GET)
	public String saveFbUser(String code, Model model, HttpServletRequest request){
		
		model.addAttribute("user","Facebook User");
		model.addAttribute("plist", pdao.getAll());
        model.addAttribute("dlist", ddao.getAll());
		
	      return "PatientPage";
	      
	      
	      
	      }


}
