package kr.co.kihd.multichatting;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;

public class ChatServer {
	
	private ServerSocket ss;
	private ArrayList<ChatHandler> list;
	
	public ChatServer() {
		try {
			ss = new ServerSocket(9900);
			System.out.println("클라이언트 연결 대기중...");
			
			list = new ArrayList<ChatHandler>();
			
			while(true) {
				Socket socket = ss.accept();
				//스레드 생성
				ChatHandler handler = new ChatHandler(socket, list);
				handler.start();    //통신이 가능하도록 스레드 시작
				
				list.add(handler);  //클라이언트 추가
			}//while
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		
		new ChatServer();
		
	}
	
}
