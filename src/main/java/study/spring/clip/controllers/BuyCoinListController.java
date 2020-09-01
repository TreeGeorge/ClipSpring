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

import study.spring.clip.model.BuyCoinList;
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
	
	@RequestMapping(value = "MY_coin_charge", method = RequestMethod.GET)
	public String goMyCoinCharge(Model model, HttpServletResponse response, HttpSession session) {
		
		if ( session.getAttribute("id") == null ) {
			try {
				response.sendRedirect(contextPath + "/Login");
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
		
		int user_no = (int)session.getAttribute("user_no");
			
		// 충전한 다음에도 값을 가져와야 하기 때문에 세션에 저장된 값을 가져오면 안됨
		int user_coin = buyCoinListService.getUserCoin(user_no);
		
		model.addAttribute("user_coin", user_coin);
		
		return "MY_coin_charge";
	}
	
	@RequestMapping(value = "MY_coin_purchase_list", method = RequestMethod.GET)
	public String goMyCoinPurchaseList(HttpSession session, HttpServletResponse response, Model model) {
		
		if ( session.getAttribute("id") == null ) {
			try {
				response.sendRedirect(contextPath + "/Login");
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
		
		int user_no = (int)session.getAttribute("user_no");
		
		List<BuyCoinList> output = buyCoinListService.getBuyCoinList(user_no);
		
		model.addAttribute("output", output);
		
		return "MY_coin_purchase_list";
	}
	
	// TODO MY_coin_purchase_list 페이지에서 날짜 $post로 값 가져와서 파라미터 넘겨주기 , 기간 비교해서 삭제되게 해야됨... 일주일 지나면 삭제 못하게..
	@RequestMapping(value = "/buyCoinList/delete_ok.do", method = RequestMethod.POST)
	public void deleteBuyCoinListOk(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(value="date") String date) {
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		BuyCoinList input = new BuyCoinList();
		
		int user_no = (int)session.getAttribute("user_no");
		
		input.setDate(date);
		input.setUser_no(user_no);
		
		try {
			// 데이터 삭제
			buyCoinListService.deleteBuyCoinList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		try {
			response.sendRedirect(contextPath + "/MY_coin_purchase_list");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// TODO Coin_charge 페이지에서 최종 결제금액 $post로 값 가져와서 파라미터 넘겨주기
	@RequestMapping(value = "/buyCoinList/add_ok.do", method = RequestMethod.POST)
	public void addBuyCoinListOk(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(value="price") int price) {
		
		// 저장할 값들을 Beans에 담는다.
		BuyCoinList input = new BuyCoinList();
		
		int user_no = (int)session.getAttribute("user_no");

		input.setPrice(price);
		input.setUser_no(user_no);
		
		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			buyCoinListService.addBuyCoinList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달 해야 한다.
		String redirectUrl = contextPath + "/MY_coin_purchase_list";
		
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
