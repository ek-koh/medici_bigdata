package edu.medici.instanceofexam;

public class People {
		private String name;
		private int age;
		
		// default 생성자: 여기서는 초기값을 설정해 준 상태
		public People() {
			name = "이름";
			age = 10;
		}
		
		// 생성자 오버로딩
		public People(String name2, int age2) {
			name = name2;
			age = age2;
		}
		
		// name
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		
		// age
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		
		
}
