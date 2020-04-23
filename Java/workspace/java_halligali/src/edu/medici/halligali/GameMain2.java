package edu.medici.halligali;

import java.util.ArrayList;
import java.util.Scanner;

public class GameMain2 {

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
		
		
		
		ArrayList one = new ArrayList();
		ArrayList two = new ArrayList();
	Scanner sc = new Scanner(System.in);
	
	for (int j = 0; j < size/2; j++) {
				one.add(cardlist.get(j));
			}
	for (int j = size/2; j < size; j++) {
				two.add(cardlist.get(j));
//				String temp =  ((String) cardlist.get(j));
//				
//				System.out.print(cardlist.get(j));
//				text = (temp).substring(0,temp.length()-1);
//				num = Integer.parseInt(temp.substring(temp.length()-1, temp.length()));
//				System.out.print(text);
//				System.out.print(num);
//				System.out.println();
//			
	}		
		String text = null;
		int num = 0;
		String text2 = null;
		int num2 = 0;
	for (int i = 0; i < size/2; i++) {
		String tempone = (String) one.get(i);
		String temptwo = (String) two.get(i);
		// 
		text = (tempone).substring(0,tempone.length()-1);
		num = Integer.parseInt(tempone.substring(tempone.length()-1, tempone.length()));		
		
		text2 = (temptwo).substring(0,temptwo.length()-1);
		num2 = Integer.parseInt(temptwo.substring(temptwo.length()-1, temptwo.length()));		
		
		System.out.print(text);
		System.out.print(num +"\t");
		
		
		
		System.out.print(text2);
		System.out.print(num2);
		System.out.println();
		
		
		if(text == text2 && (num+num2) == 5) {
			System.out.println("띵!~!");
		}else if(num == 5 || num2 == 5){
			System.out.println("띵!");
		}
	

		
		
		
		}

	}
}