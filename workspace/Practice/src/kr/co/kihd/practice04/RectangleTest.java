package kr.co.kihd.practice04;

//실습문제 4번
class Rectangle {
	private int x, y, width, height;

	public Rectangle(int x, int y, int width, int height) {
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}

	public int getWidth() {
		return width;
	}

	public int getHeight() {
		return height;
	}
	
	public int square() {
		return this.getWidth() * this.getHeight();
	}
	
	public void show() {
		System.out.printf("(%d, %d)에서 크기가 %dx%d인 사각형\n", this.getX(), this.getY(), this.getWidth(), this.getHeight());
	}
	
	public boolean contains(Rectangle r) {
		if(this.getX() < r.getX() && this.getY() < r.getY() && this.getX() + this.getWidth() > r.getX() 
				+ r.getWidth() && this.getY() + this.getHeight() > r.getY() + r.getHeight())
			return true;
		else
			return false;
	}
	
}

public class RectangleTest {
	
	public static void main(String[] args) {
		Rectangle r = new Rectangle(2, 2, 8, 7);
		Rectangle s = new Rectangle(5, 5, 6, 6);
		Rectangle t = new Rectangle(1, 1, 10, 10);
		
		r.show();
		System.out.println("s의 면적은 : " + s.square());
		if(t.contains(r))
			System.out.println("t는 r을 포함합니다.");
		if(t.contains(s))
			System.out.println("t는 s를 포함합니다.");
	}
	
}
