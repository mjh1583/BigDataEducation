package kr.co.kihd.inetaddress;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class InetAddressTest {
	
	public static void main(String[] args) throws UnknownHostException {
		
		InetAddress ia = null;
		InetAddress[] iaArr = null;
		
		ia = InetAddress.getByName("www.google.com");
		System.out.println("호스트 네임 : " + ia.getHostName());
		System.out.println("호스트의 IP주소 : " + ia.getHostAddress());
		System.out.println(ia.toString());
		System.out.println("---------------------------------------------------------");
		
		iaArr = InetAddress.getAllByName("www.naver.com");
		
		for(int i = 0; i < iaArr.length; i++) {
			System.out.println(iaArr[i]);
		}
		System.out.println("---------------------------------------------------------");
		
		ia = InetAddress.getLocalHost();
		System.out.println("로컬호스트 : " + ia.getHostName());
		System.out.println("로컬호스트 주소 : " + ia.getHostAddress());
		
		
	}
	
}
