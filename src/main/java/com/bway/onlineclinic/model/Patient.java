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
@Table(name="patient")
public class Patient {
	
	@Id
	@GeneratedValue
	private int pid;
	private String fname;
	private String lname;
	private String email;
	private String username;
	private String password;
	private String bloodgroup;
	private String gender;
	private Date dob;
	

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="addressId")
	private PatientAddress address;


	public Date getDob() {
		return dob;
	}


	public void setDob(Date dob) {
		this.dob = dob;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getBloodgroup() {
		return bloodgroup;
	}


	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}


	public PatientAddress getAddress() {
		return address;
	}


	public void setAddress(PatientAddress address) {
		this.address = address;
	}


	@Override
	public String toString() {
		return "Patient [pid=" + pid + ", fname=" + fname + ", lname=" + lname + ", email=" + email + ", username="
				+ username + ", password=" + password + ", bloodgroup=" + bloodgroup + ", gender=" + gender + ", dob="
				+ dob + ", address=" + address + ", getDob()=" + getDob() + ", getGender()=" + getGender()
				+ ", getUsername()=" + getUsername() + ", getPassword()=" + getPassword() + ", getPid()=" + getPid()
				+ ", getFname()=" + getFname() + ", getLname()=" + getLname() + ", getEmail()=" + getEmail()
				+ ", getBloodgroup()=" + getBloodgroup() + ", getAddress()=" + getAddress() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}




	
	
	
	
}
