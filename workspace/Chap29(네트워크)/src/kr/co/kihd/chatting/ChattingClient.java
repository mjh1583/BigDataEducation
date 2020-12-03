package kr.co.kihd.chatting;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class ChattingClient implements Runnable {
	
	String ip = "192.168.100.155";
	int port = 6060;
	Socket sk;
	
	public ChattingClient() {
		try {
			sk = new Socket(ip, port);
			System.out.println("채팅서버와 연결되었습니다.");
			
			//서버로 보낼 메세지를 키보드로 입력받는 스트림 생성
			InputStreamReader inr = new InputStreamReader(System.in);
			BufferedReader bur = new BufferedReader(inr);
			
			//서버로 보낼 메세지를 위한 스트림
			PrintWriter pout = new PrintWriter(sk.getOutputStream(), true);
			
			String sendMsg = "";
			
			Thread thread = new Thread(this);
			thread.start();
			
			while( (sendMsg = bur.readLine()) != null) {
				pout.println(sendMsg);
			}			
	
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}//생성자
	
	public static void main(String[] args) {
		
		new ChattingClient();
		
	}

	//받는 메세지 처리는 스레드로 함
	@Override
	public void run() {	
		try {
			InputStream ins = sk.getInputStream();
			BufferedReader bur = new BufferedReader(new InputStreamReader(ins));
			
			String serverMsg = "";
			
			while(true) {
				serverMsg = bur.readLine();
				System.out.println("Server > " + serverMsg);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
