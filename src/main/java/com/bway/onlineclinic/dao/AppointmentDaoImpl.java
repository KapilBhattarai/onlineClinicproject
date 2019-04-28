package com.bway.onlineclinic.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bway.onlineclinic.model.Appointment;


@Repository
public class AppointmentDaoImpl implements AppointmentDao{

	@Resource
	private SessionFactory sessionFactory;
	
	
	
	

	@Transactional
	public void addAppointment(Appointment a) {

		Session session = sessionFactory.getCurrentSession();
		session.save(a);
		
		
		
	}

	@Transactional
	public void removeAppointment(int id) {

		
		Session session= sessionFactory.getCurrentSession();
		Appointment a= (Appointment)session.get(Appointment.class, id);
		session.delete(a);
		
		
	}
	
	

	@Transactional
	public Appointment getById(int id) {
		Session session= sessionFactory.getCurrentSession();
		Appointment a= (Appointment)session.get(Appointment.class, id);
		
		return a;
	}

	
	
	
	@Transactional
	public void updateAppointment(Appointment a) {
		Session session= sessionFactory.getCurrentSession();
    	session.update(a);
	}

	
	
	
	@Transactional
	public List<Appointment> getAll() {
		Session session= sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(Appointment.class);

		return crt.list();
	}
	
	
	@Transactional
	public List<Appointment> getPatientAppointment(int id) {
		Session session= sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(Appointment.class);
		
		crt.add(Restrictions.eq("patient.pid", id));
                              

		return crt.list();
	}

	
	
	
	@Transactional
	public List<Appointment> getDoctorAppointment(int id) {
		Session session= sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(Appointment.class);
		
		crt.add(Restrictions.eq("doctor.did", id));
                              

		return crt.list();
	}
	
	
	
	
	
	
	
}
