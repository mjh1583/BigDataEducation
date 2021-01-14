package kr.gov.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.gov.dto.MemberDTO;

public class MemberDAO {

	private DataSource dataSource;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Context context;
	ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
	
	public MemberDAO() {
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/" + "jdbc/dbconn");  //다운캐스팅
			conn = dataSource.getConnection();
			
			System.out.println("DBCP에 있는 컨넥션 객체 얻어오기 성공");
			System.out.println("스레드 명 :" + Thread.currentThread().getName());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//DBCP(Database Connection Pool)에서 Connection을 반환하는 메서드
//	public Connection getConnection() {
//		try {
//			context = new InitialContext();
//			dataSource = (DataSource)context.lookup("java:comp/env/" + "jdbc/dbconn");  //다운캐스팅
//			conn = dataSource.getConnection();
//			
//			System.out.println("DBCP에 있는 컨넥션 객체 얻어오기 성공");
//			System.out.println("스레드 명 :" + Thread.currentThread().getName());
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return conn;
//	}
	
	//memberDTO 테이블에 있는 데이터 리스트를 가져오는 메서드
	public ArrayList<MemberDTO> memberList() {
		try {
			//Connection conn = this.getConnection();
			String sql = "select * from memberDTO";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString("username");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				
				MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender); 
				dtos.add(dto);
			}
			
			System.out.println("DB에 있는 데이터 가져오기 성공");
			System.out.println("스레드 명 :" + Thread.currentThread().getName());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dtos;
	}
	
	//신규 회원정보를 DB에 insert하는 메서드
	public void addMember(MemberDTO dto) {
		
		String sql = "insert into memberDTO values(?, ?, ?, ?, ?, ?, ?)";
		
		int n = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUsername());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPw());
			pstmt.setString(4, dto.getPhone1());
			pstmt.setString(5, dto.getPhone2());
			pstmt.setString(6, dto.getPhone3());
			pstmt.setString(7, dto.getGender());
			
			n = pstmt.executeUpdate();
			System.out.println("입력 갯수 : " + n);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("addMember 오케이");
	}
	
}
