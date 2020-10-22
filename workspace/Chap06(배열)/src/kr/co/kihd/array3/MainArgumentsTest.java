package kr.co.kihd.array3;

public class MainArgumentsTest {
	//클래스 파일 우클릭 후 Run as => Run Configurations => Arguments => Program Arguments 여기에 문자열 입력하면 실행
	public static void main(String[] args) {
		if(args.length != 2)
		{
			System.out.println("프로그램의 사용법");
			System.out.println("아이디입력 패스워드입력");
		}

		String str1 = args[0];
		String str2 = args[1];
		
		System.out.println("아이디 : " + str1);
		System.out.println("패스워드 : " + str2);
		
		int count = Integer.parseInt(str1);   //문자열을 정수형으로 바꿔줌
		int total = count + 500;
		System.out.println("total 값 : " + total);
		
	}
	
}
