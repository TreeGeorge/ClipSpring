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
	
	
	
	
	
	@ResponseBody
    @RequestMapping(value="sessionCheck.do", method=RequestMethod.GET)
    public boolean tryMyMovie(HttpSession session) {
    	if(session.getAttribute("id")!=null) { return true; }
    	return false;    	
    }
    @RequestMapping(value="MY_movie",method=RequestMethod.GET)
    public String enterMyMovie() { return "MY_movie"; }
    @RequestMapping(value="Login",method=RequestMethod.GET)
    public String enterLogin() { return "Login"; }


    @RequestMapping(value="MY_information",method=RequestMethod.GET)
    public String enterMyInfo() {

    	return "MY_information";
    }

}