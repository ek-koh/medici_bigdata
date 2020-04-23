package com.medici.oop.inheritance;

public class Main {

	public static void main(String[] args) {
		// 객체를 생성해야 한다.
		People p = new People();
		p.setAge(10);
		p.setName("Koh");;
		p.getAge();
		p.getName();
		// 부모의 클래스에서 사용할 수 있는 것
		
		Student s = new Student();
		// 부모(People)
		s.setAge(20);
		s.setName("고은경");
		s.getAge();
		s.getName();
		
		// 자식(Student)
		s.setsId("20010001");
		s.getsId();
		s.setSubject("수학");
		s.getSubject();
	}

}

