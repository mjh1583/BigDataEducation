package kr.co.kihd.echo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;

public class EchoServerTest {
	
	public static void main(String[] args) {
		
		int port = 7070;
		ServerSocket serverSocket = null;
		Socket socket = null;
		
		try {
			serverSocket = new ServerSocket(port);
			System.out.println("접속 대기중~~");
			socket = serverSocket.accept();
			System.out.println(socket.getLocalPort() + "포트와 클라이언트 " + socket.getInetAddress().getHostAddress() + "과 접속이 되었습니다.");
			
			//클라이언트와 통신하기 위한 스트림을 생성
			OutputStream os = socket.getOutputStream();
			PrintWriter pout = new PrintWriter(os, true);  //flush()기능 자동으로 제공
			
			pout.println("하이!!");
			
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			String clientMsg = "";
			
			while((clientMsg = br.readLine()) != null) {
				if(clientMsg.startsWith("안녕") || clientMsg.startsWith("하이")) {
					pout.println(socket.getInetAddress() + "님 반갑습니다..^^");
				}
				else if(clientMsg.startsWith("오늘은 몇일")) {
					Date today = new Date();
					pout.println(today.toString());
				}
				else {
					pout.println("======줄바꿈======");
				}
			}
			
			br.close();
			isr.close();
			is.close();
			
			pout.close();
			os.close();
			socket.close();
			serverSocket.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
