package edu.medici.play369;

import edu.medici.abstractclass.AbstractPlay369;

/*
 * 1~100을 출력한다.
 * 10으로 나눠서 떨어지면 System.out.println()해서 한줄을 내려준다.
 * 숫자 사이의 간격을 띄워주기 위해서 \t을 추가해준다.
 * String s = "12"; // 문자열
 * char c = s.charAt(0); //1
 * char d = s.charAt(1); //2
 */

public class Play369Divide extends AbstractPlay369 {
	
	// 3이나 6이나 9가 있는 개수를 체크해서 리턴해주는 메소드
	public int count(int num) {
		int count = 0; // 실제 3, 6, 9의 개수를 저장할 변수
		int nums = num;
		for (int i = 0; i < length(num); i++) {
			if((nums%10) != 0 && (nums%10)%3 == 0) {
				count++;
			}
			nums = nums/10;
		}
		return count;
	}


	private int length(int num) {
		return (num+"").length();
	}
}
	



