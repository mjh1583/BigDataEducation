package kr.co.kihd.event2;

import java.awt.Frame;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class TextComponentTest2 extends Frame {
	
	TextField textField;
	TextArea textArea;
	
	public TextComponentTest2(String title) {
		super(title);
	}
	
	public void textComponentShow() {
		this.textField = new TextField();
		this.textArea = new TextArea();
		
		//Frame은 원래 BorderLayout이므로 아래와 같이 추가하면 된다.
		this.add(textField, "South");
		this.add(textArea, "Center");
		
		/*
		 * ActionEvent가 발생하는 4가지가 있다.
		 * 		1. Button이 클릭되었을 때
		 * 		2. Menu를 클릭했을 때
		 * 		3. TextField에서 Enter키를 눌렀을 때
		 * 		4. List의 Item하나를 선택해서 더블클릭했을 때
		 */
		
		this.textField.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				//TextField에서 Enter를 치면, textArea에 입력된 text를 추가한다.
				textArea.append(textField.getText() + "\n");
				//textField의 내용을 지운다.
				textField.setText("");
				textField.requestFocus();
			}
		});
		
		//textArea의 글자를 편집하지 못하게 만든다.
		this.textArea.setEditable(false);
		
		this.setSize(300, 200);
		this.setLocation(500, 300);
		this.setVisible(true);
		//focus가 실행됨과 동시에 textField에 위치하도록 설정함.
		this.textField.requestFocus();
		
		//윈도우 이벤트를 익명자식객체로 만들어 구현
		WindowAdapter wAdapter = new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		};
		
		this.addWindowListener(wAdapter);
		
//		this.addWindowListener(new WindowAdapter() {
//			@Override
//			public void windowClosing(WindowEvent e) {
//				System.exit(0);
//			}
//		});
	}

}
