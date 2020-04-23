package edu.medici.overriding;

public class Teacher extends People{
	String tId;
	String tSubject;
	
	@Override
	public String toString() {
		return super.toString() + " Teacher [tId=" + tId + ", tSubject=" + tSubject + "]";
	}
	
	public Teacher() {}
	public Teacher(String name, int age, String tId, String tSubject) {
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
