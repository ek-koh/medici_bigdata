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

public class Play369CharAt extends AbstractPlay369 {
	
	// 3이나 6이나 9가 있는 개수를 체크해서 리턴해주는 메소드
	public int count(int num) {
		String nums = num + ""; // 숫자를 문자열로 만듦
		int count = 0;
		for (int i = 0; i < nums.length(); i++) {
			if(nums.charAt(i) == '3') {
				count++;
			}else if(nums.charAt(i) == '6') {
				count++;
			}else if(nums.charAt(i) == '9') {
				count++;
			}
		}
		return count;
	}
}
	



