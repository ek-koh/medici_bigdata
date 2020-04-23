package edu.medici.magicsquare.hierarchy;

public abstract class AbstractkMagicSquare {
	public int [][] magic;
	public int top;
	
	public void init(int n) {
		magic = new int[n][n];
		top = n-1;
	}
	
	public abstract void make();
	
	public void print() {
		for (int i = 0; i < top+1; i++) {
			for (int j = 0; j < magic.length; j++) {
				System.out.print(magic[i][j]+"\t");
			}
			System.out.println();
		}
	}
	
	// 마방진 로직이 제대로 수행되었는지 확인하는 메서드
	public boolean isCheck() {
		boolean isT = true;
		int count = top+1; // n
		int[] mcheck = new int[2*count+2];
		
		for (int i = 0; i < count; i++) {
			for (int j = 0; j < count; j++) {
				mcheck[i] += magic[i][j];
				mcheck[count+i] += magic[j][i];
				if (i==j) {
					mcheck[2*count] += magic[i][j];
				}
				if (i+j == count-1) {
					mcheck[2*count+1] += magic[i][j];
				}
			}
		}
		
		// 값이 실제로 틀린 값이 있는지 체크
		for (int i = 1; i < mcheck.length; i++) {
			if (mcheck[0] != mcheck[i]) {
				isT = false;
				break;
			}
		}
		return isT;
	}
	
}
