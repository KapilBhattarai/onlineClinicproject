package com.bway.onlineclinic.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bway.onlineclinic.model.Doctor;

@Repository
public class DoctorDaoImpl implements DoctorDao {

	
	@Resource
	private SessionFactory sessionFactory;
	
	
	
	
	
	@Transactional
	public void addDoctor(Doctor d) {
		
		Session session = sessionFactory.getCurrentSession();
		session.save(d);
		
		
		
		
	}
	


	@Transactional
	public boolean doctorLogin(String un, String psw) {

		Session session=sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(Doctor.class);
		
		crt.add(Restrictions.eq("username", un))
		                         .add(Restrictions.eq("password", psw));

		Doctor u=(Doctor)crt.uniqueResult();
		
		if(u!= null) {
			return true;
		}
		
	return false;	
		
	}
	

	@Override
	public void acceptAppointment() {
		// TODO Auto-generated method stub
		
	}
	
	

	@Transactional
	public Doctor getById(int id) {
		Session session= sessionFactory.getCurrentSession();
		Doctor d= (Doctor)session.get(Doctor.class, id);
		
		return d;
	}

	
	
	
	@Transactional
	public void updateDoctor(Doctor d) {
		Session session= sessionFactory.getCurrentSession();
    	session.update(d);
	}
	
	
	

	@Transactional
	public void removeDoctor(int id) {
		Session session= sessionFactory.getCurrentSession();
		Doctor d= (Doctor)session.get(Doctor.class, id);
		session.delete(d);	
	}
	
	
	@Transactional
	public Doctor getByUn(String un, String psw) {
		
		
		Session session= sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(Doctor.class);
		
		crt.add(Restrictions.eq("username", un))
		                         .add(Restrictions.eq("password", psw));
		
		Doctor u=(Doctor)crt.uniqueResult();
		
		return u;
		
	}
	
	
	
	
	
	

	@Transactional
	public List<Doctor> getAll() {
		
		
		Session session= sessionFactory.getCurrentSession();
		Criteria crt= session.createCriteria(Doctor.class);

		return crt.list();
		
	}

	
	
	
}
