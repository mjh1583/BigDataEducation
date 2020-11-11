package kr.co.kihd.clone;

public class ProductTest {
	
	public static void main(String[] args) {
		
		Product original = new Product("1004", "TV", 300, new int[] {10, 20}, new Apple(500));
		
		//얕은 복제를 한 객체를 리턴
		Product cloned = original.getProduct();
		
		System.out.println(original);
		System.out.println();
		System.out.println(cloned);
		
		System.out.println("----------------------------------");
		int[] arr1 = cloned.getArr();
		Apple apple = cloned.getApple();
		
		int[] arr2 = original.getArr();
		System.out.println("배열주소(복제개체) : " + arr1);
		System.out.println("배열주소(원본개체) : " + arr2);
		
		System.out.println("----------------------------------");
		arr1[0] = 777;
		apple.price = 1000;
		System.out.println(original);
		System.out.println();
		System.out.println(cloned);
		
	}
	
}
