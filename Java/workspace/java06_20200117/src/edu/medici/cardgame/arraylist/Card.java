package edu.medici.cardgame.arraylist;
/*
 * Card�� ����� ����.
 * num: A,2,3,4,5,6,7,8,9,T,J,Q,K
 * grim: H,S,C,D
 */
public class Card {
	private String card;
	public static final String[] NUM = {"A","2","3","4","5","6","7","8","9","T","J","Q","K"};
	public static final String[] GRIM = {"H","S","C","D"};
	
	public Card() {
		init();
	}

	private void init() {
		// �� �κ� ������ �ȿ� ���� ��� ����
		int n = (int)(Math.random()*NUM.length); // 0~12
		int g = (int)(Math.random()*GRIM.length); // 0~3
		card = GRIM[g]+NUM[n];  // ex."H8"
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
		return super.hashCode()+137; // �ڼ��� �����ָ� �ȴ�.
	}
	
	public String getCard() {
		return card;
	}
	
	@Override
	public String toString() {
		return "["+card+"]";
	}
}
