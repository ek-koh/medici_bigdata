package edu.medici.magicsquare;

import edu.medici.magicsquare.hierarchy.AbstractkMagicSquare;

public class FourMagicSquare extends AbstractkMagicSquare {
	
	// 생성자로 초기값 설정. 4 X 4가 아무것도 안넣어도 기본적으로 나오게
	public FourMagicSquare() {
		this(4);
	}

	public FourMagicSquare(int n) {
		super.init(n);
	}

	public void make() {
		// 정방향
		makeRight();
		// 역방향
		makeLeft();
	}

	// 정방향으로 값을 넣기
	public void makeRight() {
		int count = top + 1;
		for (int i = 0; i < count; i++) {
			for (int j = 0; j < count; j++) {
				// 알칼제이 공식: 2차원을 1차원으로 만들어주는 공식
				// i * count + j + 1
				magic[i][j] = i * count + j + 1;
			}
		}
	}

	// 역방향으로 비어있는 곳에 값을 넣기
	public void makeLeft() {
		int count = top + 1;
		for (int i = 0; i < count; i++) {
			for (int j = 0; j < count; j++) {
				if (i>=count/4 && i<count/4*3) {
					if ((j>=0 && j<count/4) || (j>=count/4*3 && j<count)) {
						magic[i][j] = (count*count) - (i*count+j);
					}
				}else {
					if (j>=count/4 && j<count/4*3) {
						magic[i][j] = (count*count) - (i*count+j);
					}
				}
			}
		}
		
	}

}
