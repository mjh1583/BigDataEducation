package kr.co.kihd.array3;

import java.util.Arrays;

public class ArrayCopyTest {

	public static void main(String[] args) {
		
		int[] origin = new int[] {10, 77, 33, 50};
		int[] target = new int[10];
		int count = 0;
		
		System.out.println("복사하기전");
		System.out.println("target의 길이 : " + target.length);
		System.out.println(Arrays.toString(origin));
		System.out.println(Arrays.toString(target));
		System.out.println(target);
		System.out.println();
		
		//복사방법 1. for문
		for(int i = 0; i < origin.length; i++)
		{
			target[i] = origin[i];
		}
		System.out.println("복사 후");
		System.out.println("target의 길이 : " + target.length);
		System.out.println(Arrays.toString(origin));
		System.out.println(Arrays.toString(target));
		System.out.println(target);
		System.out.println();
		
		//복사방법 2. 향상된 for 문
		for(int i : origin)
		{
			target[count++] = i;
		}
		System.out.println("복사 후");
		System.out.println("target의 길이 : " + target.length);
		System.out.println(Arrays.toString(origin));
		System.out.println(Arrays.toString(target));
		System.out.println(target);
		System.out.println();
		
		//복사방법 3. --복사 속도가 가장 빠름
		System.arraycopy(origin, 0, target, 5, origin.length);
		System.out.println("복사 후");
		System.out.println("target의 길이 : " + target.length);
		System.out.println(Arrays.toString(origin));
		System.out.println(Arrays.toString(target));
		System.out.println(target);
		System.out.println();
		
		//복사방법 4. 
		target = Arrays.copyOf(origin, origin.length);
		System.out.println("복사 후");
		System.out.println("target의 길이 : " + target.length);
		System.out.println(Arrays.toString(origin));
		System.out.println(Arrays.toString(target));
		System.out.println(target);
		System.out.println();
		
	}

}
