package study.spring.clip.controllers;

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

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.Interest;
import study.spring.clip.model.User;
import study.spring.clip.service.InterestService;
import study.spring.clip.service.LoginService;
@Slf4j
@Controller
public class InterestController {
	
	@Autowired
	InterestService interestService;
	
	@Autowired
	LoginService loginService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value="MY_interest_movie", method = RequestMethod.GET)
	public String goInterestMovie(Model model, HttpServletResponse response,
			HttpSession session
			) {

		int x = (Integer)session.getAttribute("user_no");
		User user = loginService.randerUser(x);
		 // id_box의 유저 코인정보
		 model.addAttribute("user_coin", user.getCoin());

		List<Interest> output = interestService.getInterestList(x);
		model.addAttribute("output",output);
		
		return "MY_interest_movie";
	}
	@ResponseBody
	@RequestMapping(value="recent", method = RequestMethod.POST)
	public void goRecentMovie(Model model, HttpServletResponse response,
			HttpSession session
			) {

		int x = (Integer)session.getAttribute("user_no");

		List<Interest> output = interestService.getrecentList(x);
		model.addAttribute("output",output);
		
		
	}
	@ResponseBody
	@RequestMapping(value="highprice", method = RequestMethod.POST)
	public void goRowMovie(Model model, HttpServletResponse response,
			HttpSession session
			) {

		int x = (Integer)session.getAttribute("user_no");

		List<Interest> output = interestService.gethighpriceList(x);
		model.addAttribute("output",output);
		
		
	}
	@ResponseBody
	@RequestMapping(value="rowprice", method = RequestMethod.POST)
	public void goHighMovie(Model model, HttpServletResponse response,
			HttpSession session) {

		int x = (Integer)session.getAttribute("user_no");

		List<Interest> output2 = interestService.getrrowpriceList(x);
		model.addAttribute("output2",output2);
		
		
	}
}
