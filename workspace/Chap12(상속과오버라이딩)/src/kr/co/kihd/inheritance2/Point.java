package kr.co.kihd.inheritance2;

//독립 클래스
public class Point {

	int x;
	int y;
	
	//기본생성자
	public Point() {
		this(0, 0);
	}

	//매개변수가 있는 생성자
	public Point(int x, int y) {
		System.out.println("Point 클래스의 매개변수가 있는 생성자 호출");
		this.x = x;
		this.y = y;
	}
	
}
