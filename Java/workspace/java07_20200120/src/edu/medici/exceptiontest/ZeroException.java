package edu.medici.exceptiontest;

public class ZeroException extends Exception{
	public ZeroException() {
		this("0으로 나누지 말라구");
	}

	public ZeroException(String msg) {
		super(msg);
	}
}
