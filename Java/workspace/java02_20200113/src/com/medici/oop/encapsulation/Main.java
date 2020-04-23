package com.medici.oop.encapsulation;

public class Main {

	public static void main(String[] args) {
		People p = new People();
//		p.age = 10;	
		// 빨간줄. class에서 member field를 public으로 바꾸면 가능하짐
		System.out.println(p.getAge());

	}

}
