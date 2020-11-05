package kr.co.kihd.pmapp;

import java.util.Scanner;

public class ProductTest {
	
	//클래스 영역에 올라감(공유)
	static int productID = 0;
	static int numberOfProduct = 0;
	static Product[] product = new Product[10];     //필드의 다형성
	static Scanner scan = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		int choice = 0;
		
		while(choice != 3) {
			int type = 0;
			System.out.println("==========상품조회, 추가 프로그램입니다.==========");
			System.out.print("상품추가(1), 상품조회(2), 끝내기(3) >>");
			
			choice = scan.nextInt();
			
			switch(choice){
				case 1:
					if(numberOfProduct >= product.length) {
						System.out.println("더 이상 상품추가 불가");
						break;
					}
					
					System.out.print("책(1), 음악CD(2), 회화책(3) >>");
					type = scan.nextInt();
					
					if(type < 1 || type > 3) {
						System.out.println("잘못 입력");
						break;
					}
					addProduct(type);
					break;
				case 2:
					for(int i = 0; i < numberOfProduct; i++) {
						product[i].showInfo();
					}
					break;
				case 3:
					System.out.println("프로그램을 종료합니다.");
					break;
				default:
					System.out.println("잘못된 입력입니다.");
			}
		}
		scan.close();
	}

	public static void addProduct(int type) {
		
	}
	
}
