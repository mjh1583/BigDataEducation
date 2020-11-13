package kr.co.kihd.token;

import java.util.StringTokenizer;

public class SplitStringTokenizerTest2 {
	
	public static void main(String[] args) {
		
		//split()는 구분자를 공백으로 주었을때 데이터가 공백을 다수 포함하고 있다면,
		//공백도 하나의 토큰으로 인식한다.
		//String data = "baby           cat dog";
		String data = "baby cat dog a b sedr ger g h ae h t g f";
		String[] result = data.split(" ");
		
		long start = System.nanoTime();
		
		for(String str : result) {
			System.out.println(str);
		}
		
		long end = System.nanoTime();
		System.out.println("걸린 시간 : " + (end - start)/1000000000.0 + "s");
		System.out.println("토큰 개수 : " + result.length);
		System.out.println("--------------------------------------");
		
		StringTokenizer sTokenizer = new StringTokenizer(data, " ");

		long start2 = System.nanoTime();
		
		while(sTokenizer.hasMoreTokens()) {
			//System.out.println("남은 토큰수 : " + sTokenizer.countTokens());
			String str = sTokenizer.nextToken();
			System.out.println(str);
		}
		long end2 = System.nanoTime();
		System.out.println("걸린 시간 : " + (end2 - start2)/1000000000.0 + "s");
		
	}
	
}
