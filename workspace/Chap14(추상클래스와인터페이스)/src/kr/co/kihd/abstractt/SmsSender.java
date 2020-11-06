package kr.co.kihd.abstractt;

public class SmsSender extends ContentSender {

	private String content;
	
	public SmsSender(String title, String name, String content) {
		super(title, name);
		this.content = content;
	}

	public String getContent() {
		return this.content;
	}

	//조상클래스의 추상메서드를 오버라이딩
	@Override
	public void sendMessage(String recipient) {
		System.out.println("제목2 : " + this.getTitle());
		System.out.println("이름2 : " + this.getName());
		System.out.println("내용2 : " + this.getContent());
		System.out.println("받는 사람2 : " + recipient);
	}

}
