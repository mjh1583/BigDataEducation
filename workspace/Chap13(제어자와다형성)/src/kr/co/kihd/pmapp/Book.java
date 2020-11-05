package kr.co.kihd.pmapp;

public class Book extends Product {

	private int ISBN;
	private String title;
	private String author;
	
	public Book(int productId, String description, String maker, int price, int iSBN, String title, String author) {
		super(productId, description, maker, price);
		this.ISBN = iSBN;
		this.title = title;
		this.author = author;
	}
	
	public int getISBN() {
		return ISBN;
	}



	public String getTitle() {
		return title;
	}



	public String getAuthor() {
		return author;
	}

	@Override
	public void showInfo() {
		super.showInfo();
		System.out.println("국제표준도서번호 >> " + this.getISBN());
		System.out.println("책 제목 >> " + this.getTitle());
		System.out.println("저자 >> " + this.getAuthor());
	}
	
}
