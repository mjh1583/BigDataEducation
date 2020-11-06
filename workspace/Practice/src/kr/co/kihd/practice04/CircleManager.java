package kr.co.kihd.practice04;

import java.util.Scanner;

//실습문제 6번
class Circle {
	private double x, y;
	private int radius;
	
	public Circle(double x, double y, int radius) {
		super();
		this.x = x;
		this.y = y;
		this.radius = radius;
	}
	
	public double getX() {
		return x;
	}

	public double getY() {
		return y;
	}

	public int getRadius() {
		return radius;
	}

	public void show() {
		System.out.printf("(%.1f, %.1f) %d\n", this.x, this.y, this.radius);
	}
	
	public double rr(Circle c) {
		return Math.pow(c.radius, 2) * 3.14;
	}
}

public class CircleManager {
	
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		Circle[] c = new Circle[3];
		
		for(int i = 0; i < c.length; i++) {
			System.out.print("x, y, radius >> ");
			double x = scanner.nextDouble();
			double y = scanner.nextDouble();
			int radius = scanner.nextInt();
			c[i] = new Circle(x, y, radius);
		}
		
		for(int i = 0; i < c.length; i++) {
			c[i].show();
		}
		
		Circle max = new Circle(0, 0, 0);
		
		for(int i = 0; i < c.length; i++) {
			if(max.getRadius() <= c[i].getRadius()) {
				max = c[i];
			}
		}
		System.out.print("가장 면적이 큰 원은 ");
		max.show();
		
		scanner.close();
	}
	
}
