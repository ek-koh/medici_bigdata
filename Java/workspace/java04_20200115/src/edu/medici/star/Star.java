package edu.medici.star;

public class Star {
	public void star1(int n) {
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < i+1; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
	}
	
	public void star2(int n) {
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < 2*i+1; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	
	public void star3(int n) {
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n-1-i; j++) {
				System.out.print(" ");
			}
			for (int k = 0; k < 2*i+1; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	
	public static void main(String[] args) {
		Star star = new Star();
//		 star.star1(4);
//		 star.star2(4);
		star.star3(4);
	}
}
