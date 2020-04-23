package edu.medici.funcintl.lambdaex;

public class LambdaExMain {

	public static void main(String[] args) {
		MyFuncIntl mfi;
		
		mfi = (x,y) -> {
			int result = x+y;
			return result;
		};
		System.out.println(mfi.method(10, 20));
		
		// 약식
		mfi = (x,y) -> {return x+y;};
		System.out.println(mfi.method(10, 20));
		
		mfi = (x,y) -> x+y;
		System.out.println(mfi.method(10, 20));
		
		mfi = (x,y) -> multi(x,y);
		System.out.println(mfi.method(10, 20));
	}

	private static int multi(int x, int y) {
		return x*y;
	}

}
