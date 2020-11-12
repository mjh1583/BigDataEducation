package kr.co.kihd.stringbuilder;

public class StringBuilderTest {
	
	public static void main(String[] args) {
		
		//StringBuilder, StringBuffer 클래스는 버퍼(임시저장메모리)를 이용하기 때문에,
		//새로운 인스턴스가 생성하는 것이 아니라, 하나의 인스턴스를 가지고 문자열을 조작할 수 있다.
		StringBuilder stringBuilder = new StringBuilder("JAVA");
		System.out.println(stringBuilder);
		System.out.println(stringBuilder.hashCode());
		
		stringBuilder.append(" Program");
		System.out.println(stringBuilder);
		System.out.println(stringBuilder.hashCode());
		
		stringBuilder.insert(1, "나");
		System.out.println(stringBuilder);
		System.out.println(stringBuilder.hashCode());

		stringBuilder.insert(1, 100);
		System.out.println(stringBuilder);
		System.out.println(stringBuilder.hashCode());

		stringBuilder.setCharAt(0, 'R');
		System.out.println(stringBuilder);
		System.out.println(stringBuilder.hashCode());

		stringBuilder.reverse();
		System.out.println(stringBuilder);
		System.out.println(stringBuilder.hashCode());
		
		stringBuilder.delete(0, 3);
		System.out.println(stringBuilder);
		System.out.println(stringBuilder.hashCode());

		int length = stringBuilder.length();
		System.out.println("총 문자수 : " + length);
		
	}
	
}
