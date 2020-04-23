package com.medici.java01;

/*
 * 커피자판기
 * 동전-money, 컵
 */
public class CoffeeMachine {
	int money; //attribute(속성: type + 변수명)
	int cup;
	
	// 행위(method)
	// 돈을 넣으면 컵이 나오는 메소드를 구현해보자.
	void coffeMake() {
		cup = money/100;
		System.out.println("커피가"+cup+"잔 나왔습니다.");
	}
}
