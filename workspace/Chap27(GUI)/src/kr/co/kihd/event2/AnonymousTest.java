package kr.co.kihd.event2;

import java.awt.Button;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AnonymousTest extends Frame {
	
	Button btn;
	
	public AnonymousTest() {
		setBounds(200, 200, 300, 300);
		btn = new Button("Exit");
		add(btn, "South");
		
		btn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
			
		});
	}
	
	public static void main(String[] args) {
		
		AnonymousTest am = new AnonymousTest();
		am.setVisible(true);
		
	}
	
}

//class EventHandler implements ActionListener {
//
//	@Override
//	public void actionPerformed(ActionEvent e) {
//		System.exit(0);
//	}
//	
//}
