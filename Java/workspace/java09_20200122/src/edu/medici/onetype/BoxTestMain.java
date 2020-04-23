package edu.medici.onetype;

public class BoxTestMain {

	public static void main(String[] args) {
		Box<String> box = new Box<String>();
		box.set("hello~");
		String str = box.get();
	}

}
