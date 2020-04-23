package edu.medici.abstractclass;

public abstract class AbstractPlay369 {
	// 추상 메소드
	// 상속 받는 곳에서 구현해야 하는 메소드
	public abstract int count(int num);
	
	public void play(int startNum, int endNum) {
		for (int i = startNum; i <= endNum; i++) {
				if (count(i) > 0) {
					for (int j = 0; j < count(i); j++) {
						System.out.print("*");
					}
					System.out.print("\t");
				}else {
					System.out.print(i+"\t");
				}
			
			if (i%10 == 0) {
				System.out.println();
			}
		}
	}
}
