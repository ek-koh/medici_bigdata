package edu.medici.overriding;

public class People {
	private String name;
	private int age;
	
	@Override
	public String toString() {
		return "People [name=" + name + ", age=" + age + "]";
	}
	
	public People() {}
	public People(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	// name
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	// age
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
