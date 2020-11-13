package kr.co.kihd.calendar;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class CalendarTest3 {
	
	public static void main(String[] args) {
		
		Calendar today1 = Calendar.getInstance();
		Calendar today2 = Calendar.getInstance();
		
		//날짜를 설정
		today1 = new GregorianCalendar(2021, Calendar.FEBRUARY, 17);
		
		long diffSec = (today1.getTimeInMillis() - today2.getTimeInMillis()) / 1000;
		System.out.println("20201113~20210217사이의 초 : " + diffSec + "초");
		
		//1일 == 24*60*60
		long diffDay = diffSec / (24*60*60);
		System.out.println("20201113~20210217사이의 남은 일 수 : " + diffDay + "일");
		
	}
	
}
