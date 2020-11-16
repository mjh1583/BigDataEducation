package kr.co.kihd.nongeneric;

public class PersonTest {
	
	public static void main(String[] args) {
		
		Person person = new Person();
		person.setObject("최지만");     //업캐스팅(String -> Object)
		String str = (String)person.getObject();  //다운캐스팅(Object -> String)
		System.out.println(str);
		
	}
	
}
