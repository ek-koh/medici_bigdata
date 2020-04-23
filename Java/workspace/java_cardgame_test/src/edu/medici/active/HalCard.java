package edu.medici.active;

public class HalCard {
	private String halcard;
	
	// 카드 
	public static final  String[] fruit = {"딸기", "수박", "라임", "자두"};
	public static final  String[] count = {"1", "1.", "1..", "1...", "1....", "2", "2.", "2..",
											"3", "3.", "3..", "4","4.", "5"};

	public HalCard() {
		init();
	}

	private void init() {
		int n = (int) (Math.random()*fruit.length); //과일 랜덤 길이
		int g = (int) (Math.random()*count.length);// 카드 숫자 랜덤 길이
		halcard = fruit[n] + count[g]; // H8
	}		
	public String getCard() {
		return  halcard;
	}
	@Override
	public boolean equals(Object obj) {
		boolean isT = false;
		HalCard cd = (HalCard)obj;
		if (halcard.equals(cd.getCard())) {
			isT = true;
		}
		return isT;
	}
	
	@Override
	public int hashCode() {
	return super.hashCode()+137; // 솟수를 더해주면 된다.
	}
	
	
	
	@Override
	public String toString() {
		return "["+ halcard+ "]";
	}



}
