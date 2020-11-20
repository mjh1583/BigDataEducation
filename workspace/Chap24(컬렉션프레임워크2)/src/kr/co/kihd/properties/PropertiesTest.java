package kr.co.kihd.properties;

import java.io.FileReader;
import java.net.URLDecoder;
import java.util.Properties;

public class PropertiesTest {
	
	public static void main(String[] args) throws Exception {
		
		//Properties객체는 키와 값을 String으로 제한한 Map컬렉션임.
		Properties properties = new Properties();
		
		//PropertiesTest와 동일한 곳에 지금 프러퍼티 파일이 존재하므로
		//아래와 같은 패스를 얻어오는 것이다.
		String path = PropertiesTest.class.getResource("database.properties").getPath();
		System.out.println(path);
		
		path = URLDecoder.decode(path, "utf-8");  //한글이 3바이트
//		path = URLDecoder.decode(path, "euc-kr");  //한글이 2바이트
		System.out.println(path);
		
		//database.properties파일을 읽어들인다.
		properties.load(new FileReader(path));
		
		System.out.println("========================================================================================");
		//키를 주고 값을 읽어옴
		String driver = properties.getProperty("driver");
		System.out.println("driver : " + driver);
		String url = properties.getProperty("url");
		System.out.println("url : " + url);
		String username = properties.getProperty("username");
		System.out.println("username : " + username);
		String password = properties.getProperty("password");
		System.out.println("password : " + password);
			
	}
	
}
