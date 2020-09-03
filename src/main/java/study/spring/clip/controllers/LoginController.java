package study.spring.clip.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.User;
import study.spring.clip.service.BuyCoinListService;
import study.spring.clip.service.impl.LoginServiceImpl;

@Slf4j
@Controller
public class LoginController{

	@Autowired
	LoginServiceImpl loginService; //로그인 서비스 객체 주입
	
	@Autowired
	BuyCoinListService buyCoinListService;
	
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
	
	/*로그아웃처리 (세션 초기화)*/
	 @RequestMapping(value="logout.do",method=RequestMethod.GET)
	 public void logoutProcess(HttpSession session, HttpServletResponse response) { 
		session.invalidate();
		 try {
			response.sendRedirect(contextPath + "/home");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	
	 @RequestMapping(value="MY_movie",method=RequestMethod.GET)
	 public String enterMyMovie(Model model, HttpSession session, HttpServletResponse response) { 
		 if ( session.getAttribute("id") == null ) {
				try {
					response.sendRedirect(contextPath + "/Login");
					return "Login";
				} catch (IOException e) {
					e.printStackTrace();
				}
	    	}
		 
		int user_no = (int)session.getAttribute("user_no");
		 
		User user_info = buyCoinListService.getUserInfo(user_no);
		int user_coin = user_info.getCoin();
			
		model.addAttribute("user_coin", user_coin);
			
		 return "MY_movie"; 
	 }
	 
	 @RequestMapping(value="MY_interest_movie",method=RequestMethod.GET)
	 public String enterMyInterest(Model model, HttpSession session, HttpServletResponse response) { 
		 if ( session.getAttribute("id") == null ) {
				try {
					response.sendRedirect(contextPath + "/Login");
					return "Login";
				} catch (IOException e) {
					e.printStackTrace();
				}
	    	}
		 
		 int user_no = (int)session.getAttribute("user_no");
		 
		 User user_info = buyCoinListService.getUserInfo(user_no);
			int user_coin = user_info.getCoin();
				
			model.addAttribute("user_coin", user_coin);
			
		 return "MY_interest_movie"; 
	 }
	 
	 @RequestMapping(value="MY_coupon",method=RequestMethod.GET)
	 public String enterMyCoupon(Model model, HttpSession session, HttpServletResponse response) { 
		 if ( session.getAttribute("id") == null ) {
				try {
					response.sendRedirect(contextPath + "/Login");
					return "Login";
				} catch (IOException e) {
					e.printStackTrace();
				}
	    	}
		 
		 int user_no = (int)session.getAttribute("user_no");
		 
		 	User user_info = buyCoinListService.getUserInfo(user_no);
			// 충전한 다음에도 값을 가져와야 하기 때문에 세션에 저장된 값을 가져오면 안됨
			int user_coin = user_info.getCoin();
				
			model.addAttribute("user_coin", user_coin);
			
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
	 
	 @RequestMapping(value="Sign_up_agree",method=RequestMethod.GET)
	 public String enterSignUp() { 
		 return "Sign_up_agree"; 
	 }
	 
	 /*약관동의 후 다음페이지 넘어가기 전 이메일 수신 동의 여부 판별*/
	  @ResponseBody
	  @RequestMapping(value="agree.do",method=RequestMethod.POST)
	  public void agree(HttpSession session, HttpServletResponse response,
			  @RequestParam(value="should") String should) { 
		  session.setAttribute("should", should);
	  }
	  
	  /*아이디 중복검사*/
	  @ResponseBody
	  @RequestMapping(value="idOverlapCheck.do",method=RequestMethod.POST)
	  public String idOverlapCheck(HttpServletResponse response,
			  @RequestParam(value="id") String id) { 
		  if(loginService.idOverlapCheck(id)) {return "1";}
		  return "0";
	  }
	  
	  /*이메일 중복검사*/
	  @ResponseBody
	  @RequestMapping(value="emailOverlapCheck.do",method=RequestMethod.POST)
	  public String emailOverlapCheck(HttpServletResponse response,
			  @RequestParam(value="email") String email) { 
		  log.debug("1112"+email);
		  if(loginService.emailOverlapCheck(email)) {return "1";}
		  return "0";
	  }
	  
	  /*세션과 비교하여 비밀번호 검사*/
	  @ResponseBody
	  @RequestMapping(value="pwCheck.do",method=RequestMethod.POST)
	  public String pwCheck(HttpServletResponse response, HttpSession session,
			  @RequestParam(value="pw") String pw) { 
		  String id = (String)session.getAttribute("id");
		  if(loginService.pwCheck(id, pw)) {return "1";}
		  return "0";
	  }
	  
	  /*회원가입*/
	  @ResponseBody
	  @RequestMapping(value="signUp.do",method=RequestMethod.POST)
	  public void signUp(HttpServletResponse response, HttpSession session,
			  @RequestParam(value="id") String id,
			  @RequestParam(value="name") String name,
			  @RequestParam(value="email") String email,
			  @RequestParam(value="pw") String pw,
			  @RequestParam(value="edit") String edit,
			  @RequestParam(value="birth") String birth,
			  @RequestParam(value="gender") String gender) { 
		 String agree = (String)session.getAttribute("should");
		 loginService.signUp(agree, id, name, email, pw, edit, birth, gender);
	  }
	  
	  /*회원정보기입 페이지 이메일 수신 동의 여부 받기*/
		 @RequestMapping(value="Sign_up_information",method=RequestMethod.GET)
		 public String enterSignUpInfo() {
			 
			 return "Sign_up_information"; 
		 }


}