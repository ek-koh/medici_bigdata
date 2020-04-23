package com.medici.javareview;

/*
 * 사람이라는 클래스를 만든다.
 * 속성: name, age, sex
 * 행위: 밥을 먹는다, 노래를 잘한다.
 * 행위와 속성을 갖는 모든 것을 나타내는 클래스
 */
public class People {
	// type + 변수명
	String name;
	int age;
	String sex;
	
	// method
	// 리턴타입 있는 경우: int count(){ return 1; }
	// 리턴타입 없는 경우: void + 변수명
	void eating() {
		System.out.println("밥을 먹는다.");
	}
	void singing() {
		System.out.println("노래를 잘한다.");	
	}
	
	// name
	void setName(String name2) {
		name = name2;		
	}
	// name 값을 리턴하는 메소드
	String getName() {
		return name;
	}
}
