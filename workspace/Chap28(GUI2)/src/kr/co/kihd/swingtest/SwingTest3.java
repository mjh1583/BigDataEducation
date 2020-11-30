package kr.co.kihd.swingtest;

import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class SwingTest3 extends JFrame {
	
	Container container;
	JButton btn1, btn2, btn3, btn4;
	
	public SwingTest3() {
		super("버튼 제작 테스트");
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		container = getContentPane();
		container.setLayout(new FlowLayout());
		
		btn1 = new JButton("일반 버튼");
		btn1.addActionListener(new EventHandler());
		container.add(btn1);
		btn2 = new JButton("2 버튼");
		btn2.addActionListener(new EventHandler());
		container.add(btn2);
		btn3 = new JButton("3 버튼");
		btn3.addActionListener(new EventHandler());
		container.add(btn3);
		btn4 = new JButton("4 버튼");
		btn4.addActionListener(new EventHandler());
		container.add(btn4);
		
		setSize(300, 300);
		setVisible(true);
	}
	
	public class EventHandler implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			
			Object obj = e.getSource();
			
			if(obj == btn1) {
				System.out.println("위치 : " + btn1.getX() + ", " + btn1.getY() + " 크기 : " + btn1.getSize());
			}
			else if(obj == btn2) {
				
			}
			else if(obj == btn3) {
				
			}
			else {
				
			}
		}
		
	}
	
	public static void main(String[] args) {
		
		new SwingTest3();
		
	}
	
}
