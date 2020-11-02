package kr.co.kihd.inheritance2;

public class Circle extends Shape{

	Point center;  // 원점
	int r;         // 반지름
	
	public Circle() {
		this(new Point(0,0), 100);
	}

	public Circle(Point center, int r) {
		System.out.println("Circle 클래스의 멤버변수가 있는 생성자 호출");
		this.center = center;
		this.r = r;
	}
	
	@Override
	public void draw() {
		System.out.println("색깔 : " + this.color + ", 원점 : (" + this.center.x + ", " + this.center.y + "), 반지름 : " + this.r);
	}
}
