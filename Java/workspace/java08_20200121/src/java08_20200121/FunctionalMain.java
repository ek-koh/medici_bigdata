package java08_20200121;

public class FunctionalMain {

	public static void main(String[] args) {
		MyFunctionalInterface mfi;
		
		// 실행할 문장이 두 문자 이상이면 {}를 반드시 사용해야 한다.
		mfi = () -> {
			String str = "메소드 호출!!";
			System.out.println(str);
		};
		mfi.print();
		
		// 실행할 문장이 한 문장일 경우에는 {}를 생략할 수 있음
		mfi = () -> System.out.println("메소드 호출 2번째!!");
		mfi.print();
		
		// 실행할 문장이 한 문장일 경우에는 생략 안해도 됨
		mfi = () -> {System.out.println("메소드 호출 3번째!!");};
		mfi.print();
		
		// 자바스타일의 동일한 결과를 얻는 익명객체 구현
		mfi = new MyFunctionalInterface() {
			
			@Override
			public void print() {
				System.out.println("메소드 호출 4번째!!");
			}
		};
		mfi.print();
	}

}
