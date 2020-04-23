package edu.medici.constructor;

public class Teacher extends People{
	private String tId;
	private String tSubject;
	
	public Teacher(String name, int age,
			String tSubject, String tId) {
		super(name, age);
		this.tId = tId;
		this.tSubject = tSubject;
	}
	
	// tId
	public String gettId() {
		return tId;
	}
	public void settId(String tId) {
		this.tId = tId;
	}
	
	// tSubject
	public String gettSubject() {
		return tSubject;
	}
	public void settSubject(String tSubject) {
		this.tSubject = tSubject;
	}
	
	
}
