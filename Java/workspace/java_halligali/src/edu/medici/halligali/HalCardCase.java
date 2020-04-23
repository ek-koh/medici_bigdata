package edu.medici.halligali;

import java.util.ArrayList;
import java.util.Collections;

public class HalCardCase {
	
	
	public HalCardCase() {
		
	}
	
	
	public ArrayList makeCase() {
		
		HalCard h1 = new HalCard();
		ArrayList cardlist = h1.CardMaker();
		
		Collections.shuffle(cardlist);
		
		return cardlist;
	}
	
	public void printCardCase() {
		ArrayList cardlist ;
		cardlist = makeCase();
		for (int i = 0; i < cardlist.size(); i++) {
			System.out.print(cardlist.get(i) + "\t");
			if((i+1)%10 ==0) {
				System.out.println();
			}
		}
	}
	
	
	
}
