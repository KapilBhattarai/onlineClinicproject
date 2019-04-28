package com.bway.onlineclinic.dao;

import java.util.List;



import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bway.onlineclinic.model.Patient;



@Repository
public class PatientDaoImpl implements PatientDao {

	@Resource
	private SessionFactory sessionFactory;

	
	
	
	@Transactional
	public void patientSignup(Patient p) {
		Session session = sessionFactory.getCurrentSession();
		session.save(p);

		
	}


	@Transactional
	public boolean patientLogin(String un, String psw) {
		
		
		Session session=sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(Patient.class);
		
		crt.add(Restrictions.eq("username", un))
		                         .add(Restrictions.eq("password", psw));
		
		
		Patient u=(Patient)crt.uniqueResult();
		
		
		if(u!= null) {
			return true;
		}
		
		return false;
	}

	
	
	
	@Transactional
	public Patient ViewMedicalHistory(int id) {
		Session session= sessionFactory.getCurrentSession();
		Patient p= (Patient)session.get(Patient.class, id);
		
		return p;
		
	}
	
	

	@Transactional
	public void updateMedicalHistory(Patient p) {
		Session session= sessionFactory.getCurrentSession();
    	session.update(p);
	}
	
	
	
	

	@Transactional
	public Patient getById(int id) {
		
		
		Session session= sessionFactory.getCurrentSession();
		Patient p= (Patient)session.get(Patient.class, id);
		
		return p;
		
	}
	
	
	@Transactional
	public Patient getByUn(String un, String psw) {
		
		
		Session session= sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(Patient.class);
		
		crt.add(Restrictions.eq("username", un))
		                         .add(Restrictions.eq("password", psw));
		
		Patient u=(Patient)crt.uniqueResult();
		
		return u;
		
	}
	
	
	
	
	

	@Transactional
	public void updatepatient(Patient p) {
		
		
		Session session= sessionFactory.getCurrentSession();
    	session.update(p);
	
	}
	
	
	
	

	@Transactional
	public void removePatient(int id) {
		
		Session session= sessionFactory.getCurrentSession();
		Patient p= (Patient)session.get(Patient.class, id);
		session.delete(p);	
	}
	
	
	

	@Transactional
	public List<Patient> getAll() {
		
		Session session= sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(Patient.class);

		return crt.list();
	
	}
	
	
	
	
}
