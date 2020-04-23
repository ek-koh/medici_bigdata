package edu.medici.pipelines;

import java.util.Arrays;
import java.util.List;

public class FilteringExam {
	public static void main(String[] args) {
		List<String> names = Arrays.asList(
				"정인선", "조수아", "정인선", "배수지", "조두산", "조형기"
				);
//		// 1
//		names.stream()
//			.forEach(n -> System.out.println(n));
//		
//		System.out.println();
//		// 2. 중복제거
//		names.stream()
//			.distinct()
//			.forEach(n -> System.out.println(n));
//		
//		System.out.println();
//		// 3
//		names.stream()
//			.filter(n -> n.startsWith("조"))
//			.forEach(n -> System.out.println(n));
//		
//		System.out.println();
//		// 4
//		names.stream()
//			.distinct()
//			.filter(n -> n.startsWith("정"))
//			.forEach(n -> System.out.println(n));
		
		
		
		List<String> inputList = Arrays.asList("Java8 lambda", "stream mapping");
		
		inputList.parallelStream()
			.flatMap(data -> Arrays.stream(data.split(" ")))
			.forEach(word -> System.out.println(word));
	}
}
