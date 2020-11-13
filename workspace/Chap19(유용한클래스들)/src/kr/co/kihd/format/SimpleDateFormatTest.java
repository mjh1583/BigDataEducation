package kr.co.kihd.format;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SimpleDateFormatTest {
	
	public static void main(String[] args) {
		
		Date date = new Date();
		System.out.println(date.toString());
		
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd E요일 a hh:mm:ss");
		System.out.println(sFormat.format(date));
		
		//요일
		sFormat = new SimpleDateFormat("오늘은 E요일");
		System.out.println(sFormat.format(date));
		
		//년기준
		sFormat = new SimpleDateFormat("오늘은 올해의 D번째 날");
		System.out.println(sFormat.format(date));
		
		//월기준
		sFormat = new SimpleDateFormat("오늘은 이달의 d번째 날");
		System.out.println(sFormat.format(date));
		
		//시차
		sFormat = new SimpleDateFormat("X");
		System.out.println(sFormat.format(date));
		
		//존(시간대)
		sFormat = new SimpleDateFormat("z");
		System.out.println(sFormat.format(date));
		
	}
	
}
