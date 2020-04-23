package edu.medici.interfacemagic;

public class NoMagicSquare extends Exception {
	public NoMagicSquare() {
		this("마방진을 만들 수 없어요");
	}
	
	public NoMagicSquare(String msg) {
		super(msg);
	}
}
