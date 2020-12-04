package kr.co.kihd.multichatting;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ScrollPaneConstants;

public class ChatClient extends JFrame implements Runnable, ActionListener {
	
	private JTextField input;
	private JTextArea output;
	private JButton send;
	private Socket socket;
	private BufferedReader br;
	private PrintWriter pw;
	
	public ChatClient() {
		super("채팅 프로그램");
		input = new JTextField(15);
		output = new JTextArea();
		JScrollPane scroll = new JScrollPane(output);
		scroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);  //스크롤바가 항상 보이도록 설정
		output.setEditable(false);   //텍스트 에리어 수정 불가
		send = new JButton("보내기");
		
		JPanel p = new JPanel(new BorderLayout());
		p.add("Center", input);
		p.add("East", send);
		
		Container c = this.getContentPane();
		c.add("Center", scroll);
		c.add("South", p);
		
		this.setBounds(500, 150, 500, 500);
		this.setVisible(true);
		
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				pw.println("exit");
				pw.flush();
			}
		});
		
	}//생성자
	
	//클라이언트 객체 생성후 바로 실행되는 코드
	public void service() {
		//서버IP
		String serverIP = JOptionPane.showInputDialog(this, "서버IP를 입력하세요", "192.168.100.155");
		
		if(serverIP == null || serverIP.length() == 0) {
			System.out.println("서버IP가 입력되지 않았습니다. 서버연결을 종료합니다.");
			System.exit(0);
		}
		//닉네임
		String nickName = JOptionPane.showInputDialog(this, "닉네임을 입력하세요", "닉네임", JOptionPane.INFORMATION_MESSAGE);
		
		if(nickName == null || nickName.length() == 0) {
			nickName = "guest";
		}
		
		//소켓 생성
		try {
			socket = new Socket(serverIP, 9900);
			
			br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			pw = new PrintWriter(new OutputStreamWriter(socket.getOutputStream()));
			
			//서버에 보내기
			pw.println(nickName);
			pw.flush();
			
		} catch (UnknownHostException e) {
			System.out.println("서버를 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("서버와 연결이 안되었습니다.");
			e.printStackTrace();
		}
		
		//이벤트
		send.addActionListener(this);
		input.addActionListener(this);
		
		//스레드 생성
		Thread thread = new Thread(this);
		thread.start();
		
	}//service()
	
	public static void main(String[] args) {
		
		new ChatClient().service();
		
	}

	@Override
	public void run() { //스레드 처리
		//서버로부터 받는 쪽
		String line = null;
		
		while(true) {
			try {
				line = br.readLine();
				
				if(line == null || line.toLowerCase().equals("exit")) {
					br.close();
					pw.close();
					socket.close();
					System.exit(0);
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			//사용자로부터 입력받은 내용을 JTextArea에 붙여줌.
			output.append(line + "\n");
			int pos = output.getText().length();
			output.setCaretPosition(pos);    //맨아래로 스크롤함.
			
		}//while
		
	}

	@Override
	public void actionPerformed(ActionEvent e) { //액션 처리
		//서버로 보내기
		String line = input.getText();
		pw.println(line);
		pw.flush();
		input.setText("");   //텍스트필드 초기화
	}
	
}
