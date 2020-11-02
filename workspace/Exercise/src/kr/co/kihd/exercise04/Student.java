package kr.co.kihd.exercise04;

//학생을 나타내는 클래스
public class Student {
	
	//객체 변수들 
	private int id;
	private String name;
	private int score1;
	private int score2;
	private int score3;
	
	//생성자(메서드)
	public Student() {
		
	}
	
	public Student(int id, String name, int score1, int score2, int score3){
		this.id = id;
		this.name = name;
		this.score1 = score1;
		this.score2 = score2;
		this.score3 = score3;
	}
	
	//메서드(setScore) : 시험번호(1~3사이), 시험점수를 받아서 해당 변수의 값을 변경함
	public void setScore(int num, int score) {
		if(num >= 1 && num <= 3) {
			if(num == 1) {
				this.score1 = score;
			}
			else if(num == 2) {
				this.score2 = score;
			}
			else
				this.score3 = score;
		}
		else
			System.out.println("시험번호를 잘못 입력하였습니다.");
	}
	
	//메서드2(getScore) : 시험번호를 매개변수로 받아 그 번호에 해당되는 시험점수 반환
	public int getScore(int num) {
		if(num >= 1 && num <= 3) {
			if(num == 1) {
				return this.score1;
			}
			else if(num == 2) {
				return this.score2;
			}
			else
				return this.score3;
		}
		else {
			System.out.println("시험번호를 잘못 입력하였습니다.");
			return -1;
		}
	}
	//메서드3(getAverage) : 세개의 시험점수의 평균을 구하여 반환
	public double getAverage()
	{
		return ((double)this.score1 + (double)this.score2 + (double)this.score3) / 3.0;
	}
	
	//학번, 이름, 시험점수, 시험평균 점수를 반환함
	@Override
	public String toString() {
		return "학번 : " + this.id + ", 이름 : " + this.name + ", 시험점수 : " + this.score1 + ", " + this.score2 + ", " + this.score3 + ", 평균 : " + this.getAverage();
	}
	
}
