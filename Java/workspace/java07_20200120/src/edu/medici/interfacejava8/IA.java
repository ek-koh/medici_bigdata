package edu.medici.interfacejava8;

public interface IA {
	void print();
	void test();
	
	// default 메소드 (메소드 동일)
	default void defaultTest() {
		System.out.println("default 메소드");
	}
	
	// static 메소드 (일반 staic 메소드와 동일)
	static void staticTest() {
		System.out.println("static 메소드");
	}

}
