package edu.medici.cardgame;

public class CardCase {
	private Card[] cards;
	public int numOfCards = Card.grim.length*Card.num.length;
	
	// ������
	public CardCase() {
		cards = new Card[numOfCards];
		shuffle();
	}

	// 서로다른 카드 52개를 만들어주는 메소드
	private void shuffle() {
		int count = 0;
		while(true) {
			Card cd = new Card();
			if (!isSame(cards,cd)) {
				cards[count++]=cd;
			}
			if (count == numOfCards) {
				break;
			}
		}
	}

	// 배열안에 지금 뽑은 카드와 같은 카드가 있는지 확인하는 메소드
	private boolean isSame(Card[] cards, Card cd) {
		boolean isT = false;
		for (int i = 0; i < cards.length; i++) {
			if (cards[i]!=null && cards[i].equals(cd)) {
				isT = true;
				break;
			}
		}
		
		return isT;
	}
	
	// 외부에서 현재 만들어진 카드 배열을 가져가는 메소드 구현
	public Card[] getCards() {
		return cards;
	}
}
