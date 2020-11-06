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
					System.out.println("----------------------------------------");
					for(int i = 0; i < numberOfProduct; i++) {
						product[i].showInfo();
						System.out.println("----------------------------------------");
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
		scan.nextLine();
		System.out.print("상품설명 >> ");
		String desc = scan.nextLine();
		System.out.print("생산자 >> ");
		String maker = scan.nextLine();
		System.out.print("가격 >> ");
		int price = scan.nextInt();
		
		switch(type) {
			case 1 :
				scan.nextLine();
				System.out.print("일반책 제목 >> ");
				String title = scan.nextLine();
				System.out.print("저자 >> ");
				String author = scan.nextLine();
				System.out.print("국제표준도서번호(ex.0001) >> ");
				int ISBN = scan.nextInt();
				
				//필드의 다형성(조상타입의 배열에 자손의 인스턴스를 담고 있음)
				product[numberOfProduct] = new Book(productID++, desc, maker, price, ISBN, title, author); 
				break;
			case 2 :
				scan.nextLine();
				System.out.print("앨범 제목 >> ");
				String albumTitle = scan.nextLine();
				System.out.print("가수 >> ");
				String artist = scan.nextLine();
				
				product[numberOfProduct] = new CompactDisk(productID++, desc, maker, price, albumTitle, artist);
				break;
			case 3 :
				scan.nextLine();
				System.out.print("회화책 제목 >> ");
				String title2 = scan.nextLine();
				System.out.print("저자 >> ");
				String author2 = scan.nextLine();
				System.out.print("언어 >> ");
				String language = scan.nextLine();
				System.out.print("국제표준도서번호(ex.0001) >> ");
				int ISBN2 = scan.nextInt();
				
				product[numberOfProduct] = new ConversationBook(productID++, desc, maker, price, ISBN2, title2, author2, language);
				break;
		}
		numberOfProduct++;
			
	}
	
}
