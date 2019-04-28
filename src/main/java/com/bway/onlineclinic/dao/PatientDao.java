package com.bway.onlineclinic.dao;

import java.util.List;

import com.bway.onlineclinic.model.Patient;

public interface PatientDao {
	
	
	
	public Patient getByUn(String un, String psw);
	
	void patientSignup(Patient p);
	
	boolean patientLogin(String un,String psw);
	
	Patient ViewMedicalHistory(int id); 
	
	void updateMedicalHistory(Patient p); 
	
	Patient getById(int id);
	
	void updatepatient(Patient p);
	
	void removePatient(int id);
	
	List<Patient> getAll();

}
