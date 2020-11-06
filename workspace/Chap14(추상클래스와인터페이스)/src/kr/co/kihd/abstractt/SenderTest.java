package kr.co.kihd.abstractt;

public class SenderTest {
	
	public static void main(String[] args) {
		
		//추상클래스이니 절대 인스턴스를 생성할 수 없다.
//		ContentSender contentSender = new ContentSender();
		
		//추상클래스도 조상이니까 필드의 다형성 적용됨.
		ContentSender contentSender1 = new KakaoSender("카카오톡", "김원효", "안녕 해피바이러스!"); //업캐스팅(자동형변환)
		contentSender1.sendMessage("박지선");
		System.out.println();
		
		ContentSender contentSender2 = new SmsSender("SMS", "박성광", "네 귀하고 씩씩했던 삶!");
		contentSender2.sendMessage("박지선");
	}
	
}
