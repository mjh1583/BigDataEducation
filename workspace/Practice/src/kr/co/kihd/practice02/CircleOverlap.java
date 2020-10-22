package kr.co.kihd.practice02;

import java.util.Scanner;

public class CircleOverlap{
	//실습문제 10번
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("첫번째 원의 중심과 반지름 입력>>");
		double x1 = scan.nextDouble();
		double y1 = scan.nextDouble();
		double r1 = scan.nextDouble();
		System.out.print("두번째 원의 중심과 반지름 입력>>");
		double x2 = scan.nextDouble();
		double y2 = scan.nextDouble();
		double r2 = scan.nextDouble();
		
		/*
		 * 중심점 간의 거리 > 두 반지름의 합 => 두 원은 서로 충돌하지 않음
		 * 중심점 간의 거리 < 두 반지름의 합 => 두 원은 서로 충돌
		 * 중심점 간의 거리 = 두 반지름의 합 => 두 원은 서로 붙어있음
		 */
		
		// 두 원의 중심점 간의 거리(피타고라스 정리)
		double distance = Math.sqrt((x1-x2)*(x1-x2) + Math.pow(y1-y2, 2));
		double rSum = r1 + r2;
		
		if(distance > rSum)
		{
			System.out.println("두 원은 서로 겹치지 않는다.");
		}
		else if(distance == rSum)
		{
			System.out.println("두 원은 서로 붙어있다.");
		}
		else
			System.out.println("두 원은 서로 겹친다.");
		
		scan.close();
	}

}
