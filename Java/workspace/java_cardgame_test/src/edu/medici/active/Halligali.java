package edu.medici.active;

import java.util.ArrayList;
import java.util.Scanner;

public class Halligali {

	public static int result;

	public static void main(String[] args) {
		
		HalCardCase hcc = new HalCardCase();
		ArrayList hcardList = hcc.getHalcard(); 
		for (int i = 0; i < hcardList.size(); i++) {
			System.out.print(hcardList.get(i));
			if((i+1)% 5 ==0) {
				System.out.println();
			}
		}
		
//		System.out.println(hcardList.get(0).getClass());
		
//		for (int i = 0; i < hcardList.size(); i++) {
//			String temp = ((HalCard)hcardList.get(i)).getCard();
//			String next = ((HalCard)hcardList.get(i+1)).getCard();
//			
//			System.out.println("같은 과일끼리의 합이 5이면 1을, 5가 아니면 2를 입력하세요.");
//			System.out.println(temp);
//			System.out.println(next);
//
//			
//			Scanner scanner = new Scanner(System.in);
//		    int yesNo = scanner.nextInt();
//			
//			// 현재 숫자와 과일
//			char text = temp.charAt(0);
//			char Cnumber = temp.charAt(2);
//			int num = (int)Cnumber-48;
//	
//			// 다음번쨰 숫자와 과일
//			char text2 = next.charAt(0);
//			char Cnumber2 = next.charAt(2);
//			int num2 = (int)Cnumber2-48;
//			
//			if (text == text2 && num+num2 == 5) {
//				result = 1;
//			}else if (text != text2 && (num == 5 || num2 == 5)){
//				result = 1;
//			}else {
//				result = 2;
//			}
//
//			if (yesNo == result) {
//				System.out.println("정답이에요! 카드 하나 가져가세요.");
//			}else {
//				System.out.println("아니에요~");
//			}
//			System.out.println();
//		}
//		
//	
//		// 총 56장
//		int cardcount = hcardList.size();
//		System.out.println(cardcount);
//		
//		while(cardcount < 0) {
//			cardcount = hcardList.size();	
//			
////			if (yesNo == result) {
////				
////			}
//			
//			cardcount--;
//		}
		 
	}

}
 
