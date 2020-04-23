package edu.medici.typecheck;

public class Util {
	public static <T extends Number> int compare(T t1, T t2){
	    double v1 = t1.doubleValue(); // Number 클래스에 있는 doubleValue() 메소드 사용 가능
	    double v2 = t2.doubleValue();
	    return Double.compare(v1,v2); // v1>v2: +, v1<v2: -
	}
}
