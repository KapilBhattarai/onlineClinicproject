package com.bway.onlineclinic.dao;

import java.util.List;

import com.bway.onlineclinic.model.Doctor;

public interface DoctorDao {

	
    void addDoctor(Doctor d);
	
	boolean doctorLogin(String un,String psw);
	
	void acceptAppointment();
	
	Doctor getById(int id);
	
	void updateDoctor(Doctor d);
	
	void removeDoctor(int id);
	
	public Doctor getByUn(String un, String psw);
	
	List<Doctor> getAll();
	
	
	
}
