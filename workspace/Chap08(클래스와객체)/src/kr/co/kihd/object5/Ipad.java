package kr.co.kihd.object5;

public class Ipad {

	private String company;
	private String model;
	private String color;
	private int release;
	
	//getter, setter 구현
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		//예외처리코드
		if(!company.equals("애플"))
		{
			System.out.println("애플 제조사가 아닙니다.");
			return;
		}
		this.company = company;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		//예외처리코드
		if(!(model.equals("ipadPro4세대") || model.equals("ipadAir4세대") || model.equals("ipadMini5세대")))
		{
			System.out.println("애플 제조사 모델이 아닙니다.");
			return;
		}
		this.model = model;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getRelease() {
		return release;
	}
	public void setRelease(int release) {
		this.release = release;
	}
	
	@Override
	public String toString() {
		return this.getCompany() + " 회사의 " + this.getModel() + " 모델이며, 출시일은 " 
				+ this.getRelease() + "년 입니다. 색상은 " + this.getColor() + " 색 입니다.";
	}
		
}
