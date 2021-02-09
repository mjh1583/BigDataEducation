package kr.gov.mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.gov.mvc.model.BoardDAO;
import kr.gov.mvc.model.BoardDTO;

public class BViewCommand implements BCommand {  //DB에 저장되어 있는 게시글을 보고자 할 때 실행하는 커맨드 객체

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("BViewCommand 클래스 들어옴");
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		int num = Integer.parseInt(request.getParameter("num"));  //보고자하는 게시글의 번호
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));  //보고자하는 게시글이 있는 페이지 수
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO = bDao.getBoardByNum(num, pageNum);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boardDTO", boardDTO);
		
		System.out.println("BViewCommand 클래스 실행 후 나감");
	}

}
