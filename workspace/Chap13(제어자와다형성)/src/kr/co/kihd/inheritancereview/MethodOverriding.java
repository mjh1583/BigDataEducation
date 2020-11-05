package kr.co.kihd.inheritancereview;

class Shape {
	public Shape next;
	
	public Shape() {
		this.next = null;
	}
	
	public void draw() {
		System.out.println("Shape");
	}
}

class Line extends Shape {
	@Override
	public void draw() {
		System.out.println("Line");
	}
}

class Rect extends Shape {
	@Override
	public void draw() {
		System.out.println("Rectangle");
	}
}

class Circle extends Shape {
	@Override
	public void draw() {
		System.out.println("Circle");
	}
}

public class MethodOverriding {
	
	static void paint(Shape shape) { //Shape를 상속받은 모든 객체들이 매개변수 shape로 넘어올 수 있음
		shape.draw(); //shape가 가리키는 객체 내에 오버라이딩한 draw() 호출. 동적바인딩
	}
	
	public static void main(String[] args) {
		
		Line line = new Line();
		paint(line);
		paint(new Shape());
		paint(new Rect());
		paint(new Circle());
		
	}
	
}
