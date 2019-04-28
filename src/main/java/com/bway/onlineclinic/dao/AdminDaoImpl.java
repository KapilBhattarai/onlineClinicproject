package com.bway.onlineclinic.dao;

import java.util.List;



import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AdminDaoImpl implements AdminDao {

	
	
	@Resource
	private SessionFactory sessionFactory;
	

	
	@Override
	public void adminlogin(String un, String psw) {
		// TODO Auto-generated method stub
		
	}

//	@Transactional
//	public void addMedicine(Medicine m) {
//
//		Session session = sessionFactory.getCurrentSession();
//		session.save(m);
//		
//	}
//	
//	
//	@Transactional
//	public Medicine getById(int id) {
//	Session session= sessionFactory.getCurrentSession();
//	Medicine m= (Medicine)session.get(Medicine.class, id);
//	
//	return m;
//}
//	
//
//	
//	@Transactional
//	public void updateMedicine(Medicine m) {
//		Session session= sessionFactory.getCurrentSession();
//    	session.update(m);
//	}
//
//	@Transactional
//	public List<Medicine> getAll() {
//		Session session= sessionFactory.getCurrentSession();
//		Criteria crt= session.createCriteria(Medicine.class);
//
//		return crt.list();
//	}

	
	
}
