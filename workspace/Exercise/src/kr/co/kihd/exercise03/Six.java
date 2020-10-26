package kr.co.kihd.exercise03;

public class Six {
	
	public static void main(String[] args) {
		int[] array = {1,2,3,4,5};
		
		System.out.println("array.length : " + array.length);
		
		for(int i : array)
		{
			System.out.println("array[" + (i-1) +"] = " + array[i-1]);
		}
	}
}
