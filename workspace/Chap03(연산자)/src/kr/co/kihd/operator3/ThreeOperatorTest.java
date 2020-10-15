package kr.co.kihd.operator3;

import java.util.Scanner;

public class ThreeOperatorTest {
	
	public static void main(String[] args) {
		//삼항 연산자 사용하는 방법 익히기
		Scanner scan = new Scanner(System.in);
		
		System.out.print("점수를 입력하세요 : ");
		int score = scan.nextInt();
		
		// (조건식) ? 1 : 2           삼항연산자 중첩 사용
		char grade = (score >= 90) ? 'A' : ((score >= 80) ? 'B' : ((score >= 70) ? 'C' : ((score >= 60) ? 'D' : 'F')));
		System.out.println("당신의 등급 : " + grade);

		scan.close();
		
	}

}
