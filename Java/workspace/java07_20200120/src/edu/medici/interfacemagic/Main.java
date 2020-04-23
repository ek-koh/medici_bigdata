package edu.medici.interfacemagic;

public class Main {
	
	public void factoryMagicint(int inputNum) throws NoMagicSquare {
		IMagicSquare im = null;
		
		if (inputNum%2 != 0) {
			im = new OddMagicSquare(inputNum);
		}else if(inputNum%4 == 0) {
			im = new FourMagicSquare(inputNum);
		}else {
			throw new NoMagicSquare("마방진 만들 수 없는 숫자!!");
		}
		
		im.make();
		im.print();
		System.out.println(im.isCheck());
	}

	public static void main(String[] args) {
		Main main = new Main();
		try {
			main.factoryMagicint(10);
		} catch (NoMagicSquare e) {
			System.out.println("마방진을 시작할 수 없는 숫자입니다");
		}
//		IMagicSquare im = new OddMagicSquare();
//		int inputNum = 10;
//		IMagicSquare im = null;
//		
//		if (inputNum%2 != 0) {
//			im = new OddMagicSquare(inputNum);
//		}else if(inputNum%4 == 0) {
//			im = new FourMagicSquare(inputNum);
//		}else {
//			try {
//				throw new NoMagicSquare("마방진 만들 수 없는 숫자!!");
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		
//		im.make();
//		im.print();
//		System.out.println(im.isCheck());
	}

}
