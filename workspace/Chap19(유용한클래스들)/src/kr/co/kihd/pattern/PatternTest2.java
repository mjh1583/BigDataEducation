package kr.co.kihd.pattern;

import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PatternTest2 {
	
	public static void main(String[] args) {
		
		String[] data = {"bat", "baby", "bonus", "ca", "cb", "c.", "car", "com", "date", "zoo", "disc"};
		//소문자 c로 시작하는 영어단어나 문자를 패턴으로 정의
		Pattern pattern = Pattern.compile("c[a-z]*");
		
		Vector<String> vString = new Vector<>();
		
		for(String str : data) {
			Matcher matcher = pattern.matcher(str);
			//정의르르 한 패턴과 일치하는가?
			if(matcher.matches()) {
				System.out.println(str);
				vString.add(str);
			}
		}
		System.out.println();
		System.out.println("c로 시작하는 소문자 영단어 : " + vString);
	}
	
}
