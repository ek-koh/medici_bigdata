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
public class ifLeapYear2 {
	public boolean isLeapYear(int year) {
		boolean isT = false; // 윤년인지 아닌지를 판단하게 하는 논리값
		
		if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) {
			isT = true;				
		}else {
			isT = false;
		}
		return isT;
	}
	
	public void printYear(boolean isT, int year) {
		if(isT) {
			System.out.println(year+"년은 윤년입니다.");
		}else {
			System.out.println(year+"년은 윤년이 아닙니다.");
		}
	}
	
	// 1996년 ~ 2018년까지 중에 윤년과 윤년이 아닌 해를 출력해 봅시다.
	public static void main(String[] args) {
		ifLeapYear2 ily = new ifLeapYear2();
		for(int year = 1996; year <= 2020; year++) {
			boolean isTF = ily.isLeapYear(year);
			ily.printYear(isTF, year);
		}
	}
}
