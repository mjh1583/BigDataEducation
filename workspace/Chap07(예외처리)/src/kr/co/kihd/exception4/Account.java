package kr.co.kihd.exception4;

public class Account {
	
	private long balance;
	
	public Account() {
		
	}
	
	//현재 잔액을 가져오기
	public long getBalance() {
		return this.balance;
	}
	
	//입금하기
	public void deposite(int money) {
		this.balance += money;
	}
	
	//출금하기
	public void withdraw(int money) throws BalanceException {
		if(this.balance < money)
		{
			throw new BalanceException("잔액 부족");   //예외 발생 처리
		}
		else
			this.balance -= money;
	}
	
}
