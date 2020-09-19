package study.spring.clip.controllers;

import java.io.IOException;
import java.util.List;

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

import study.spring.clip.model.User;
import study.spring.clip.model.UserCoupon;
import study.spring.clip.service.LoginService;
import study.spring.clip.service.UserCouponService;

@Controller
public class UserCouponController {
	
	@Autowired
	UserCouponService userCouponService;
	
	@Autowired
	LoginService loginService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	 /*쿠폰 세션비교 후 값 노출*/
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
		 
		 int user_no = (Integer)session.getAttribute("user_no");
		 User user = loginService.randerUser(user_no);
		 // id_box의 유저 코인정보
		 model.addAttribute("user_coin", user.getCoin());
		 
		 List<UserCoupon> output = userCouponService.getUserCouponList(user_no);
			
		 model.addAttribute("output", output);
			
		 return "MY_coupon"; 
	 }
	 
	 /** 쿠폰 지급 검사 */
	 @ResponseBody
	 @RequestMapping(value = "coupon_add_ok.do", method = RequestMethod.POST)
	 public int addUserCouponOk(Model model, HttpServletResponse response, HttpSession session,
	 		@RequestParam(value="coupon_no") int coupon_no) {
		 
		 if ( session.getAttribute("id") == null ) {	// 로그인 상태가 아니라면
			  return 3;
		 }
		 
	 	// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
	 	UserCoupon input = new UserCoupon();
	 	
	 	int user_no = (int)session.getAttribute("user_no");
			
	 	input.setCoupon_no(coupon_no);
	 	input.setUser_no(user_no);
			
	 	// 이미 쿠폰을 보유중이라면
	 	if (userCouponService.checkCouponList(input)) {
	 		return 0;
	 	}

	 	try {
	 		// 데이터 추가
	 		userCouponService.addUserCouponList(input);
	 	} catch (Exception e) {
	 		e.printStackTrace();
	 	}
			
	 	return 1;
	 }
	 
	 /** 쿠폰 사용 체크 */
	 @ResponseBody
	 @RequestMapping(value = "use_coupon_check.do", method = RequestMethod.POST)
	 public int useCouponCheck(HttpSession session,
	 		 @RequestParam(value="user_coupon_no") int user_coupon_no,
	 		 @RequestParam(value="coupon_price") int coupon_price) {
		 
		 UserCoupon input = new UserCoupon();
		 
		 int user_no = (int)session.getAttribute("user_no");
		 input.setUser_no(user_no);
		 input.setUser_coupon_no(user_coupon_no);
		 input.setPrice(coupon_price);
		 
		 // db값과 다시한번 비교
		 if(userCouponService.checkUseCoupon(input)) {
			 return 1;
		 }
	 	 return 0;
	 }
	 
	 /** 쿠폰 사용 */
	 @ResponseBody
	 @RequestMapping(value = "use_coupon_ok.do", method = RequestMethod.POST)
	 public void useCoupon(
	 		 @RequestParam(value="user_coupon_no") int user_coupon_no) {
		 
		 UserCoupon input = new UserCoupon();

		 input.setUser_coupon_no(user_coupon_no);
		 
		 // 쿠폰을 사용상태로 바꾼다
	 	 userCouponService.useCoupon(input);
	 }
	 
}
