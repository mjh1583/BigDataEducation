package kr.co.kihd.loop2;

public class TriangleTest {

	public static void main(String[] args) {
		
		int x = 0;
		
		for(int i = 0; i < 8; i++)
		{
			for(int j = 0; j < (8-x); j++)
			{
				System.out.print("*");
			}
			x++;
			System.out.println();
		}

	}

}
