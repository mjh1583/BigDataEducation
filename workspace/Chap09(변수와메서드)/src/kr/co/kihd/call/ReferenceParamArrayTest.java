package kr.co.kihd.call;

import java.util.Arrays;

public class ReferenceParamArrayTest {

	public static void main(String[] args) {
		
		int[] arr = new int[] {10, 20, 30, 40, 50};
		System.out.println("change() 메서드 호출 전의 값 : " + Arrays.toString(arr));
		System.out.println("main() arr의 주소값 : " + arr);
		change(arr);
		System.out.println("change() 메서드 호출 후의 값 : " + Arrays.toString(arr));
	}
	
	public static void change(int[] arr) {
		arr[0] = 999;
		System.out.println("change() arr의 주소값 : " + arr);
		System.out.println("change() 메서드 내의 값 : " + Arrays.toString(arr));
	}
	
}
