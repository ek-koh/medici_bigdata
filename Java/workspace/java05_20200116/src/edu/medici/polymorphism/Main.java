package edu.medici.polymorphism;

public class Main {

	public static void main(String[] args) {
		// 다형성 발생원리 테스트
		// 1. 부모의 이름으로 자식을 생성할 수 있다.
		People p = new Student();
		
		// 2. 부모의 이름으로 자식을 받을 수 있다.
		Student s = new Student();
		People p1 = s;
		
		// 3. 부모의 메소드로 자식의 메소드를 호출할 수 있다.
		System.out.println(p.toString());
		
		//
		Student s2 = new Student();
//		s2.				// Object, People, Student
		People p2 = s2;		
//		p2.				// 설계도가 바뀌었으므로 Student는 사용 못함
		Student s3 = (Student) p2;		// down casting
//		s3.				// 부모, 자식 메소드가 다 보인다.
		
	}

}
