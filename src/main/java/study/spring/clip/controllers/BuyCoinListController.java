package study.spring.clip.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import study.spring.clip.model.BuyCoinList;
import study.spring.clip.model.User;
import study.spring.clip.service.BuyCoinListService;

@Controller
public class BuyCoinListController {
	
	/** Service 패턴 구현체 주입 */
	// --> import study.spring.springhelper.service.DepartmentService;
	@Autowired
	BuyCoinListService buyCoinListService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "Coin_charge", method = RequestMethod.GET)
	public String goCoinCharge(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(value="check") int check) {
		
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
		String card_no = user_info.getCard();
		
		if (card_no == null) {
			model.addAttribute("card_no", "카드 정보가 없습니다.");
		} else {
			model.addAttribute("card_no", "카드 " + card_no);
		}
		
		model.addAttribute("check", check);
		
		return "Coin_charge";
	}
	
	@RequestMapping(value = "MY_coin_charge", method = RequestMethod.GET)
	public String goMyCoinCharge(Model model, HttpServletResponse response, HttpSession session) {
		
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
		
		return "MY_coin_charge";
	}
	
	@RequestMapping(value = "MY_coin_purchase_list", method = RequestMethod.GET)
	public String goMyCoinPurchaseList(HttpSession session, HttpServletResponse response, Model model) {
		
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
		
		List<BuyCoinList> output = buyCoinListService.getBuyCoinList(user_no);
		
		model.addAttribute("output", output);
		model.addAttribute("user_coin", user_coin);
		
		return "MY_coin_purchase_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "coin_delete_ok.do", method = RequestMethod.POST)
	public int deleteBuyCoinListOk(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(value="date") String date,
			@RequestParam(value="price") int price) {
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		BuyCoinList input = new BuyCoinList();
		
		int user_no = (int)session.getAttribute("user_no");
		User user_info = buyCoinListService.getUserInfo(user_no);
		int user_coin = user_info.getCoin();
		
		input.setCoin(user_coin);
		input.setPrice(price);
		input.setDate(date);
		input.setUser_no(user_no);
		
		// 개발자도구로 나쁜짓하면 혼내주기
		if (buyCoinListService.checkCoinList(input)) {
			return 0;
		}
		
		try {
			// 데이터 삭제
			buyCoinListService.deleteBuyCoinList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	
	// TODO 리턴타입 int로 바꾸고 카드정보 없을때 내정보보기 창으로 넘어가기 구현해야함 ++ 비밀번호 비교해서 넘어가기
	@ResponseBody
	@RequestMapping(value = "coin_add_ok.do", method = RequestMethod.POST)
	public void addBuyCoinListOk(Model model, HttpServletResponse response, HttpSession session, HttpServletRequest request,
			@RequestParam(value="price") int price) {
		
		// 저장할 값들을 Beans에 담는다.
		BuyCoinList input = new BuyCoinList();
		
		int user_no = (int)session.getAttribute("user_no");
		User user_info = buyCoinListService.getUserInfo(user_no);
		int user_coin = user_info.getCoin();

		input.setPrice(price);
		input.setUser_no(user_no);
		input.setCoin(user_coin);
		
		String cardCheck = user_info.getCard();
		
		if (cardCheck != null) {
			try {
				// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
				buyCoinListService.addBuyCoinList(input);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
