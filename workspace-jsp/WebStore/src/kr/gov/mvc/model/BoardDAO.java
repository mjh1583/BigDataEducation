package kr.gov.mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.gov.mvc.database.DBConnection;

public class BoardDAO {
	
	private Connection conn = null;  //DB 접속시 필요한 멤버 객체
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private ArrayList<BoardDTO> dtos = null;
	private static BoardDAO instance = new BoardDAO();
	
	public BoardDAO() {
		
	}
	
	public static BoardDAO getInstance() {		//싱글톤 패턴으로 BoardDAO 객체 하나만 만들어서 리턴
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	//board 테이블에 레코드 가져오는 메서드
	//page : 게시물 페이지 숫자, limit : 페이지당 게시물수, items : 제목, 본문, 글쓴이, text : 검색단어
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		
		int totalRecord = getListCount(items, text);  //board 테이블의 전체 레코드 개수
		int start = (page - 1) * limit;  //선택 page 이전까지의 레코드 개수
		int index = start + 1;  //선택 page 시작 레코드(게시물)
		
		String sql = "";
		dtos = new ArrayList<BoardDTO>();
		
		if(items == null && text == null) {  //파라미터로 넘어오는 검색기능이 두군데 모두 아무 값이 없는 경우
			sql = "select * from board order by num desc";
		}
		else {
			sql = "select * from board where " + items + " like '%" + text + "%' order by num desc";  //파라미터로 넘어오는 값으로 검색
		}
		
		try {
			conn = DBConnection.getConnnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {  //가령 6페이지를 보고있다가 1페이지를 클릭하게되면 => 마이너스값이 됨
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegistDay(rs.getString("registDay"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				
				dtos.add(board);
				
				if(index < (start + limit) && index <= totalRecord) {
					index++;
				}
				else {
					break;
				}
				
			}
			
		} catch (SQLException e) {
			System.out.println("getBoardList()에러 " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getBoardList()의 close() 호출 예외" + e2.getMessage());
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	//board 테이블의 레코드 개수를 가져오는 메서드
	public int getListCount(String items, String text) {
		
		int count = 0;
		String sql = "";
		
		//파라미터로 넘어오는 검색기능이 두군데 모두 아무 값이 없는 경우
		if(items == null && text == null) {
			sql = "select count(*) from board";
		}
		else {
			sql = "select count(*) from board where " + items + " like '%" + text + "%'";  //파라미터로 넘어오는 값으로 검색
		}
		
		try {
			conn = DBConnection.getConnnection();
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("getListCount()에러 " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getListCount()의 close() 호출 예외" + e2.getMessage());
				e2.printStackTrace();
			}
		}
		
		return count;
	}
}
