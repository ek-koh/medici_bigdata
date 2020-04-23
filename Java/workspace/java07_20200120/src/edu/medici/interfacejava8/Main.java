package edu.medici.interfacejava8;

public class Main {

	public static void main(String[] args) {
		IA ia = new Running();
		IA.staticTest();	// static 메소드
		ia.defaultTest();
	}

}
