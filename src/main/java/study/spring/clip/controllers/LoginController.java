package study.spring.clip.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
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
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/*로그인 페이지 로그인 ajax처리*/
	@ResponseBody
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginProcess(HttpSession session,
			@RequestParam(value="user_id") String id,
			@RequestParam(value="user_pw") String pw) {
		
		if(loginService.loginCheck(session, id, pw)) { return "1"; }
		return "0";
	}
	
	
	 @RequestMapping(value="MY_movie",method=RequestMethod.GET)
	 public String enterMyMovie(HttpSession session, HttpServletResponse response) { 
		 if ( session.getAttribute("id") == null ) {
				try {
					response.sendRedirect(contextPath + "/Login");
					return "Login";
				} catch (IOException e) {
					e.printStackTrace();
				}
	    	}
		 return "MY_movie"; 
	 }
	 
	 @RequestMapping(value="MY_interest_movie",method=RequestMethod.GET)
	 public String enterMyInterest(HttpSession session, HttpServletResponse response) { 
		 if ( session.getAttribute("id") == null ) {
				try {
					response.sendRedirect(contextPath + "/Login");
					return "Login";
				} catch (IOException e) {
					e.printStackTrace();
				}
	    	}
		 return "MY_interest_movie"; 
	 }
	 
	 @RequestMapping(value="MY_coupon",method=RequestMethod.GET)
	 public String enterMyCoupon(HttpSession session, HttpServletResponse response) { 
		 if ( session.getAttribute("id") == null ) {
				try {
					response.sendRedirect(contextPath + "/Login");
					return "Login";
				} catch (IOException e) {
					e.printStackTrace();
				}
	    	}
		 return "MY_coupon"; 
	 }
	 
	 @RequestMapping(value="Login",method=RequestMethod.GET)
	 public String enterLogin() { 
		 return "Login"; 
	 }
	 
	 @RequestMapping(value="MY_information",method=RequestMethod.GET)
	 public String enterMyInformation(HttpSession session, HttpServletResponse response) { 
		 if ( session.getAttribute("id") == null ) {
				try {
					response.sendRedirect(contextPath + "/Login");
					return "Login";
				} catch (IOException e) {
					e.printStackTrace();
				}
	    	}
		 return "MY_information"; 
	 }

}