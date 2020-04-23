package edu.medici.cardgame.arraylist;

import java.util.ArrayList;

public class CardCase {
	private ArrayList cards;
	public int numOfCards = Card.GRIM.length*Card.NUM.length;
	
  	// ������
	public CardCase() {
		cards = new ArrayList();
		shuffle();
	}

	// 서로다른 카드 52개를 만들어주는 메소드
	private void shuffle() {
		int count = 0;
		while(true) {
			Card cd = new Card();
			if (!cards.contains(cd)) { // contains�� isSame()�� ���� ������ ��
				cards.add(cd);
				count++;
			}
			if (count == numOfCards) {
				break;
			}
		}
	}

	
	// �ܺο��� ���� ������� ī�� �迭�� �������� �޼ҵ� ����
	public ArrayList getCards() {
		return cards;
	}
}
