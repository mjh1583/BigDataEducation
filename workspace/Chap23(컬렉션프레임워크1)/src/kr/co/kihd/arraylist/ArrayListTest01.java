package kr.co.kihd.arraylist;

import java.util.ArrayList;

public class ArrayListTest01 {
	
	public static void main(String[] args) {
		
		//ArrayList는 제네릭 타입이다.
		//기본적으로 10개의 공간을 생성함.
		ArrayList list = new ArrayList();
		//저장된 객체가 하나도 없기 때문에 0을 리턴함.
		System.out.println("총 크기 : " + list.size());
		
		list.add("111");   //boolean add(Object o) -> 순차적 추가
		list.add("222");
		list.add("333");
		list.add("444");
		System.out.println("총 크기 : " + list.size());
		
		list.add(333);     //list.add(new Integer(333));
		System.out.println("총 크기 : " + list.size());
		System.out.println("ArrayList에 있는 값 : " + list.toString());
		
		//0번째 인덱스에 "333" 추가하기
		list.add(0, "333");
		System.out.println("ArrayList에 있는 값 : " + list.toString());
		
		//앞에서부터 검색하여 "333"을 삭제한다.(가까운 것 한개만 선택)
		//객체 삭제하기
		list.remove("333");
		System.out.println("ArrayList에 있는 값 : " + list.toString());
		
		System.out.println(list.remove("333"));
		System.out.println("ArrayList에 있는 값 : " + list.toString());
		
		//저장된 객체의 인덱스를 찾아오기(없으면 -1 리턴한다)
		System.out.println("index = " + list.indexOf("333"));
		System.out.println("index = " + list.indexOf(333));
		
		//객체 전부 삭제하기
//		list.clear();
//		System.out.println("ArrayList에 있는 값 : " + list.toString());
		
		//인덱스 0을 삭제할때, i가 0이니까 당연히 0인덱스에 있는 객체는 삭제되지만,
		//이후 i값이 증가되면서 제대로 삭제가 되지 않는것임.
		//삭제시킬려면 항상 뒤에서부터 삭제 해주어야함.
//		for(int i = 0; i < list.size(); i++) {
//			list.remove(i);
//		}
//		System.out.println("ArrayList에 있는 값 : " + list.toString());
		
		//아래와 같이 삭제를 하면 IndexOutOfBoundsException이 발생한다.
		//이유는 size()값이 4인데, 인덱스는 3까지 있으니까 그렇다.
		for(int i = list.size()-1; i >= 0; i--) {
			list.remove(i);
		}
		System.out.println("ArrayList에 있는 값 : " + list.toString());
		
		
		
	}
	
}
