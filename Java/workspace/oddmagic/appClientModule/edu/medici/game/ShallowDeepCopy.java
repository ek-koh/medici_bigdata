package edu.medici.game;

public class ShallowDeepCopy {
	public static void main(String[] args) {
//		int[] a = {1,2,3,4,5};
//		int[] c = new int[5]; // 5개의 방을 만든다.
//		
//		c = a; //shallow copy
//		a[2] = 100;
//		
//		for (int i : c) { // enhanced for
//			System.out.print(i+",");
//		}
	
	// deep copy
	int[] a1 = {1,2,3,4,5};
	int[] c1 = new int[5];
	
	
	// a1 값들을 c1의 공간에 다 복사해 넣어라.
	System.arraycopy(a1, 0, c1, 0, a1.length);
	a1[2] = 100;

	System.out.println(c1[2]);
	
	}
}
