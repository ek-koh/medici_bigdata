package edu.medici.exceptiontest;


// ArithmeticException
public class ExceptionMain {

	public static void main(String[] args) throws ArithmeticException{
		Calc calc = new Calc();
//		try {
//			calc.divide(10, 0);
//		}catch (ArithmeticException e) {
//			System.out.println("0으로 나누면 안돼요~");
//		}
		
//		try {
//			calc.divide2(5, 0);
//		}catch (ArithmeticException e) {
//		}
		
		try {
			calc.divide3(10, 0);
		} catch (ZeroException e) {
			e.printStackTrace();
//			System.out.println("0으로 나누지 마");
		}finally {
			System.out.println("커넥션 종료");
		}
	}

}
