package kr.co.kihd.initialize;

import java.util.Arrays;

public class ProductTest {

	public static void main(String[] args) {

		Product product1 = new Product();
		//System.out.println("Product.Number : " + Product.number + ", countNo : " + product1.countNo);
		
		Product product2 = new Product();
		//System.out.println("Product.Number : " + Product.number + ", countNo : " + product2.countNo);
		
		Product product3 = new Product();
		
		System.out.println("Product.Number : " + Product.number + ", countNo : " + product1.countNo);
		System.out.println("Product.Number : " + Product.number + ", countNo : " + product2.countNo);
		System.out.println("Product.Number : " + Product.number + ", countNo : " + product3.countNo);
		System.out.println(Arrays.toString(product1.arr));
		System.out.println(Arrays.toString(product2.arr));
		System.out.println(Arrays.toString(product3.arr));
		
	}

}
