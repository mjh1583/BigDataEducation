package kr.co.kihd.demo;

import java.io.DataOutputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class DemoServer {
	
	public static void main(String[] args) throws Exception {
		
		int port = 5050;
		int number = Integer.parseInt(args[0]); //DemoServer 우클릭 => Run as / Run Configurations => Arguments에 값 넣기
		String str = new String(args[1]);
		
		//서버 소켓 생성
		ServerSocket serverSocket = new ServerSocket(port);
		System.out.println("접속 대기중~");
		
		while(true) {
			Socket socket = serverSocket.accept();
			System.out.println("사용자 접속했습니다.");
			System.out.println("클라이언트 IP : " + socket.getInetAddress().getHostAddress());
			
			//스트림 생성
			OutputStream os = socket.getOutputStream();
			DataOutputStream dos = new DataOutputStream(os);
			
			dos.writeUTF(str);
			dos.writeInt(number);
			dos.flush();
			
			dos.close();
			os.close();
			socket.close();
			
		} //while
		
	}
	
}
