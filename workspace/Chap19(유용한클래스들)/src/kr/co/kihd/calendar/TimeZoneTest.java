package kr.co.kihd.calendar;

import java.util.TimeZone;

public class TimeZoneTest {
	
	public static void main(String[] args) {
		
		String[] timeZone = TimeZone.getAvailableIDs();
		
		for(String zoneId : timeZone) {
			System.out.println("타임존 영역 : " + zoneId);
		}
		
	}
	
}
