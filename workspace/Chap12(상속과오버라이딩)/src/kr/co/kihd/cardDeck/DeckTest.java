package kr.co.kihd.cardDeck;

public class DeckTest {

	public static void main(String[] args) {
		//Deck의 생성자를 호출하면 항상 포함된 클래스(Card)부터 생성
		Deck deck = new Deck();
		Card card = deck.pick(0);
		System.out.println("카드 섞기 전에 제일 위에 있는 카드 => ");
		System.out.println(card.toString());
		
		card = deck.pick(51);
		System.out.println("카드 섞기 전에 제일 위에 있는 카드 => ");
		System.out.println(card.toString());
		
		deck.shuffle();
		card = deck.pick(0);
		System.out.println("카드 섞은 후에 제일 위에 있는 카드 => ");
		System.out.println(card.toString());
		
		card = deck.pick(51);
		System.out.println("카드 섞은 후에 제일 위에 있는 카드 => ");
		System.out.println(card.toString());
		
		card =  deck.pick();
		System.out.println(card.toString());
	}

}
