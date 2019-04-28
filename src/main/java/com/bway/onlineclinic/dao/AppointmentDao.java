package com.bway.onlineclinic.dao;

import java.util.List;

import com.bway.onlineclinic.model.Appointment;

public interface AppointmentDao {

	
	void addAppointment(Appointment a);
	
	void removeAppointment(int id);
	
	Appointment getById(int id);
	
	void updateAppointment(Appointment a);
	
	public List<Appointment> getPatientAppointment(int id);
	
	public List<Appointment> getDoctorAppointment(int id);
	
	List<Appointment> getAll();
}
