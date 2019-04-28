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
@Table(name="doctor")
public class Doctor {

	
	@Id
	@GeneratedValue
	private int did;
	private String fname;
	private String lname;
	private String gender;
	private String username;
	private String password;
	private String specialist;
	private String email;
	private String timeshift;
	private Date involveddate;

	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="addressId")
	private DocAddress address;


	
	
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


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	public int getDid() {
		return did;
	}


	public void setDid(int did) {
		this.did = did;
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


	public String getSpecialist() {
		return specialist;
	}


	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTimeshift() {
		return timeshift;
	}


	public void setTimeshift(String timeshift) {
		this.timeshift = timeshift;
	}


	public Date getInvolveddate() {
		return involveddate;
	}


	public void setInvolveddate(Date involveddate) {
		this.involveddate = involveddate;
	}


	public DocAddress getAddress() {
		return address;
	}


	public void setAddress(DocAddress address) {
		this.address = address;
	}


	@Override
	public String toString() {
		return "Doctor [did=" + did + ", fname=" + fname + ", lname=" + lname + ", gender=" + gender + ", username="
				+ username + ", password=" + password + ", specialist=" + specialist + ", email=" + email
				+ ", timeshift=" + timeshift + ", involveddate=" + involveddate + ", address=" + address
				+ ", getUsername()=" + getUsername() + ", getPassword()=" + getPassword() + ", getGender()="
				+ getGender() + ", getDid()=" + getDid() + ", getFname()=" + getFname() + ", getLname()=" + getLname()
				+ ", getSpecialist()=" + getSpecialist() + ", getEmail()=" + getEmail() + ", getTimeshift()="
				+ getTimeshift() + ", getInvolveddate()=" + getInvolveddate() + ", getAddress()=" + getAddress()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
	
	
}
