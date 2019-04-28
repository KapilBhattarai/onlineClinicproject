package com.bway.onlineclinic.dao;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bway.onlineclinic.model.AppointmentHistory;

@Repository
public class AppointmentHistoryDaoImpl implements AppointmentHistoryDao {
	
	
	
	@Resource
	private SessionFactory sessionFactory;
	
	
	

	@Transactional
	public void addAppointment(AppointmentHistory a) {

		Session session = sessionFactory.getCurrentSession();
		session.save(a);		
		
		
	}

	@Transactional
	public AppointmentHistory getById(int id) {
		Session session= sessionFactory.getCurrentSession();
		AppointmentHistory a= (AppointmentHistory)session.get(AppointmentHistory.class, id);
		
		return a;
	}

	@Transactional
	public void updateAppointment(AppointmentHistory a) {
		Session session= sessionFactory.getCurrentSession();
    	session.update(a);
	}

	
	
	@Transactional
	public List<AppointmentHistory> getPatientAppointment(int id) {
		Session session= sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(AppointmentHistory.class);
		
		crt.add(Restrictions.eq("pid", id));
		
		return crt.list();
	}

	
	
	@Transactional
	public List<AppointmentHistory> getDoctorAppointment(int id) {
		Session session= sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(AppointmentHistory.class);
		
		crt.add(Restrictions.eq("did", id));
                              

		return crt.list();
	}

	@Transactional
	public List<AppointmentHistory> getAll() {
		Session session= sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(AppointmentHistory.class);

		return crt.list();
	}



}
