package com.bway.onlineclinic.model;

import java.sql.Date;




import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="appointmenthistory")
public class AppointmentHistory {
	
	@Id
	@GeneratedValue
	private int aid;
	private String Category;
	private String Status;
	private Date appdate;
	private String patFeedback;
	private String docFeedback;
	private String docFname;
	private String docLname;
	private String patFname;
	private String patLname;
	private int did;
	private int pid;
	private int appid;
	private Date reqdate;
	private Date patDob;
	private String patGender; 
	
	
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
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
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
	public String getDocFname() {
		return docFname;
	}
	public void setDocFname(String docFname) {
		this.docFname = docFname;
	}
	public String getDocLname() {
		return docLname;
	}
	public void setDocLname(String docLname) {
		this.docLname = docLname;
	}
	public String getPatFname() {
		return patFname;
	}
	public void setPatFname(String patFname) {
		this.patFname = patFname;
	}
	public String getPatLname() {
		return patLname;
	}
	public void setPatLname(String patLname) {
		this.patLname = patLname;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getAppid() {
		return appid;
	}
	public void setAppid(int appid) {
		this.appid = appid;
	}
	public Date getReqdate() {
		return reqdate;
	}
	public void setReqdate(Date reqdate) {
		this.reqdate = reqdate;
	}
	public Date getPatDob() {
		return patDob;
	}
	public void setPatDob(Date patDob) {
		this.patDob = patDob;
	}
	public String getPatGender() {
		return patGender;
	}
	public void setPatGender(String patGender) {
		this.patGender = patGender;
	}

	
	
	

}
