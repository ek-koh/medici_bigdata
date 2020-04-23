package edu.medici.cardgame.arraylist;

import java.util.ArrayList;

public class CardGame {
	public static void main(String[] args) {
		CardCase cc = new CardCase();
		ArrayList cardList = cc.getCards();
		for (int i = 0; i < cardList.size(); i++) {
			System.out.print((Card)cardList.get(i));
			if ((i+1)%10==0) {
				System.out.println();
			}
		}
	}
}
