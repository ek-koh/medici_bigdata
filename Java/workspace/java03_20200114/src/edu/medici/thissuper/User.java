package edu.medici.thissuper;

public class User {
	private String userId;
	private String passwd;
	private String userName;
	
	// default 생성자
	// 오버로딩 한 상태에서 메인에서 오버로딩 안준 값 찾으려면 디폴트 생성자 필요
	public User() {
		this("test01", "12345", "사용자");
	}
	
	public User(String userId, String passwd,
			String userName) {
		this.userId = userId;
		this.passwd = passwd;
		this.userName = userName;
		
	}
	public String getUserId() {
		return userId;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getUserName() {
		return userName;
	}
	
	
}
