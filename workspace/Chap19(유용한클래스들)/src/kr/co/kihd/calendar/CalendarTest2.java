package kr.co.kihd.calendar;

import java.util.Calendar;

public class CalendarTest2 {
	
	public static void main(String[] args) {
		
		Calendar today = Calendar.getInstance();
		
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH) + 1;
		int day = today.get(Calendar.DAY_OF_MONTH);
		int week = today.get(Calendar.DAY_OF_WEEK);
		String strWeek = null;
		
		switch(week) {
			case Calendar.SUNDAY:
				strWeek = "일요일";
				break;
			case Calendar.MONDAY:
				strWeek = "월요일";
				break;
			case Calendar.TUESDAY:
				strWeek = "화요일";
				break;
			case Calendar.WEDNESDAY:
				strWeek = "수요일";
				break;
			case Calendar.THURSDAY:
				strWeek = "목요일";
				break;
			case Calendar.FRIDAY:
				strWeek = "금요일";
				break;
			case Calendar.SATURDAY:
				strWeek = "토요일";
				break;
		}
		
		System.out.println("오늘은 " + year + "년 " + month + "월 " + day + "일 " + strWeek);
		System.out.printf("오늘은 %d년 %d월 %d일 %s", year, month, day, strWeek);
		
	}
	
}
