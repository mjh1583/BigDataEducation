package kr.co.kihd.component;

import java.awt.Dimension;
import java.awt.Frame;
import java.awt.Toolkit;

public class FrameTest {
	
	public static void main(String[] args) {
		
		Frame frame = new Frame("프레임 컨테이너 테스트");
		frame.setSize(300, 300);
		
		Toolkit toolKit = Toolkit.getDefaultToolkit();
		Dimension screenSize = toolKit.getScreenSize();
		System.out.println(screenSize);
		
		frame.setLocation(screenSize.width/2 - 150, screenSize.height/2 - 150);
		
		frame.setVisible(true);
		
	}
	
}
