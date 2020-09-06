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
import study.spring.clip.service.LoginService;

@Controller
public class BuyMovieListController {
	
	@Autowired
	BuyMovieListService buyMovieListService;
	
	@Autowired
	BuyCoinListService buyCoinListService;
	
	@Autowired
	LoginService loginService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	 /** 내 보유 영화 세션비교 후 값 노출*/
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
		 
		 int user_no = (Integer)session.getAttribute("user_no");
		 User user = loginService.randerUser(user_no);
		 List<BuyMovieList> input = buyMovieListService.getBuyMovieList(user_no);
		 
		 
		 model.addAttribute("user_coin", user.getCoin());
		 model.addAttribute("output", input);
		 
		 // TODO 영화 정보 가져와야됨. 휴지통도 구현해야함 ++ 상태 비교해서 휴지통 마이무비에 나타내줄지 정하기
			
		 return "MY_movie"; 
	 }
	 
	 /** 내 보유 영화 세션비교 후 값 노출*/
	 @RequestMapping(value="MY_movie_remove",method=RequestMethod.GET)
	 public String enterMyMovieRemove(Model model, HttpSession session, HttpServletResponse response) { 
		 if ( session.getAttribute("id") == null ) {
				try {
					response.sendRedirect(contextPath + "/Login");
					return "Login";
				} catch (IOException e) {
					e.printStackTrace();
				}
	    	}
		 
		 int user_no = (Integer)session.getAttribute("user_no");
		 List<BuyMovieList> input = buyMovieListService.getBuyMovieList(user_no);
		 
		 
		 model.addAttribute("output", input);
		 
		 // TODO 영화 정보 가져와야됨. 휴지통도 구현해야함 ++ 상태 비교해서 휴지통 마이무비에 나타내줄지 정하기
			
		 return "MY_movie_remove"; 
	 }
	
	/** 내 영화 구매 목록 세션비교 후 값 노출 */
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
		User user_info = loginService.randerUser(user_no);
		
		List<BuyMovieList> output = buyMovieListService.getBuyMovieList(user_no);
		
		movie.addAttribute("output", output);
		movie.addAttribute("user_coin", user_info.getCoin());
		
		return "MY_movie_purchase_list";
	}
	
	// TODO 이미 보유중인 상품이면 구매 안되게 해야됨... 작스에서 얼럴창..
	// TODO 파라미터값으로 무비넘버 가져와서 정제해서 유저 구매목록에 생성해줘야함
	/** 영화 구매 세션비교 후 값 노출 */
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
    	
//		int user_no = (int)session.getAttribute("user_no");
//		
//		List<BuyMovieList> output = buyMovieListService.getBuyMovieList(user_no);
//		
//		movie.addAttribute("output", output);
		
		return "Movie_buy";
	}
	
	/** 영화 환불 검사 */
	@ResponseBody
	@RequestMapping(value = "movie_delete_ok.do", method = RequestMethod.POST)
	public int deleteBuyMovieListOk(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(value="buy_movie_list_no") int buy_movie_list_no) {
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		BuyMovieList input = new BuyMovieList();
		
		int user_no = (int)session.getAttribute("user_no");
		User user_info = loginService.randerUser(user_no);
		
		input.setCoin(user_info.getCoin());
		input.setUser_no(user_no);
		input.setBuy_movie_list_no(buy_movie_list_no);
		
		// 개발자도구로 나쁜짓하면 혼내주기
		if (buyMovieListService.checkBuyMovieList(input)) {
			return 1;
		}
		
		// 시청했는지 확인
		if (buyMovieListService.checkWatched(input)) {
			return 2;
		}
		
		// 환불 기간이 지났는지 확인
		if (buyMovieListService.checkDate(input)) {
			return 3;
		}
		
		try {
			// 데이터 삭제
			buyMovieListService.deleteBuyMovieList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	// TODO My_movie_add_ok 만들어야함..

}
