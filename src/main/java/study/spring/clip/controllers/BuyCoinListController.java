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
import study.spring.clip.service.LoginService;

@Controller
public class BuyCoinListController {
	
	/** Service 패턴 구현체 주입 */
	// --> import study.spring.springhelper.service.DepartmentService;
	@Autowired
	BuyCoinListService buyCoinListService;
	
	@Autowired
	LoginService loginService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 코인 충전 세션값 비교후 값 노출 */
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
		User user_info = loginService.randerUser(user_no);
		String card_no = user_info.getCard();
		
		if (card_no == null) {
			model.addAttribute("card_no", "카드 정보가 없습니다.");
		} else {
			model.addAttribute("card_no", "카드 Ezen Card");
		}
		
		model.addAttribute("check", check);
		
		return "Coin_charge";
	}
	
	/** user의 카드 정보 유무 판별 */
	@ResponseBody
	@RequestMapping(value = "card_check.do", method = RequestMethod.POST)
	public int userCardCheck(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(value="card_no") String card_no) {
		
		if (card_no.equals("카드 정보가 없습니다.")) {
			return 0;
		}
		
		return 1;
	}
	
	/** MY코인 충전 세션값 비교후 값 노출 */
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
		User user_info = loginService.randerUser(user_no);
		
		model.addAttribute("user_coin", user_info.getCoin());
		
		return "MY_coin_charge";
	}
	
	/** 내 코인 충전 목록 세션값 비교후 값 노출 */
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
		User user_info = loginService.randerUser(user_no);
		
		List<BuyCoinList> output = buyCoinListService.getBuyCoinList(user_no);
		
		model.addAttribute("output", output);
		model.addAttribute("user_coin", user_info.getCoin());
		
		return "MY_coin_purchase_list";
	}
	
	/** 코인 환불검사 */
	@ResponseBody
	@RequestMapping(value = "coin_delete_ok.do", method = RequestMethod.POST)
	public int deleteBuyCoinListOk(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(value="buy_coin_list_no") int buy_coin_list_no) {
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		BuyCoinList input = new BuyCoinList();
		
		int user_no = (int)session.getAttribute("user_no");
		User user_info = loginService.randerUser(user_no);
		

		input.setBuy_coin_list_no(buy_coin_list_no);
		input.setUser_no(user_no);
		input.setCoin(user_info.getCoin());
		
		// 개발자도구로 나쁜짓하면 혼내주기
		if (buyCoinListService.checkCoinList(input)) {
			return 1;
		}
		
		// 일주일이 지난 제품인지 판별
		if (buyCoinListService.checkDate(input)) {
			return 2;
		}
		
		// 보유 코인이 모자란지 판별
		if (buyCoinListService.checkCoin(input)) {
			return 3;
		}
		
		try {
			// 데이터 삭제
			buyCoinListService.deleteBuyCoinList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	/** 카드정보 판별 후 코인 구매 */
	@ResponseBody
	@RequestMapping(value = "coin_add_ok.do", method = RequestMethod.POST)
	public void addBuyCoinListOk(Model model, HttpServletResponse response, HttpSession session, HttpServletRequest request,
			@RequestParam(value="price") int price) {
		
		// 저장할 값들을 Beans에 담는다.
		BuyCoinList input = new BuyCoinList();
		
		int user_no = (int)session.getAttribute("user_no");
		User user_info = loginService.randerUser(user_no);

		input.setPrice(price);
		input.setUser_no(user_no);
		input.setCoin(user_info.getCoin());
		
		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			buyCoinListService.addBuyCoinList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// TODO 정렬 고민...
	
}
