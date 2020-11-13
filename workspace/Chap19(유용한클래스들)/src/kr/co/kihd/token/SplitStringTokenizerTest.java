package kr.co.kihd.token;

import java.util.StringTokenizer;

public class SplitStringTokenizerTest {
	
	public static void main(String[] args) {
		
		//split()는 구분자를 공백으로 주었을때 데이터가 공백을 다수 포함하고 있다면,
		//공백도 하나의 토큰으로 인식한다.
		//String data = "baby           cat dog";
		String data = "baby           cat dog a b sedr ger g h ae h t g f ";
		String[] result = data.split(" ");
		
		for(String str : result) {
			System.out.println(str);
		}
		System.out.println("토큰 개수 : " + result.length);
		System.out.println("--------------------------------------");
		
		StringTokenizer sTokenizer = new StringTokenizer(data, " ");
		
		while(sTokenizer.hasMoreTokens()) {
			//System.out.println("남은 토큰수 : " + sTokenizer.countTokens());
			String str = sTokenizer.nextToken();
			System.out.println(str);
		}
		
	}
	
}
