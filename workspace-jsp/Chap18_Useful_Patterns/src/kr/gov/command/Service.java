package kr.gov.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.gov.dto.PersonDto;

public interface Service {
	//공통적으로 Service 인터페이스를 기능별로 구현할 클래스들을 만들어주면 됨.
	public ArrayList<PersonDto> execute(HttpServletRequest request, HttpServletResponse response);
	
}
