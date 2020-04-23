package edu.medici.halligali;

import java.util.ArrayList;
import java.util.Scanner;

public class GameMain {

	public static void main(String[] args) {
		
		HalCardCase halli  = new HalCardCase();
		ArrayList cardlist = new ArrayList();
		
//		halli.printCardCase();
		
		
		cardlist = halli.makeCase();
		int size = cardlist.size();
		
		// n명에게 카드를 나누어 준다.
		// 단  나누어 떨어질 경우에만 된다.
		// 플레이어 1 0 ~ size/n  
		// 플레이어 2 size/n ~ size/n*2 
		// 플레이어 3 size/n*2 - size/n*3
		// 플레이어 4 size/n*3 ~ size/N*4 
		// ..
		// 플레이어 n size/n*n-1 ~ size
		
		// 2인용 호출해보기
		
		
		String text = null;
		int num = 0;
		String text2 = null;
		int num2 = 0;

//		
		
		Scanner sc = new Scanner(System.in);
		
		for (int i = 0; i < size/2; i++) {
			
			int[] numlist = new int[size/2];
			String [] textlist = new String[size/2];
		
			for (int j = 0; j < size/2; j++) {

				String temp =  ((String) cardlist.get(j));
				
				System.out.print(cardlist.get(j));
				text = (temp).substring(0,temp.length()-1);
				num = Integer.parseInt(temp.substring(temp.length()-1, temp.length()));
				textlist[j] = text;
				numlist[j] = num;
			}
			for (int j = size/2; j < size; j++) {
				
				String temp =  ((String) cardlist.get(j));
				
//				System.out.println(cardlist.get(j));
				text2 = (temp).substring(0,temp.length()-1);
				num2 = Integer.parseInt(temp.substring(temp.length()-1, temp.length()));
//				textlist2[j] = text2;
//				numlist2[j] = num2;
				
			}
			
//			
//			System.out.print(textlist[i]);
//			System.out.println(numlist[i]);
			
//			
//			if(text==text2 && num== num2) {
//			String yn = sc.next();
//			Thread.sleep(2000);
//			}
//			
			
			
		}
		
		
	

		
		
		
	}

}
