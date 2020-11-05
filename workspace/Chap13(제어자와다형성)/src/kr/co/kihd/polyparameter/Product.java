package kr.co.kihd.polyparameter;

public class Product {
	
	int price;         //제품의 가격
	int bonusPoint;    //제품구매시 제공하는 보너스 점수
	
	public Product(int price) {
		this.price = price;
		//보너스 점수 제품가격의 10%를 적립
		this.bonusPoint = (int)(price / 10.0);
	}
	
}
