package study.spring.clip.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.service.impl.LoginServiceImpl;

@Slf4j
@Controller
public class LoginController{

	@Autowired
	LoginServiceImpl loginService; //로그인 서비스 객체 주입
	
	
	/*로그인 페이지 로그인 ajax처리*/
	@ResponseBody
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginProcess(HttpSession session,
			@RequestParam(value="user_id") String id,
			 @RequestParam(value="user_pw") String pw) {
		
		if(loginService.loginCheck(session, id, pw)) { return "1"; }
		return "0";
	}
	
	
	/*마이페이지 관련 페이지 접근할때 세션 정보 없으면 로그인 페이지로 보내는 처리*/
    @RequestMapping(value={"MY_movie","MY_interest_movie","MY_coupon","MY_movie_purchase_list"},
    		method=RequestMethod.GET)
    public String enterMyMovie(HttpSession session, Model model, HttpServletRequest request) {

    	//세션 정보에서 로그인 정보가 없으면 Login View로 이동
    	if( session.getAttribute("id") == null) {return "Login"; }
    	
        return request.getServletPath();
        //요청받은 서블릿 주소 리턴
    }


    @RequestMapping(value="MY_information",method=RequestMethod.GET)
    public String enterMyInfo() {

    	return "MY_information";
    }

}