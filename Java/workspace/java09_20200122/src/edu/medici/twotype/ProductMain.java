package edu.medici.twotype;

public class ProductMain {

	public static void main(String[] args) {
		// exam1
		Product<Tv, String> product = new Product<>();
		product.setKind(new Tv());
		product.setModel("스마트 TV");
		Tv tv = product.getKind();
		String model = product.getModel();
		
		// exam2
		Product<Car, String> product1 = new Product<>();
		product1.setKind(new Car());
		product1.setModel("디젤");
		Car car = product1.getKind();
		String model1 = product1.getModel();
	}

}
