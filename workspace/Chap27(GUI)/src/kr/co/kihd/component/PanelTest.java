package kr.co.kihd.component;

import java.awt.Button;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Label;
import java.awt.Panel;
import java.awt.TextField;

public class PanelTest extends Frame {
	
	Label label1, label2;
	TextField field1, field2;
	Button button;
	
	Panel panel1, panel2;
	
	//생성자
	public PanelTest() {
		this.setSize(400, 500);
		setLayout(new FlowLayout());
		
		panel1 = new Panel();
		add(panel1);
		panel1.setBackground(Color.CYAN);
		
		label1 = new Label("ID : ");
		panel1.add(label1);
		
		field1 = new TextField(20);
		panel1.add(field1);
		
		button = new Button("Confirm");
		panel1.add(button);
		
		panel2 = new Panel();
		add(panel2);
		panel2.setBackground(Color.ORANGE);
		
		label2 = new Label("Password");
		panel2.add(label2);
		
		field2 = new TextField(20);
		panel2.add(field2);
		
	}
	
	public static void main(String[] args) {
		
		PanelTest panelTest = new PanelTest();
		panelTest.setVisible(true);
		
	}
	
}
