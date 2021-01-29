package kr.gov.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.gov.dto.PersonDto;

public class PersonDao {
	
	private static PersonDao instance = new PersonDao();
	
	public PersonDao() {
		
	}
	
	//PersonDao 생성해 리턴해주는 정적메서드(싱글톤패턴)
	public static PersonDao getInstance() {
		return instance;
	}
	
	//DB접속
	private Connection getConnection() throws Exception {
		
		Context context = new InitialContext();
		DataSource dataSource = (DataSource)context.lookup("java:comp/env/" + "jdbc/dbconn");
		Connection conn = dataSource.getConnection();
		System.out.println("DBCP 연동 완료");
		
		return conn;
	}
	
	//DB에 접속해서 회원리스트를 가져오는 메서드
	public ArrayList<PersonDto> personsAll() {
		
		ArrayList<PersonDto> dtos = new ArrayList<>();
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		String sql = "select * from person";
		
		try {
			connection = this.getConnection();
			pstmt = connection.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			
			System.out.println("personAll()");
			
			while(resultSet.next()) {
				PersonDto dto = new PersonDto();
				dto.setId(resultSet.getString("id"));
				dto.setPw(resultSet.getString("pw"));
				dto.setName(resultSet.getString("name"));
				dto.setEmail(resultSet.getString("email"));
				dto.setAddress(resultSet.getString("address"));
				
				//루프를 실행하면서 생성된 PersonDto 객체를 ArrayList인 dtos에 추가함.
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) {
					resultSet.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
		
	}//personsAll()
	
}
