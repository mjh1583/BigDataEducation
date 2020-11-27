package kr.co.kihd.event;

import java.awt.Button;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Label;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

public class TextFieldEvent extends Frame implements WindowListener, ActionListener {
	
	Label lId, lPwd;
	TextField tfId, tfPwd;
	Button ok;
	
	public TextFieldEvent(String title) {
		super(title);    //조상클래스인 Frame(String title)을 호출함.
		//리스너 등록
		this.addWindowListener(this);
	}
	
	public void textFieldShow() {
		this.lId = new Label("ID : ", Label.RIGHT);
		this.lPwd = new Label("Password : ", Label.RIGHT);
		
		this.tfId = new TextField(10);
		this.tfPwd = new TextField(10);
		this.tfPwd.setEchoChar('*');     //비밀번호 안보이게 설정
		
		this.ok = new Button("OK");
		
		//리스너 등록
		this.tfId.addActionListener(this);
		this.tfPwd.addActionListener(this);
		this.ok.addActionListener(this);
		
		this.setLayout(new FlowLayout());
		this.add(lId); 
		this.add(tfId);
		this.add(lPwd);	
		this.add(tfPwd);
		this.add(ok);
		
		this.setSize(450, 80);
		this.setLocation(500, 300);
		this.setVisible(true);
		this.setResizable(false);
		
	}

	@Override
	public void windowOpened(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowClosing(WindowEvent e) {
		System.exit(0);
	}

	@Override
	public void windowClosed(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowIconified(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowDeiconified(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowActivated(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowDeactivated(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String id = tfId.getText().trim();
		String pwd = tfPwd.getText().trim();
		
		if(!id.equals("gumi")) {
			System.out.println("입력하신 ID가 유효하지 않습니다.");
			tfId.requestFocus();   //마우스커서를 아이디창으로 보냄.
			tfId.selectAll();      //입력한 글자를 전부 선택되게 함.
		}
		else if(!pwd.equals("1234")) {
			System.out.println("비밀번호가 틀렸습니다.");
			tfPwd.requestFocus();   //마우스커서를 아이디창으로 보냄.
			tfPwd.selectAll();      //입력한 글자를 전부 선택되게 함.
		}
		else {
			System.out.println(id + "님, 환영합니다.");
		}
	
	}
	
}
