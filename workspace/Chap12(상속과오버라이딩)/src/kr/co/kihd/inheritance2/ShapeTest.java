package kr.co.kihd.inheritance2;

public class ShapeTest {

	public static void main(String[] args) {
		Circle circle = new Circle();
		circle.draw();
		System.out.println();
		
		Circle circle2 = new Circle(new Point(150, 150), 500);
		circle2.draw();
		System.out.println();
		
		Triangle triangle = new Triangle();
		triangle.draw();
		System.out.println();
		
		Triangle triangle2 = new Triangle(new Point(150, 150), new Point(100, 100), new Point(200, 200));
		triangle2.draw();
		System.out.println();
		
		Triangle triangle3 = new Triangle(new Point[] {new Point(300, 300), new Point(400, 400), new Point(500, 500)});
		triangle3.draw();
	}
	
}
