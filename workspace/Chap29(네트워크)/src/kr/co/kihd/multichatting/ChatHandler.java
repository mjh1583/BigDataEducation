package kr.co.kihd.multichatting;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.ArrayList;

public class ChatHandler extends Thread {
	
	private Socket socket;
	private BufferedReader br;
	private PrintWriter pw;
	private ArrayList<ChatHandler> list;
	
	public ChatHandler(Socket socket, ArrayList<ChatHandler> list) throws IOException {
		this.socket = socket;
		this.list = list;
		
		br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		pw = new PrintWriter(new OutputStreamWriter(socket.getOutputStream()));
		System.out.println("클라이언트 연결");
	}//생성자
	
	@Override
	public void run() {
		try {
			String nickName = br.readLine();
			broadcast(nickName + "님이 입장하였습니다.");
			
			String line = null;
			
			while(true) {
				line = br.readLine();
				
				if(line == null || line.toLowerCase().equals("exit")) {
					break;
				}
				broadcast("[" + nickName + "]" + line);
			}//while
			
			pw.println("exit");
			pw.flush();
			
			list.remove(this);
			broadcast(nickName + "님이 퇴장하였습니다."); 
			
			br.close();
			pw.close();
			socket.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void broadcast(String msg) {  //클라이언트 모두에게 메세지 출력
		for(ChatHandler handler : list) {
			handler.pw.println(msg);
			handler.pw.flush();
		}//for
	}
	
}
