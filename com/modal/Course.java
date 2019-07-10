package com.modal;

import java.util.Date;

public class Course {
	
	
	private int id;
	private String sUmail,faculty,course,fUmail,studentName;
	private Date strDate;
	
	
	
	
	public String getsUmail() {
		return sUmail;
	}
	public void setsUmail(String sUmail) {
		this.sUmail = sUmail;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getfUmail() {
		return fUmail;
	}
	public void setfUmail(String fUmail) {
		this.fUmail = fUmail;
	}
	public Date getStrDate() {
		return strDate;
	}
	public void setStrDate(Date strDate) {
		this.strDate = strDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFaculty() {
		return faculty;
	}
	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	

}
