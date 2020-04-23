package edu.medici.interfaceexam;

public class InterfaceTestMain {

	public static void main(String[] args) {
		Flying flying = new Bird();
		flying.fly();
		Flying flying2 = new Superman();
		flying2.fly();
		
		// 인터페이스는 자신의 이름으로 생성할 수 없다.
		// Flying flying3 = new Flying(); 에러
		
		// public final static으로 변수가 선언되는 것을 확인
		int c = Flying.A;
		int d = Flying.B;
		System.out.println(d);
	}

}
