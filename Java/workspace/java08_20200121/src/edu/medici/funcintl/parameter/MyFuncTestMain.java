package edu.medici.funcintl.parameter;

import java08_20200121.MyFunctionalInterface;

public class MyFuncTestMain {

	public static void main(String[] args) {
		// 파라미터가 있는 함수형 인터페이스 사용하기
//		MyFuncParameter mfp = (x) -> {
//			System.out.println(10+x);
//		};
//		mfp.add(5);
		
		// 파라미터 2개 넣고 리턴을 받는 경우
//		MyFuncParameter mfp = (x, y) -> {
//			return x+y;
//		};
//		int result = mfp.add(10, 5);
		
		// 약식 표기
//		MyFuncParameter mfp = (x, y) -> {
//		return x+y;
//		};
//		MyFuncParameter mfp1 = (x, y) -> x + y;
		
		// 메소드를 호출해서 리턴을 던져주는 방법
		MyFuncParameter mfp = (x,y) -> {
			return sum(x,y);
		};
	
	}

	private static int sum(int x, int y) {
		return x+y;
	}

}
