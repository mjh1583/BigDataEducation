package kr.co.kihd.polyparameter;

//독립클래스
public class Buyer {
	
	int money = 1000;       //소유금액
	int bonusPoint = 0;		 //보너스 점수
	
	public void buy(Product product) {
		//구매자가 가진 돈보다 제품의 가격이 비싼 경우
		if(this.money < product.price) {
			System.out.println("잔액이 부족하여, 물건 구입이 안됩니다.");
			return;
		}
		
		this.money -= product.price;
		this.bonusPoint += product.bonusPoint;
		System.out.println(product + "를 구매하셨습니다.");
		
	}
	
}
