package kr.co.kihd.component;

import java.awt.Button;
import java.awt.FlowLayout;
import java.awt.Frame;

public class FlowLayoutTest extends Frame {
	
	//Button btn1, btn2, btn3, btn4, btn5;
	Button[] btn;
	
	public FlowLayoutTest() {
		setSize(600, 400);
		
		FlowLayout fLayout = new FlowLayout(FlowLayout.RIGHT, 30, 40);
		setLayout(fLayout);
		
		btn = new Button[5];
		
		for(int i = 0; i < btn.length; i++) {
			btn[i] = new Button("Btn" + (i + 1));
			add(btn[i]);
		}
		
//		btn1 = new Button("Btn1");
//		btn2 = new Button("Btn2");
//		btn3 = new Button("Btn3");
//		btn4 = new Button("Btn4");
//		btn5 = new Button("Btn5");
//		
//		add(btn1);
//		add(btn2);
//		add(btn3);
//		add(btn4);
//		add(btn5);
	}
	
	public static void main(String[] args) {
		
		FlowLayoutTest fLayoutTest = new FlowLayoutTest();
		fLayoutTest.setVisible(true);
		
	}
	
}
