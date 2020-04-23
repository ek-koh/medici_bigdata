package edu.medici.genericmethod;

public class GenericMethodTest {

	public static void main(String[] args) {
//		Util.<Integer> box1 = Util.<Integer>boxing(100); // X
		Box<Integer> box1 = Util.<Integer>boxing(100);
//		Box<Integer> box3 = Util.boxing(100);
		int intValue = box1.get();
		System.out.println(intValue);
		
		Box<String> box2 = Util.boxing("홍길동");
		String strValue = box2.get();
		System.out.println(strValue);
	}

}
