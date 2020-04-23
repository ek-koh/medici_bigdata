package edu.medici.haligali;

public class HalCard {
	private String card;
	public static String [] fruit= {"딸기", "수박", "라임", "자두"};
	public static String [] count = {"1", "1.", "1..", "1...", "1....", "2", "2.", "2..", "3", "3.", "3..", "4", "4.", "5"};
	
	
	public HalCard() {
		init();
	}
	
	private void init() {
		int c = (int)(Math.random()*count.length); // 0~13
		int f = (int)(Math.random()*fruit.length); // 0~3
		card = fruit[f]+count[c];  // ex."딸기1"
	}
	
	// equals overriding
	@Override
	public boolean equals(Object obj) {
		boolean isT = false;
		HalCard cd = (HalCard) obj;
		if (card.equals(cd.getHalCard())) {
			isT = true;
		}
		return isT;
	}
	
	@Override
	public int hashCode() {
		return super.hashCode()+137; // 솟수를 더해주면 된다.
	}
	
	public String getHalCard() {
		return card;
	}
	
	@Override
	public String toString() {
		return "["+card+"]";
	}
	
	
}
	
	
	
	
	