package com.bway.onlineclinic.dao;

import java.util.List;

import com.bway.onlineclinic.model.Appointment;
import com.bway.onlineclinic.model.AppointmentHistory;
import com.bway.onlineclinic.model.Doctor;
import com.bway.onlineclinic.model.Patient;

public interface AppointmentHistoryDao {
	

	void addAppointment(AppointmentHistory a);
	
	AppointmentHistory getById(int id);
		
	void updateAppointment(AppointmentHistory a);
	
	public List<AppointmentHistory> getPatientAppointment(int id);
	
	public List<AppointmentHistory> getDoctorAppointment(int id);
	
	List<AppointmentHistory> getAll();

}
