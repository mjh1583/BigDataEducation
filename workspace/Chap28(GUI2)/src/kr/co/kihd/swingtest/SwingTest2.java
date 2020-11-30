package kr.co.kihd.swingtest;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;

public class SwingTest2 extends JFrame {
	
	public SwingTest2() {
		super("컴포넌트 추가하기");
		//프레임이 닫힐때 프로그램이 같이 종료된다.
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		Container contentPane = getContentPane();
		contentPane.setLayout(new FlowLayout());
		contentPane.setBackground(Color.YELLOW);
		
		setSize(300, 300);
		setVisible(true);
		
		contentPane.add(new JButton("확인"));
		contentPane.add(new JButton("취소"));
		
	}
	
	public static void main(String[] args) {
		
		new SwingTest2();
		
	}
	
}
