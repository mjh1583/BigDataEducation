package kr.co.kihd.exception4;

public class AccountTest {
	
	public static void main(String[] args) {
		
		Account account = new Account();
		account.deposite(50000);
		System.out.println("현재 잔액 : " + account.getBalance());
		
		try {
			account.withdraw(10000);
			System.out.println("현재 잔액2 : " + account.getBalance());
			
			account.withdraw(50000);
			System.out.println("현재 잔액3 : " + account.getBalance());
			
		} catch (BalanceException e) {
			System.out.println("예외 원인 : " + e.getMessage());
		} finally {
			System.out.println("정상 종료됩니다.");
		}
	}
	
}
