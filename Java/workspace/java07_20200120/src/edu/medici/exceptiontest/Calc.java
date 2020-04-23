package edu.medici.exceptiontest;

public class Calc {
	public void divide(int a, int b) {
		int c = a/b;
	}
	public void divide2(int a, int b) throws ArithmeticException{
		if (b==0) {
			throw new ArithmeticException();
		}
		int c = a/b;
	}
	public void divide3(int a, int b) throws ZeroException{
		if (b==0) {
			throw new ZeroException();
			
		}
		int c = a/b;
	}
}
