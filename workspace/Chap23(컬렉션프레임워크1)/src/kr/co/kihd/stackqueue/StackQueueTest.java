package kr.co.kihd.stackqueue;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class StackQueueTest {
	
	public static void main(String[] args) {
		
		Stack<String> stack = new Stack<>();
		//Queue인터페이스를 구현한 LinkedList클래스 생성 후 대입하고 있음.
		Queue<String> queue = new LinkedList<>();
		
		//LIFO(후입선출) -- 택시 동전통
		stack.push("0");
		stack.push("1");
		stack.push("2");
		
		//FIFO(선입선출) -- 파이프, 수도호스
		queue.offer("0");
		queue.offer("1");
		queue.offer("2");
		
		System.out.println("=스택=");
		while(!stack.isEmpty()) {
			System.out.println(stack.pop());
		}
		
		System.out.println("=큐=");
		while(!queue.isEmpty()) {
			System.out.println(queue.poll());
		}
		
	}
	
}
