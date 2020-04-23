package edu.medici.game;
/*
 * �ζ� ������
 * 1~45������ �� �߿��� ���� �ٸ� 6���� ���� �����ϱ�
 */
public class Lotto {
	private int[] ball; // �迭�� ���� �ǰ� ������ �ȵ� ����
	
	// ������: ���� �ʱ�ȭ�ϱ� ����
	public Lotto() {
		ball = new int [6];
	}
	
	// �ζǸ� �����.
	public void make() { // ����Ÿ���� ���� ��� : void ���
		// 1~45������ ���� �������� �������� ���� ó��
		// Math.random() : 0.0000000000001423 ~ 0.99999999999999������ ������ �����´�.
		int count = 0;
		while(true) {
			int num = (int)(Math.random() * 45) + 1;
			if(!isSame(ball, num)) {
				ball[count++] = num; 
			}
			if(count == 6) {
				break;
			}
		}
	
	}

	// �������� ������ ���� ���� �迭 �ȿ� ����ִ����� Ȯ���ϴ� �޼ҵ�
	// �޼ҵ� ���´� ����Ÿ���� �ִ� ���(boolean����. ���� Ÿ�Ե� boolean���� ������� ��)
	private boolean isSame(int[] ball, int num) {
		boolean isT = false;
		for (int i = 0; i < ball.length; i++) {
			if(ball[i] == num) {
				isT = true;
				break;
			}
		}
		
		return isT;
	}

	public int[] getBall() {
		return ball;
	}
	
	public void print() {
		for (int i: ball) {
			System.out.print(i+",");
		}
	}
		
}