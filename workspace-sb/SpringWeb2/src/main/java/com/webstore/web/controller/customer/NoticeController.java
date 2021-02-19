package com.webstore.web.controller.customer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  //뷰페이지를 설정하기 위한 컨트롤러임
@RequestMapping("/customer/notice/")
public class NoticeController {
	
	@RequestMapping("list")   //list, detail, edit, reg, del
	public String list(Model model) {  //model은 command와 비슷한 역할
		model.addAttribute("test", "Hello Gumi!!");
		//return "customer/notice/list";  //ResourceViewResolver 앞의 경로가 동일한 경우는 앞부분 생략 가능함
										//ViewResolver : controller가 리턴한 뷰 이름을 기반으로 Controller처리 결과를 생성
		return "customer.notice.list";  //TilesViewResolver
	}
	
	@RequestMapping("detail")
	public String detail() {
		
		return "customer/notice/detail";
	}
	
}
