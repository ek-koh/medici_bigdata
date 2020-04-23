package edu.medici.loop;
/*
 * 윤년을 찾아보자.
 * 윤년이 되는 조건은?
 * 1) year % 4 == 0
 * 2) year % 100 != 0
 * 3) year % 400 == 0
 * => 1, 2번 이거나 3번
 * 
 * ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)
 */
public class ifLeapYear {
	// 1996년 ~ 2018년까지 중에 윤년과 윤년이 아닌 해를 출력해 봅시다.
	public static void main(String[] args) {
		for(int year = 1996; year <= 2020; year++) {
			if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) {
				System.out.println(year+"년은 윤년입니다.");
			}else {
				System.out.println(year+"년은 윤년이 아닙니다.");
			}
		}
	}
}
