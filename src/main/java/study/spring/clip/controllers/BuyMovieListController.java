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
import study.spring.clip.model.User;
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
		User user_info = buyCoinListService.getUserInfo(user_no);
		int user_coin = user_info.getCoin();
		
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
		public int deleteBuyMovieListOk(Model model, HttpServletResponse response, HttpSession session,
				@RequestParam(value="date") String date,
				@RequestParam(value="price") int price) {
			// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
			BuyMovieList input = new BuyMovieList();
			
			int user_no = (int)session.getAttribute("user_no");
			User user_info = buyCoinListService.getUserInfo(user_no);
			int user_coin = user_info.getCoin();
			
			input.setCoin(user_coin);
			input.setPrice(price);
			input.setDate(date);
			input.setUser_no(user_no);
			
			// 개발자도구로 나쁜짓하면 혼내주기
			if (buyMovieListService.checkBuyMovieList(input)) {
				return 0;
			}
			
			// 시청했는지 확인
			if (buyMovieListService.checkWatched(input)) {
				return 2;
			}
			
			try {
				// 데이터 삭제
				buyMovieListService.deleteBuyMovieList(input);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return 1;
		}

}
