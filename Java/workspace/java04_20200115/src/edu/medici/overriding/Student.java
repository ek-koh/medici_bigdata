package edu.medici.overriding;

public class Student extends People {
	private String sId;
	private String subject;
	
	@Override
	public String toString() {
		return super.toString()+
				" Student [sId=" + sId + ", subject=" + subject + "]";
	}
	
	public Student() {} // 생성자 오버로딩 하면 default 생성자 습관적으로 만들기
	public Student(String name, int age,
					String sId, String subject) { // 생성자 오버로딩
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
