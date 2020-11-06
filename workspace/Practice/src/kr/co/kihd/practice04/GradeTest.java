package kr.co.kihd.practice04;

import java.util.Scanner;

//실습문제 2번
class Grade {
	private int math;
	private int science;
	private int english;
	
	public Grade(int math, int science, int english) {
		this.math = math;
		this.science = science;
		this.english = english;
	}
	
	public int getMath() {
		return math;
	}

	public int getScience() {
		return science;
	}

	public int getEnglish() {
		return english;
	}

	public double average() {
		return (double)(this.getMath() + this.getScience() + this.getEnglish()) / 3.0;
	}

}

public class GradeTest{

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("수학, 과학, 영어 순으로 3개의 점수 입력>> ");
		int math = scanner.nextInt();
		int science = scanner.nextInt();
		int english = scanner.nextInt();
		Grade me = new Grade(math, science, english);
		System.out.printf("평균은 %.2f", me.average());
		
		scanner.close();
	}


	
}
