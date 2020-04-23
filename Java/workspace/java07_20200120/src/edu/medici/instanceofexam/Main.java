package edu.medici.instanceofexam;

public class Main {

	public void process(People p) {
		
		if (p instanceof Teacher) {
			System.out.println("선생님입니다.");
		}else if (p instanceof Student) {
			System.out.println("학생입니다.");
		}else if (p instanceof People){
			System.out.println("직원입니다.");
		}
	}
	
	public static void main(String[] args) {
		// 직원
		People p = new People();
		
		Student s = new Student();
		p=s;
		
		if (p instanceof Teacher) {
			System.out.println("선생님입니다.");
		}else if (p instanceof Student) {
			System.out.println("학생입니다.");
		}else if (p instanceof People){
			System.out.println("직원입니다.");
		}
	}

}
