package edu.medici.abstractclass;

import edu.medici.play369.Play369CharAt;
import edu.medici.play369.Play369Divide;

public class Main {

	public static void main(String[] args) {
		// 부모의 이름으로 자식을 생성한다.
//		AbstractPlay369 ap = new Play369Divide();
		AbstractPlay369 ap = new Play369CharAt();
		ap.play(1, 100);
	}

}
