package com.medici.oop.inheritance;

public class Student extends People{
	private String sId;
	private String subject;
	
	// sId
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	
	// subject
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	
	
	
}
