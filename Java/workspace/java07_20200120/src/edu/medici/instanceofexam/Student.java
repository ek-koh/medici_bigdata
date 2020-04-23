package edu.medici.instanceofexam;

public class Student extends People {
	private String sId;
	private String subject;
	
	public Student() {}
	public Student(String sId2, String subject2) {
		sId = sId2;
		subject = subject2;
	}
	public Student(String name, int age,
			String sId, String subject) {
		super(name, age);
		this.sId = sId;
		this.subject = subject;
	}
	
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
