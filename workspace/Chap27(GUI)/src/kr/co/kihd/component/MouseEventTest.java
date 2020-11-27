package kr.co.kihd.component;

import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Frame;
import java.awt.Panel;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

public class MouseEventTest extends Frame implements MouseListener, WindowListener {
	
	Panel p1 =  new Panel();
	Panel p2 =  new Panel();
	Panel p3 =  new Panel();
	Panel p4 =  new Panel();
	
	CardLayout cardLayout = new CardLayout();
	
	public MouseEventTest() {
		this.setLayout(cardLayout);
		setBounds(200, 200, 300, 300);
		
		p1.setBackground(Color.CYAN);
		p2.setBackground(Color.YELLOW);
		p3.setBackground(Color.GRAY);
		p4.setBackground(Color.GREEN);
		
		add("1", p1);
		add("2", p2);
		add("3", p3);
		add("4", p4);
		
		p1.addMouseListener(this);
		p2.addMouseListener(this);
		p3.addMouseListener(this);
		p4.addMouseListener(this);
		
		addWindowListener(this);
		
	}
	
	public static void main(String[] args) {
		
		MouseEventTest mouseEventTest = new MouseEventTest();
		mouseEventTest.setVisible(true);
		
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		cardLayout.next(this);
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowOpened(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowClosing(WindowEvent e) {
		System.exit(0);
	}

	@Override
	public void windowClosed(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowIconified(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowDeiconified(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowActivated(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void windowDeactivated(WindowEvent e) {
		// TODO Auto-generated method stub
		
	}
	
}
