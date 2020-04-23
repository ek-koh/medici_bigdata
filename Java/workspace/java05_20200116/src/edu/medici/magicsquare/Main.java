package edu.medici.magicsquare;

import edu.medici.magicsquare.hierarchy.AbstractkMagicSquare;

public class Main {

	public static void main(String[] args) {
//		FourMagicSquare fm = new FourMagicSquare();
//		fm.make();
//		fm.print();
		
		/*
		 * 추상클래스는 추상클래스의 이름으로 생성할 수 없기 때문에 반드시 자식의 이름으로 생성한다.
		 */
//		AbstractkMagicSquare magic = new FourMagicSquare(8);
//		AbstractkMagicSquare magic = new OddMagicSquare(5);
//		magic.make();
//		magic.print();
		
		AbstractkMagicSquare magic = null;
		int num = 14;
		
		if (num%2 != 0) {
			magic = new OddMagicSquare(num);
		}else if(num%4 == 0) {
			magic = new FourMagicSquare(num);
		}else {
			System.out.println("마방진을 만들 수 없습니다");
		}
		
		magic.make();
		magic.print();
		System.out.println(magic.isCheck());
	}

}
