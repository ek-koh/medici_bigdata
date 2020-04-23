package edu.medici.game;
/*
 * 로또 만들어보기
 * 1~45까지의 수 중에서 서로 다른 6개의 수를 추출하기
 */
public class Lotto {
	private int[] ball; // 배열이 선언만 되고 생성은 안된 상태
	
	// 생성자: 값을 초기화하기 위해
	public Lotto() {
		ball = new int [6];
	}
	
	// 로또를 만든다.
	public void make() { // 리턴타입이 없는 경우 : void 사용
		// 1~45까지의 수를 랜덤으로 가져오는 것을 처리
		// Math.random() : 0.0000000000001423 ~ 0.99999999999999까지의 난수를 가져온다.
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

	// 랜덤으로 추출한 수가 지금 배열 안에 들어있는지를 확인하는 메소드
	// 메소드 형태는 리턴타입이 있는 경우(boolean으로. 리턴 타입도 boolean으로 맞춰줘야 함)
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