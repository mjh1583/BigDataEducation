package kr.co.kihd.calendar;

import java.util.Calendar;
import java.util.TimeZone;

public class TimeZoneTest {
	
	public static void main(String[] args) {
		
		String[] timeZone = TimeZone.getAvailableIDs();
		
		for(String zoneId : timeZone) {
			System.out.println("타임존 영역 : " + zoneId);
		}
		
		TimeZone tZone = TimeZone.getTimeZone("America/New_York");
		Calendar today = Calendar.getInstance(tZone);
		
		System.out.println(toString(today));
		
	}
	
	public static String toString(Calendar date) {
		int i = date.get(Calendar.AM_PM);
		String str = "";
		
		if(i == 0) {
			str = "AM";
		}
		else {
			str = "PM";
		}
		
		return date.get(Calendar.YEAR) + "년 " +
		(date.get(Calendar.MONTH) + 1) + "월 " + 
		date.get(Calendar.DATE) + "일" + 
		" " + str + " " + 
		date.get(Calendar.HOUR_OF_DAY) + "시 " +
		date.get(Calendar.MINUTE) + "분 " +
		date.get(Calendar.SECOND) + "초";
	}
	
}
