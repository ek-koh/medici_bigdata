package edu.medici.wildcards;

public class WildcardsEx {
	
	// 1 Course<?>
	public static void registerCourse(Course<?> course) {
	}
	//2 Cousre<? extends Student> course
	public static void registerCourseStudent(Course<? extends Student> course) {
	}
	//3 Cousre<? super Student> course
	public static void registerCourseWorker(Course<? super Student> course) {
	}

	public static void main(String[] args) {
		// 1 Course<?>
		registerCourse(new Course<Person>("일반 과정", 5));
		registerCourse(new Course<Student>("대학생 과정", 5));
		registerCourse(new Course<HighStudent>("고등학생 과정", 5));
		registerCourse(new Course<Worker>("제작자 과정", 5));

		//2 Cousre<? extends Student> course
//		registerCourseStudent(new Course<Person>("일반 과정", 5)); // x
//		registerCourseStudent(new Course<Student>("대학생 과정", 5));
//		registerCourseStudent(new Course<HighStudent>("고등학생 과정", 5));
//		registerCourseStudent(new Course<Worker>("제작자 과정", 5)); // x
		
		//3 Cousre<? super Student> course
//		registerCourseWorker(new Course<Person>("일반 과정", 5)); 
//		registerCourseWorker(new Course<Student>("대학생 과정", 5));
//		registerCourseWorker(new Course<HighStudent>("고등학생 과정", 5)); // x
//		registerCourseWorker(new Course<Worker>("제작자 과정", 5)); // x
		
		
	}

}
