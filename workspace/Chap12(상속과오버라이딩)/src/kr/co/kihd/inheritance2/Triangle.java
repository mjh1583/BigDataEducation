package kr.co.kihd.inheritance2;

public class Triangle extends Shape{

	Point[] point;       //객체배열
	
	public Triangle() {
		this(new Point(0,0), new Point(50, 50), new Point(100, 100));
	}

	public Triangle(Point point1, Point point2, Point point3) {
		System.out.println("Triangle의 매개변수 3개 호출됨");
		this.point = new Point[] {point1, point2, point3};
	}
	
	public Triangle(Point[] point) {
		System.out.println("Triangle의 매개변수 point 호출됨");
		this.point = point;
	}
	
	@Override
	public void draw() {
		System.out.println("[point1] : " + this.point[0].x + ", " + this.point[0].y
				+ "  [point2] : " + this.point[1].x + ", " + this.point[1].y
				+ "  [point3] : " + this.point[2].x + ", " + this.point[2].y);
	}
}
