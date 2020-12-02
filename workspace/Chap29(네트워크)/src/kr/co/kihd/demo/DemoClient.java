package kr.co.kihd.demo;

import java.io.DataInputStream;
import java.io.InputStream;
import java.net.Socket;

public class DemoClient {
	
	public static void main(String[] args) throws Exception{
		
		//연결시에 소켓이 생성된다. 연결이 안될경우에는 예외발생
		Socket socket = new Socket("192.168.100.155", 5050);   //127.0.0.1
		System.out.println("서버와 접속이 되었습니다......");
		
		InputStream is = socket.getInputStream();
		DataInputStream dis = new DataInputStream(is);
		
		String str = dis.readUTF();
		int number = dis.readInt();
		System.out.println("서버에서 전송된 문자 : " + str);
		System.out.println("서버에서 전송된 값 : " + number);
		
		dis.close();
		is.close();
		socket.close();
		
	}
	
}
