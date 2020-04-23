package edu.medici.active;

import java.text.BreakIterator;
import java.util.ArrayList;
import java.util.Scanner;

public class Halligali2 {

	public static int result;

	public static void main(String[] args) {
		
		HalCardCase hcc = new HalCardCase();
		ArrayList hcardList = hcc.getHalcard(); 
		int p1Count = 0;
		int p2Count = 0;
		int stack = 0;
		
		for (int i = 0; i < 150; i++) {
			String temp = ((HalCard)hcardList.get(i)).getCard();
			String next = ((HalCard)hcardList.get(i+1)).getCard();
			
			// 현재 숫자와 과일
			char text = temp.charAt(0);
			char Cnumber = temp.charAt(2);
			int num = (int)Cnumber-48;
	
			// 다음번쨰 숫자와 과일
			char text2 = next.charAt(0);
			char Cnumber2 = next.charAt(2);
			int num2 = (int)Cnumber2-48;
			
			// 결과값 result에 저장하기 (종 칠 수 있는 상태면 1, 아니면 2)
			if (text == text2 && num+num2 == 5) {
				result = 1;
			}else if (text != text2 && (num == 5 || num2 == 5)){
				result = 1;
			}else {
				result = 2;
			}
			
			// 출력
			System.out.println("같은 과일끼리의 합이 5이면 1을, 5가 아니면 2를 입력하세요.");
			System.out.println(temp);
			System.out.println(next);
			stack += 2;
			System.out.println("Player 1 count = "+p1Count);
			System.out.println("Player 2 count = "+p2Count);
			System.out.println("Stack = "+stack);
			System.out.println();
			System.out.println("Player 1");
			
			// Player 1 입력받기
			Scanner scanner1 = new Scanner(System.in);
		    int yesNo1 = scanner1.nextInt();

			if (yesNo1 == result) {
				System.out.println("정답이에요! 나와 있는 카드를 모두 가져가세요!!");
				p1Count += stack;
				stack = 0;
				System.out.println("Player 1 count = "+p1Count);
				System.out.println("Player 2 count = "+p2Count);
				System.out.println("Stack = "+stack);
				
			}else {
				System.out.println("아니에요~ 벌칙으로 한 장 빼세요~~");
				p1Count --;
				System.out.println("Player 1 count = "+p1Count);
				System.out.println("Player 2 count = "+p2Count);
				System.out.println("Stack = "+stack);
				
				System.out.println();
				System.out.println("Player 2");
				
				// Player 2 입력받기
				Scanner scanner2 = new Scanner(System.in);
			    int yesNo2 = scanner2.nextInt();
				
				if (yesNo2 == result) {
					System.out.println("정답이에요! 나와 있는 카드를 모두 가져가세요!!");
					p2Count += stack;
					stack = 0;
					System.out.println("Player 1 count = "+p1Count);
					System.out.println("Player 2 count = "+p2Count);
					System.out.println("Stack = "+stack);
					
				}else {
					System.out.println("아니에요~ 벌칙으로 한 장 빼세요~~");
					p2Count --;
					System.out.println("Player 1 count = "+p1Count);
					System.out.println("Player 2 count = "+p2Count);
					System.out.println("Stack = "+stack);
				}
			}
			System.out.println();

			// 승자 가리기: 총 56장 먼저 가진 사람이 승!!
			if (p1Count >= 56) {
				System.out.println("Player 1 WIN!!");
				break;
			}else if (p2Count >= 56){
				System.out.println("Player 2 WIN!!");
				break;
			}
		
	
		
		}
		

	}

}
 
