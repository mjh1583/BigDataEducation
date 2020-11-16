package kr.co.kihd.multitype;

//제네릭 클래스인데 타입 파라미터가 2개이다.(설계클래스)
public class Product<T,M> {
	
	private T t;
	private M m;
	
	public Product() {

	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}

	public M getM() {
		return m;
	}

	public void setM(M m) {
		this.m = m;
	}
	
}
