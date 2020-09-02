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

import study.spring.clip.model.BuyMovieList;
import study.spring.clip.service.BuyCoinListService;
import study.spring.clip.service.BuyMovieListService;

@Controller
public class BuyMovieListController {
	
	@Autowired
	BuyMovieListService buyMovieListService;
	
	@Autowired
	BuyCoinListService buyCoinListService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "MY_movie_purchase_list", method = RequestMethod.GET)
	public String goMyMoviePurchaseList(Model movie, HttpServletResponse response, HttpSession session) {
		
		if ( session.getAttribute("id") == null ) {
			try {
				response.sendRedirect(contextPath + "/Login");
				return "Login";
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
    	
		int user_no = (int)session.getAttribute("user_no");
		int user_coin = buyCoinListService.getUserCoin(user_no);
		
		List<BuyMovieList> output = buyMovieListService.getBuyMovieList(user_no);
		
		movie.addAttribute("output", output);
		movie.addAttribute("user_coin", user_coin);
		
		return "MY_movie_purchase_list";
	}
	
	@RequestMapping(value = "Movie_buy", method = RequestMethod.GET)
	public String goBuyMovie(Model movie, HttpServletResponse response, HttpSession session) {
		
		if ( session.getAttribute("id") == null ) {
			try {
				response.sendRedirect(contextPath + "/Login");
				return "Login";
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
    	
		int user_no = (int)session.getAttribute("user_no");
		
		List<BuyMovieList> output = buyMovieListService.getBuyMovieList(user_no);
		
		movie.addAttribute("output", output);
		
		return "Movie_buy";
	}
	
	// TODO 이미 보유중인 상품이면 구매 안되게 해야됨... 작스에서 얼럴창..
	
	// TODO 기간 비교해서 삭제되게 해야됨... 일주일 지나면 삭제 못하게..
		@ResponseBody
		@RequestMapping(value = "movie_delete_ok.do", method = RequestMethod.POST)
		public void deleteBuyMovieListOk(Model model, HttpServletResponse response, HttpSession session,
				@RequestParam(value="date") String date,
				@RequestParam(value="price") int price) {
			// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
			BuyMovieList input = new BuyMovieList();
			
			int user_no = (int)session.getAttribute("user_no");
			int user_coin = buyCoinListService.getUserCoin(user_no);
			
			input.setCoin(user_coin);
			input.setPrice(price);
			input.setDate(date);
			input.setUser_no(user_no);
			
			try {
				// 데이터 삭제
				buyMovieListService.deleteBuyMovieList(input);
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

}
