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
	private static BoardDAO instance;
	
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
			System.out.println("getBoardList()예외 " + e.getMessage());
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
			System.out.println("getListCount()예외 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getListCount()의 close() 호출 예외 : " + e2.getMessage());
				e2.printStackTrace();
			}
		}
		
		return count;
	}
	
	//member 테이블에서 인증된 id의 사용자명을 가져오기
	public String getLoginName(String id) {
		String name = null;
		String sql = "select * from member where id = ?";
		
		try {
			conn = DBConnection.getConnnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("name");
			}
			
		} catch (Exception e) {
			System.out.println("getLoginName() 예외발생 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getLoginName()의 close() 호출 예외 : " + e2.getMessage());
				e2.printStackTrace();
			}
		}
		
		return name;
	}
	
	//board 테이블에 새로운 글 저장하는 메서드
	public void insertBoard(BoardDTO boardDTO) {
		/*
		    num 		int 		not null 	auto_increment,  -- 게시글 순번
			id 			varchar(10) not null,					 -- 회원 아이디
			name		varchar(20) not null,					 -- 회원 이름
			subject		varchar(100) not null,					 -- 게시글 제목
			content		text		not null,					 -- 게시글 내용
			registDay 	varchar(30),							 -- 게시글 등록 일자
			hit			int,									 -- 게시글 조회수
			ip			varchar(20),							 -- 게시글 등록 시 IP
		 */
		
		try {
			String sql = "insert into board values(?, ?, ?, ?, ?, ?, ?, ?)";
			
			conn = DBConnection.getConnnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardDTO.getNum());
			pstmt.setString(2, boardDTO.getId());
			pstmt.setString(3, boardDTO.getName());
			pstmt.setString(4, boardDTO.getSubject());
			pstmt.setString(5, boardDTO.getContent());
			pstmt.setString(6, boardDTO.getRegistDay());
			pstmt.setInt(7, boardDTO.getHit());
			pstmt.setString(8, boardDTO.getIp());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertBoard() 예외발생 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("insertBoard()의 close() 호출 예외 : " + e2.getMessage());
				e2.printStackTrace();
			}
		}
	}
	
	//선택된 게시글의 상세 내용을 가져오는 메서드
	public BoardDTO getBoardByNum(int boardNum, int pageNum) {
		BoardDTO boardDTO = null;
		String sql = "select * from board where num = ?";
		
		try {
			conn = DBConnection.getConnnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setNum(rs.getInt("num"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setName(rs.getString("name"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setRegistDay(rs.getString("registDay"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setIp(rs.getString("ip"));
			}
			System.out.println("getBoardByNum() 수행완료");
			
		} catch (Exception e) {
			System.out.println("getBoardByNum() 예외발생 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("getBoardByNum()의 close() 호출 예외 : " + e2.getMessage());
				e2.printStackTrace();
			}
		}
		
		updateHit(boardNum);  //조회 수 증가시키는 메서드
		
		return boardDTO;
	}

	//조회 수 증가시키는 메서드
	public void updateHit(int boardNum) {
		
		String sql = "select hit from board where num = ?";
		int hit = 0;
		
		try {
			conn = DBConnection.getConnnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				hit = rs.getInt("hit") + 1;
			}
			
			sql = "update board set hit = ? where num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hit);
			pstmt.setInt(2, boardNum);
			pstmt.executeUpdate();
			
			System.out.println("updateHit() 수행완료");
			
		} catch (Exception e) {
			System.out.println("updateHit() 예외발생 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("updateHit()의 close() 호출 예외 : " + e2.getMessage());
				e2.printStackTrace();
			}
		}
	}
	
	//게시글 수정한 내용 업데이트
	public void updateBoard(BoardDTO boardDto) {
		
		String sql = "update board set subject = ?, content = ?, registDay = ?, ip = ? where num = ?";
		
		try {
			conn = DBConnection.getConnnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, boardDto.getSubject());
			pstmt.setString(2, boardDto.getContent());
			pstmt.setString(3, boardDto.getRegistDay());
			pstmt.setString(4, boardDto.getIp());
			pstmt.setInt(5, boardDto.getNum());
			
			pstmt.executeUpdate();
			
			System.out.println("updateBoard() 수행완료");
			
		} catch (Exception e) {
			System.out.println("updateBoard() 예외발생 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println("updateBoard()의 close() 호출 예외 : " + e2.getMessage());
				e2.printStackTrace();
			}
		}
		
	}
	
}
