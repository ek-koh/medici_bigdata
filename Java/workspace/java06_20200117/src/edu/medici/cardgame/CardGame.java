package edu.medici.cardgame;

public class CardGame {
	public static void main(String[] args) {
//		Card cd = new Card();
//		System.out.println(cd.getCard());
		
		CardCase cc = new CardCase();
		Card[] cardList = cc.getCards();
		for (int i = 0; i < cardList.length; i++) {
			System.out.print(cardList[i]);
			if ((i+1)%10==0) {
				System.out.println();
			}
		}
	}
}
