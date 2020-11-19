package kr.co.kihd.vector;

import java.util.Iterator;
import java.util.Vector;

public class VectorTest {
	
	public static void main(String[] args) {
		
		//용량이 5인 벡터를 생성한다.
		Vector<Board> vector = new Vector<>(5);
		System.out.println("용량 : " + vector.capacity());
		System.out.println("초기 사이즈 : " + vector.size());
		System.out.println("---------------------------------------");
		
		//객체 추가
		vector.add(new Board("제목1", "내용1", "글쓴이1"));
		vector.add(new Board("제목2", "내용2", "글쓴이2"));
		vector.add(new Board("제목3", "내용3", "글쓴이3"));
		vector.add(new Board("제목4", "내용4", "글쓴이4"));
		vector.add(new Board("제목5", "내용5", "글쓴이5"));
		
		System.out.println("객체 추가 후 용량 : " + vector.capacity());
		System.out.println("객체 추가 후 사이즈 : " + vector.size());
		System.out.println("---------------------------------------");
		
		//객체 삭제
		vector.remove(2);           //배열 복사 
		vector.remove(3);			//배열 복사
		
		System.out.println("객체 삭제 후 용량 : " + vector.capacity());
		System.out.println("객체 삭제 후 사이즈 : " + vector.size());
		System.out.println("---------------------------------------");
		
		//용량만 확보
		vector.ensureCapacity(20);      //배열 복사
		System.out.println("용량 확보 후 용량 : " + vector.capacity());
		System.out.println("용량 확보 후 사이즈 : " + vector.size());
		System.out.println("---------------------------------------");
		
		//null값 포함하여 size값 변경
		vector.setSize(7);
		System.out.println("size값 변경 후 용량 : " + vector.capacity());
		System.out.println("size값 변경 후 사이즈 : " + vector.size());
		System.out.println("---------------------------------------");
		
		//size로 잡히지 않은 null값은 삭제를 해준다.
		vector.trimToSize();
		System.out.println("null값 삭제 후 용량 : " + vector.capacity());
		System.out.println("null값 삭제 후 사이즈 : " + vector.size());
		System.out.println("---------------------------------------");
		
		//null값 포함하여 size값 변경
		vector.setSize(3);
		System.out.println("size값 변경 후 용량 : " + vector.capacity());
		System.out.println("size값 변경 후 사이즈 : " + vector.size());
		System.out.println("---------------------------------------");
				
		for(Board board : vector) {
			System.out.println(board.subject + " " + board.content + " " + board.writer);
		}
		System.out.println("---------------------------------------");
		
		//반복자로 출력하기
		Iterator<Board> iterator = vector.iterator();
		while(iterator.hasNext()) {           //가져올 데이터가 있느냐?
			Board board = iterator.next();    //있으면 가져와라
			System.out.println(board.subject + " " + board.content + " " + board.writer);
		}
		
	}
	
}
