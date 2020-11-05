package kr.co.kihd.polyparameter;

public class PolyArgumentTest {
	
	public static void main(String[] args) {
		
		Buyer buyer = new Buyer();
		buyer.buy(new TV());
		System.out.println("현재 남은 돈 : " + buyer.money + "만원 입니다.");
		System.out.println("현재 남은 포인트는 : " + buyer.bonusPoint + "점 입니다.");
		
		buyer.buy(new Audio());
		System.out.println("현재 남은 돈 : " + buyer.money + "만원 입니다.");
		System.out.println("현재 남은 포인트는 : " + buyer.bonusPoint + "점 입니다.");
		
		buyer.buy(new Computer());
		System.out.println("현재 남은 돈 : " + buyer.money + "만원 입니다.");
		System.out.println("현재 남은 포인트는 : " + buyer.bonusPoint + "점 입니다.");
	
		//buyer.buy(new Apple());    //Apple 클래스는 Product 클래스의 자손이 아님
	}
	
}
