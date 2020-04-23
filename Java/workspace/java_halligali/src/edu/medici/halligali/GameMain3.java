package edu.medici.halligali;

import java.util.ArrayList;
import java.util.Scanner;

public class GameMain3 {

	public static void main(String[] args) {
		
		HalCardCase halli  = new HalCardCase();
		ArrayList cardlist = new ArrayList();
		
//		halli.printCardCase();
		
		Scanner sc = new Scanner(System.in);
		cardlist = halli.makeCase();
		int size = cardlist.size();
		
		int count = 0;
		for (int i = 0; i < size; i++) {
			
			if(i == size-1 ) {
				i = 0;
			}
			
			String temp = (String) cardlist.get(i);

				System.out.print("[" + temp + "]");
			
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
			String temp2 = (String) cardlist.get(i+1);
			System.out.print("[" + temp2 + "]");
			System.out.println();
			
			String fruit = temp.substring(0, temp.length() -1);
			int num = Integer.parseInt(temp.substring(temp.length()-1, temp.length()));
			
			String fruit2 = temp2.substring(0, temp2.length() -1);
			int num2 = Integer.parseInt(temp2.substring(temp2.length()-1, temp2.length()));

			if((fruit.equals(fruit2) && (num+num2 ==5)) ||  (!fruit.equals(fruit2))&&(num == 5 || num2 == 5)){
				System.out.println("종을 쳐라!(yes/no)");
				String yno = sc.nextLine();
				if(yno.equals("yes") || yno.equals("y")) {
					System.out.println("띵");
					count++;
					System.out.println(count);
				}
			}
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

			if(count ==10) {
				System.out.println("승리!");
				break;
			}
			
		}

	}
}