package kr.co.kihd.stackqueue;

import java.util.Stack;

public class StackTest {
	
	public static void main(String[] args) {
		
		Stack<Coin> coinBox = new Stack<>();
		coinBox.push(new Coin(100));
		coinBox.push(new Coin(10));
		coinBox.push(new Coin(500));
		coinBox.push(new Coin(100));
		coinBox.push(new Coin(300));
		
		while(!coinBox.isEmpty()) {
			System.out.println(coinBox.pop().getValue());
		}
		
	}
	
}
