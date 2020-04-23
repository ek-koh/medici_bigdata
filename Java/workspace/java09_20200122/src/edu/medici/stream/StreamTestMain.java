package edu.medici.stream;

import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class StreamTestMain {

	public static void main(String[] args) {
		List<String> list = Arrays.asList("수지", "설현", "BTS");
		
		// 순차적 처리
//		Stream<String> stream = list.stream();
//		stream.forEach(s -> {
//			System.out.println(s);
//		});
//		
//		System.out.println();
//		
//		// 병렬로 처리
//		Stream<String> parellelStream = list.parallelStream();
//		parellelStream.forEach(s -> {
//			System.out.println(s);
//		});
		
		// 스트림 얻기
		// 배열로부터 스트림 얻기
		String[] strArray = {"홍길동1","홍길동2","홍길동3","홍길동4","홍길동5"};
		Stream<String> strStream = Arrays.stream(strArray);
		strStream.forEach(a -> {
			System.out.println(a+",");
		});
		
		// 숫자 범위로부터 스트림 얻기
//		IntStream stream = IntStream.range(1, 100); // 1-99
		IntStream stream = IntStream.rangeClosed(1, 100); // 1-100
		
		stream.forEach(a -> {
			int sum = 0;
			sum += a;
			System.out.println("합: "+sum);
		});
	}

}
