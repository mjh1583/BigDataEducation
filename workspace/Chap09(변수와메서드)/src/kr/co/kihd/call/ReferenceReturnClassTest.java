package kr.co.kihd.call;

class Data{
	int data;
}

public class ReferenceReturnClassTest {	
	
	public static void main(String[] args) {
		
		Data origin = new Data();
		origin.data = 100;
		System.out.println("origin : " + origin);
		
		Data cloned = copy(origin);
		System.out.println("cloned.data : " + cloned.data);
	}
	
	public static Data copy(Data data) {
		
		Data cloned = new Data();
		cloned.data = data.data;
		
		return cloned;    //Data 클래스의 주소를 리턴값으로 넘기고 있음.
	}
	
}
