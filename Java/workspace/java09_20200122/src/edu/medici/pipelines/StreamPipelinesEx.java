package edu.medici.pipelines;

import java.util.Arrays;
import java.util.List;

public class StreamPipelinesEx {
	// 중간처리, 최종처리
	public static void main(String[] args) {
		List<Member> list = Arrays.asList(
				new Member("홍길동1", Member.MALE, 10),
				new Member("홍길동2", Member.MALE, 20),
				new Member("홍길동3", Member.MALE, 30),
				new Member("홍길동4", Member.MALE, 10)
		);
		double ageAvg = list.stream()					// 오리지널 스트림
			.filter(m -> m.getSex() == Member.MALE)		// 중간
			.mapToInt(Member::getAge)					// 중간
			.average()									// 최종
			.getAsDouble();  
			
		System.out.println("남자들의 평균 나이: "+ageAvg);		
	}

}
