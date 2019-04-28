package com.bway.onlineclinic.model;

import java.sql.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="appointment")
public class Appointment {
	
	
	@Id
	@GeneratedValue
	private int aid;
	private String Category;
	private Date reqdate;
	private String Status;
	private Date appdate;
	private String patFeedback;
	private String docFeedback;
	
//	@OneToOne(cascade=CascadeType.ALL)	
	
	@OneToOne
	@JoinColumn(name="doctorId")
	private Doctor doctor;
	
	
	@OneToOne
	@JoinColumn(name="patientId")
	private Patient patient;

	
	
	

	public Date getAppdate() {
		return appdate;
	}


	public void setAppdate(Date appdate) {
		this.appdate = appdate;
	}


	public String getPatFeedback() {
		return patFeedback;
	}


	public void setPatFeedback(String patFeedback) {
		this.patFeedback = patFeedback;
	}


	public String getDocFeedback() {
		return docFeedback;
	}


	public void setDocFeedback(String docFeedback) {
		this.docFeedback = docFeedback;
	}


	public int getAid() {
		return aid;
	}


	public void setAid(int aid) {
		this.aid = aid;
	}


	public String getCategory() {
		return Category;
	}


	public void setCategory(String category) {
		Category = category;
	}


	public Date getReqdate() {
		return reqdate;
	}


	public void setReqdate(Date reqdate) {
		this.reqdate = reqdate;
	}


	public String getStatus() {
		return Status;
	}


	public void setStatus(String status) {
		Status = status;
	}


	public Doctor getDoctor() {
		return doctor;
	}


	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}


	public Patient getPatient() {
		return patient;
	}


	public void setPatient(Patient patient) {
		this.patient = patient;
	}


	@Override
	public String toString() {
		return "Appointment [aid=" + aid + ", Category=" + Category + ", reqdate=" + reqdate + ", Status=" + Status
				+ ", appdate=" + appdate + ", patFeedback=" + patFeedback + ", docFeedback=" + docFeedback + ", doctor="
				+ doctor + ", patient=" + patient + ", getAppdate()=" + getAppdate() + ", getPatFeedback()="
				+ getPatFeedback() + ", getDocFeedback()=" + getDocFeedback() + ", getAid()=" + getAid()
				+ ", getCategory()=" + getCategory() + ", getReqdate()=" + getReqdate() + ", getStatus()=" + getStatus()
				+ ", getDoctor()=" + getDoctor() + ", getPatient()=" + getPatient() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}


	
	
	
	

}
