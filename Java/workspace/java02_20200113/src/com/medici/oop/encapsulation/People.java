package com.medici.oop.encapsulation;

public class People {
	// member field private, member method public
	// encapsulation code, dto(data transfer object) pattern
	private int age;
	public void setAge(int age) {
		this.age = age;
	}
	public int getAge() {
		return age;
	}
}
