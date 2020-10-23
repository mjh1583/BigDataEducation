package kr.co.kihd.exception;

import java.util.Arrays;

public class ArrayIndexOutOfBoundsTest {

	public static void main(String[] args) {
		
		int[] arr = new int[5];
		System.out.println(Arrays.toString(arr));
		
//		for(int  i = 0; i < arr.length; i++)
//		{
//			
//		}
		
		for(int i = 0; i < 6; i++)
		{
			arr[i] = 10;
			System.out.println("arr[" + i +  "] = " + arr[i]);
		}
	}

}
