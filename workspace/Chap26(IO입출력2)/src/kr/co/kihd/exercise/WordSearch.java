package kr.co.kihd.exercise;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.Vector;

public class WordSearch {
	
	public static void main(String[] args) {
		//단어 찾기 프로그램
		
		//단어를 저장할 장소를 생성
		Vector<String> vector = new Vector<>();
		File file = new File("C:/workspace/words.txt");
		System.out.println("파일 크기 : " + file.length() / 1024 + "kb");
		
		try {
			Scanner fscan = new Scanner(file);
			
			while(fscan.hasNext()) {
				vector.add(fscan.next());
			}
			fscan.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
//		System.out.println("Vector에 저장된 단어들 출력해보기");
//		for(int i = 0; i < vector.size(); i++) {
//			System.out.println(vector.get(i));
//		}
		
		//단어 검색하기
		Scanner scan = new Scanner(System.in);
		
		while(true) {
			boolean found = false;      //flag변수
			System.out.print("찾을 단어 입력(종료는 exit) >> ");
			String search = scan.next();
			
			//검색 종료 코드
			if(search.equals("exit")) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}
			
			//app, apple, aaa
			for(int i = 0; i < vector.size(); i++) {
				String vs = vector.get(i);     //벡터 내의 문자열을 가져오는 것
				
				if(search.equals(vs)) {
					System.out.println("찾은 문자 : " + vs);
					found = true;
					break;
				}
			}
			
			if(!found) {
				System.out.println("찾는 단어가 없습니다.");
			}
		}
		
		scan.close();
	
	}
	
}
