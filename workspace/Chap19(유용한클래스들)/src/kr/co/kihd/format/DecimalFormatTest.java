package kr.co.kihd.format;

import java.text.DecimalFormat;

public class DecimalFormatTest {
	
	public static void main(String[] args) {
		
		double number = 5577669.587;
		
		//0은 자릿수 다 차지를 하고 표식을 하는 반면에,
		//#은 자릿수 다 차지를 하고 표식이 안된다.
		
		DecimalFormat dFormat = new DecimalFormat("0");
		System.out.println(dFormat.format(number));
		
		dFormat = new DecimalFormat("0.0");
		System.out.println(dFormat.format(number));
		
		dFormat = new DecimalFormat("00000000000000000.000000000000000000000");
		System.out.println(dFormat.format(number));

		dFormat = new DecimalFormat("#");
		System.out.println(dFormat.format(number));
		
		dFormat = new DecimalFormat("#.#");
		System.out.println(dFormat.format(number));
		
		dFormat = new DecimalFormat("########,###.00");
		System.out.println(dFormat.format(number));
		
	}
	
}
