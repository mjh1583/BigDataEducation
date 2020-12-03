package kr.co.kihd.chatting;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class ChattingServer implements Runnable {
	
	Socket sk;
	
	public ChattingServer() {
		try {
			ServerSocket ssk = new ServerSocket(6060);
			//클라이언트와 통신하는 소켓
			sk = ssk.accept();
			System.out.println("클라이언트와 연결이 되었습니다.");
			
			//클라이언트에게 데이터를 보내기위한 스트림
			//표준입력인 키보드와 연결함.
			InputStreamReader inr = new InputStreamReader(System.in);
			BufferedReader bur = new BufferedReader(inr);
			
			//클라이언트에게 메세지를 보내기위한 스트림
			//자동 flush처리
			PrintWriter pout = new PrintWriter(sk.getOutputStream(), true);
			
			String msg = "";
			
			Thread thread = new Thread(this);  //자기 자신을 스레드로 만듦.
			thread.start();
			
			while( (msg = bur.readLine()) != null) {
				pout.println(msg);
			}
			
			ssk.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}//생성자
	
	public static void main(String[] args) {
		
		new ChattingServer();
		
	}
	
	//받는 메세지 처리는 스레드로 함
	@Override
	public void run() {
		//클라이언트 메세지를 받아서 콘솔에 출력하는 기능
		InputStream ins;
		
		try {
			ins = sk.getInputStream();
			InputStreamReader ir = new InputStreamReader(ins);
			BufferedReader bur = new BufferedReader(ir);
			
			String clientMsg = "";
			
			while(true) {
				clientMsg = bur.readLine();
				System.out.println("Client > " + clientMsg);
			}//while
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
}
