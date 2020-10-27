package kr.co.kihd.staticvariable;

public class Card {

	//인스턴스 변수 -- 반드시 인스턴스를 생성해야 접근 가능
	private String color;       //카드의 색상
	private String company;     //카드 회사명
	
	//static 변수(=정적변수, 클래스변수, 공유변수) -- 인스턴스 생성없이도 클래스명.static 변수명으로 접근 가능
	static int width = 100;    //카드의 폭
	static int height = 50;     //카드의 높이
	
	//getter, setter() 인스턴스 메서드
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	@Override
	public String toString() {
		return "card1의 색상 : " + this.getColor() + ", card1의 회사 : " 
	+ this.getCompany() + ", 크기 : (" + Card.height + ", " + Card.width + ")";
	}

}
