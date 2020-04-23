package edu.medici.active;

import java.util.ArrayList;

public class HalCardCase {
	private ArrayList halcard;
	public int rangeOfcards = HalCard.fruit.length*HalCard.count.length;
	
	
	public HalCardCase() {
		halcard = new ArrayList();
		shuffle();
	}

	private void shuffle() {
		int count = 0;
		while(true) {
			HalCard hcd = new HalCard();
			
			if(!halcard.contains(hcd)) {
				halcard.add(hcd);
				count++;
			}
			if(count == rangeOfcards) {
				break;
			}
		}
		
	}




	public ArrayList getHalcard() {
		return halcard;
	}
	
	
	
	
}
