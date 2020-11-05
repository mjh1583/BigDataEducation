package kr.co.kihd.pmapp;

public class ConversationBook extends Book {
	
	private String language;

	public ConversationBook(int productId, String description, String maker, int price, int iSBN, String title,
			String author, String language) {
		super(productId, description, maker, price, iSBN, title, author);
		this.language = language;
	}

	public String getLanguage() {
		return language;
	}
	
	@Override
	public void showInfo() {
		super.showInfo();
		System.out.println("언어 >> " + this.getLanguage());
	}
	
}
