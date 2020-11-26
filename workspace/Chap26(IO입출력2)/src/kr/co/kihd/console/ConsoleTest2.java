package kr.co.kihd.console;

import java.io.Console;

public class ConsoleTest2 {
	
	public static void main(String[] args) {
		
		Console console = System.console();
		
		System.out.print("id : ");
		String id = console.readLine();
		
		System.out.println("password : ");
		
		char[] password = console.readPassword();
		String pStr = new String(password);
		
		System.out.println("-------------------------------------------------------------");
		System.out.println("id : " + id);
		System.out.println("pwd : " + pStr);
		
	}
	
}
