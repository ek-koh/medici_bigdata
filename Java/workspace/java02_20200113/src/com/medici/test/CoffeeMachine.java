package com.medici.test;

import java.awt.print.Printable;

public class CoffeeMachine {
	
	// test1
	public void makeCoffee() {
		int money = 1000;
		int cup = 0;
		
		if(money <= 0) {
			System.out.println("돈이 부족합니다.");			
		}else if(money/100>1) {
			cup = money / 100;
			System.out.println("커피가 "+ cup+"잔 나왔습니다.");
		}
	}
	
	
	// test2
	public void makeCoffee2(int money) {
		int cup = 0;
		
		if(money <= 0) {
			System.out.println("돈이 부족합니다.");			
		}else if(money/100>1) {
			cup = money / 100;
			System.out.println("커피가 "+ cup+"잔 나왔습니다.");
		}
	}
	
	// test3
	// 커피가 몇잔인지 값만 리턴해주는 메소드
	public int coffee(int money) {
		int cup = 0;
		
		if(money <= 0) {
			cup = -1;			
		}else if(money/100>1) {
			cup = money / 100;
		}
		
		return cup;
	}
	
	public void print(int cups) {
		if(cups<0) {
			System.out.println("돈을 가져오세요! 돈이 모자랍니다.");
		}else if(cups>0) {
			System.out.println("커피가 "+cups+"잔 나왔습니다");
		}
	}
	
	public void localVar() {
		int a;
		int b = 10;
//		int c = b+a; // 초기값 설정 안되어 있어서 에러
	}
	

	
////////////////////////////////// 실행 //////////////////////////////////
	
	public static void main(String[] args) {
				
		// main 이용하지 않고 바로 실행시키기
		// 주석처리한 int money 부터 system 다음 문장까지 객체를 생성해서 바로 실행할 수 있는 방법
		int money = 1000;
		int cup = 0;
		
		if(money <= 0) {
			System.out.println("돈이 부족합니다.");			
		}else if(money/100>1) {
			cup = money / 100;
			System.out.println("커피가 "+ cup+"잔 나왔습니다.");
		}
		
		
		// 원래 하던대로
		CoffeeMachine cm = new CoffeeMachine();
		// test1	
		cm.makeCoffee();
		
		// test2
		cm.makeCoffee2(-100);
		
		// test3
			
		int cups = cm.coffee(3000);
		cm.print(cups);
		
		


//		cm.localVar();
		
	}
}
