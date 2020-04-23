package edu.medici.haligali;

import java.util.ArrayList;

public class HalCardCase {
	private ArrayList halcard;
	public int numOfCards = HalCard.count.length*HalCard.fruit.length;
	
	public HalCardCase() {
		halcard = new ArrayList();
		shuffle();
	}

	private void shuffle() {
		int count = 0;
		while(true) {
			HalCard cd = new HalCard();
			if (!halcard.contains(cd)) {
				halcard.add(cd);
				count++;
			}
			if (count == numOfCards) {
				break;
			}
		}
		
	}

	public ArrayList getHalCard() {
		return halcard;
	}

	
	
}
