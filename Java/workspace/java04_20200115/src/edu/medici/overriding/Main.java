package edu.medici.overriding;

public class Main {

	public static void main(String[] args) {
		People p = new People("사용자", 20);	// toString으로 오버라이딩 했기 때문에 가능
		Student s = new Student("학생명", 14, "202001", "웹프로그래밍");
		Teacher t = new Teacher("한혜진", 20, "202002", "연기");
		// 만들어보기: String tId, String tSubject
		
		System.out.println(p);
		System.out.println(s);
		System.out.println(t);
	}

}
