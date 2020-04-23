package edu.medici.haligali;

import java.util.ArrayList;
import java.util.Scanner;

public class HalCardGame {

	public static void main(String[] args) {
//		Scanner scanner = new Scanner(System.in);
//	    int num = scanner.nextInt();
		
		HalCardCase cc = new HalCardCase();
		ArrayList cardList = cc.getHalCard();
		for (int i = 0; i < cardList.size(); i++) {
			System.out.print((HalCard)cardList.get(i));
			
			Scanner scanner = new Scanner(System.in);
		    int num = scanner.nextInt();
			
			if ((i+1)%10==0) {
				System.out.println();
				
				
			}
		}
	}

}

