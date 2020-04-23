package edu.medici.magicsquare;

/*
 * 홀수 마방진을 만들어 봅시다.
 * 1) m(o, [n/2]) =  1
 * 2) 1 ~ n*n까지 순차적으로 넣는다.
 * 3) 기본흐름: x--, y--
 * 4) x-1 < 0, x = n-1
 *    y-1 < 0, y = n-1
 * 5) m(x,y) !=0,
 * 	  x = tempx + 1
 * 	  y = tempy
 */
public class OddMagicSquare {
	int [][] magic;
	int top;
	
	// 생성자로 초기값 설정. 3 X 3 이 아무것도 안넣어도 기본적으로 나오게
	public OddMagicSquare() {
		this(3);
	}
	
	public OddMagicSquare(int n) {
		this.init(n);
	}
	
	private void init(int n) {
		magic = new int[n][n];
		top = n-1;
	}
	
	public void make() {
		int x = 0;
		int y = top/2;
		magic[x][y] = 1;
		
		// 값이 세팅이 되는 것을 for로 지정
		for (int i = 2; i <= (top + 1)*(top + 1); i++) {
			// 5) 단계에서 이전 값으로 돌아가기 위한 x,y값 지정
			int tempx = x;
			int tempy = y;
			
			if(x-1<0) {
				x = top;
			}else {
				x--;
			}
				
			if(y-1<0) {
				y = top;
			}else {
				y--;
			}
			
			// 값이 있을 경우에 이전위치로 가서 한칸 아래로 내려가서 값을 세팅
			if (magic[x][y]!=0) {
				x = tempx + 1;
				y = tempy;
			}	
			magic[x][y] = i;
		}// make
		
	}
	public void print() {
		for (int i = 0; i < top+1; i++) {
			for (int j = 0; j < magic.length; j++) {
				System.out.print(magic[i][j]+"\t");
			}
			System.out.println();
		}
	}
	
	public static void main(String[] args) {
		OddMagicSquare odd = new OddMagicSquare(9);
		odd.make();
		odd.print();
//		System.out.println(isCheck());
	}

//	private boolean isCheck() {
//		boolean isT = false;
//		
//		for (int i = 0; i < top+1; i++) {
//			for (int j = 0; j < top+1; j++) {
//			if(magic[i][j] != 0) {
//				isT = true;
//			}
//		}
//		}
//		
//		return isT;
//	}
}
