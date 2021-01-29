package kr.gov.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.gov.dao.PersonDao;
import kr.gov.dto.PersonDto;

public class PersonListService implements Service {

	@Override
	public ArrayList<PersonDto> execute(HttpServletRequest request, HttpServletResponse response) {
		
		PersonDao dao = PersonDao.getInstance();  //Dao 객체 생성
		ArrayList<PersonDto> dtos = dao.personsAll();  //DB에 있는 person테이블에 있는 데이터를 다 ArrayList<PersonDto>에 저장해서 리턴
		
		return dtos;
	}

}
