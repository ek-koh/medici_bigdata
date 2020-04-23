package edu.medici.constructor;

public class Main {

	public static void main(String[] args) {
		/*
		 * 33. 생성자(constructor)
		 * - 생성자는 클래스 이름과 동일하고 리턴타입이 없다.
		 * - 객체를 생성할 때 가장 먼저 호출되는 것
		 * - 값을 초기화할 때 사용한다.
		 * - argument의 개수에 따라서 여러 개 사용할 수 있다.
		    	+ '생성자 오버로딩'이라고 한다.
		 * - default 생성자는 생정자를 만들지 않아도 자동으로 생성된다.
		 * - argument가 있는 생성자를 만들게 되면
		    	+ 반드시 default 생성자를 만들어야 한다.
		    	+ 그렇지 않으면 오류 발생한다.
		 * 34. 35. 
		 */
						// 생성자
		// People p = new People("Myname", 3);
//		People p1 = new People();
//		p1.setName("고은경");
//		p1.setAge(10);
//		System.out.println(p.getName());
//		System.out.println(p.getAge());
//		People p2 = new People("고은경", 10);
		
		Student s = new Student("고은경", 20, "2020001", "통계");
		System.out.println(s.getsId());
		System.out.println(s.getSubject());
		System.out.println(s.getName());
		System.out.println(s.getAge());
		
		Teacher t = new Teacher("설현", 20, "영어", "t001");
		System.out.println(t.gettId());
		System.out.println(t.gettSubject());
		System.out.println(t.getName());
		System.out.println(t.getAge());
		
	}

}




















