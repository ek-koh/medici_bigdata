package edu.medici.cardgame;
/*
 * Card를 만들어 보자.
 * num: A,2,3,4,5,6,7,8,9,T,J,Q,K
 * grim: H,S,C,D
 */
public class Card {
	private String card;
	public static final String[] num = {"A","2","3","4","5","6","7","8","9","T","J","Q","K"};
	public static final String[] grim = {"H","S","C","D"};
	
	public Card() {
		init();
	}

	private void init() {
		// 이 부분 생성자 안에 들어가도 상관 없음
		int n = (int)(Math.random()*num.length); // 0~12
		int g = (int)(Math.random()*grim.length); // 0~3
		card = grim[g]+num[n];  // ex."H8"
	}
	
	// equals overriding
	@Override
	public boolean equals(Object obj) {
		boolean isT = false;
		Card cd = (Card) obj;
		if (card.equals(cd.getCard())) {
			isT = true;
		}
		return isT;
	}
	
	@Override
	public int hashCode() {
		return super.hashCode()+137; // 솟수를 더해주면 된다.
	}
	
	public String getCard() {
		return card;
	}
	
	@Override
	public String toString() {
		return "["+card+"]";
	}
}
