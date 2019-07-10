package com.modal;


import java.util.Date;

public class Student {
	private String Name,Umail,number,password;
	private int id,state;
	private Date DOB;
	public Student()
	{}
	
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getUmail() {
		return Umail;
	}
	public void setUmail(String umail) {
		Umail = umail;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
		public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDOB() {
		return DOB;
	}
	public void setDOB(Date dOB) {
		DOB = dOB;
	}
		

	
	}
