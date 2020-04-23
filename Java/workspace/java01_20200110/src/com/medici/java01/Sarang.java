package com.medici.java01;

/*
 * man, woman, money
 */
public class Sarang {
	int man=70;
	int woman=30;
	int money=20;
	
	void isSarangOk() {
		System.out.println(man>woman && money>10 ? "짝짝짝! 사랑이 이루어졌어요."
				: "ㅠㅠ 이별하였습니다.");
		
	}
}
