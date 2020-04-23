package edu.medici.halligali;

import java.util.ArrayList;

public class HalCard {

	String halcard = null;
	final  String[] fruit = {"딸기", "바나나", "라임", "자두"};
	final  String[] count = { "1","1","1","1","1", "2", "2","2","3", "3","3","4","4", "5"};
	int range = fruit.length* count.length;
	
	public HalCard() {
		

	}
	
	public ArrayList CardMaker() {
		
		ArrayList halcardlist  =   new ArrayList();
		
		for (int i = 0; i < fruit.length; i++) {
			for (int j = 0; j < count.length; j++) {
				halcard = fruit[i]+ count[j];
				halcardlist.add(halcard);
			}
		}
		return halcardlist;
	}
	

	
}
