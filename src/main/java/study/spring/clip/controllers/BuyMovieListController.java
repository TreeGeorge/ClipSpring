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
import study.spring.clip.model.Movie;
import study.spring.clip.model.User;
import study.spring.clip.model.UserCoupon;
import study.spring.clip.model.WishList;
import study.spring.clip.service.BuyCoinListService;
import study.spring.clip.service.BuyMovieListService;
import study.spring.clip.service.LoginService;
import study.spring.clip.service.MovieService;
import study.spring.clip.service.UserCouponService;
import study.spring.clip.service.WishListService;

@Controller
public class BuyMovieListController {
	
	@Autowired
	BuyMovieListService buyMovieListService;
	
	@Autowired
	BuyCoinListService buyCoinListService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	UserCouponService userCouponService;
	
	@Autowired
	MovieService movieService;
	
	@Autowired
	WishListService wishListService;
	
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
		 // 대여 기간 끝난 영화 제거
		 buyMovieListService.rentalEnd();
		 
		 int user_no = (Integer)session.getAttribute("user_no");
		 User user = loginService.randerUser(user_no);
		 List<BuyMovieList> input = buyMovieListService.getBuyMovieList(user_no);
		 
		 
		 model.addAttribute("user_coin", user.getCoin());
		 model.addAttribute("output", input);
			
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
		 // 대여 기간 끝난 영화 제거
		 buyMovieListService.rentalEnd();
		 
		 int user_no = (Integer)session.getAttribute("user_no");
		 List<BuyMovieList> input = buyMovieListService.getBuyMovieList(user_no);
		 
		 
		 model.addAttribute("output", input);
			
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
	
	/** 영화 구매 세션비교 후 값 노출 */
	@RequestMapping(value = "Movie_buy", method = RequestMethod.GET)
	public String goBuyMovie(Model model, HttpServletResponse response, HttpSession session,
			@RequestParam(value="movieNo", required = false) String[] movie_no) {
		
		if ( session.getAttribute("id") == null ) {
			try {
				response.sendRedirect(contextPath + "/Login");
				return "Login";
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
		
		// 파라미터값으로 받은 영화가 실제 존재하는 영화인지 판별 <-- 존재하지 않는다면 메인화면으로 보내버림
		Movie exist = new Movie();
		for ( int i = 0 ; i < movie_no.length ; i ++ ) {
			exist.setMovie_no(Integer.parseInt(movie_no[i]));
			if (movieService.getMovieItem(exist) == null) {
				try {
					response.sendRedirect(contextPath + "/home");
					return "index";
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			// 똑같은 영화를 담았을때 (주소창에서 조작)
			for ( int y = i ; y < movie_no.length - 1 ; y ++ ) {
				if (movie_no[i].equals(movie_no[y + 1])) {
					try {
						response.sendRedirect(contextPath + "/home");
						return "index";
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		int user_no = (int)session.getAttribute("user_no");
		
		// 유저의 현재 코인
		User user_info = loginService.randerUser(user_no);
		model.addAttribute("user_coin", user_info.getCoin());
		
		// 사용하지 않은 유저의 쿠폰
		List<UserCoupon> coupon = userCouponService.getUnusedCouponList(user_no);
		model.addAttribute("coupon", coupon);
		
		Movie movie = new Movie();
		// 담긴 제품이 한개라면
		if (movie_no.length == 1) {
			int movie_number = Integer.parseInt(movie_no[0]);
			movie.setMovie_no(movie_number);
			movie = movieService.getMovieItem(movie);
			model.addAttribute("movie_title", movie.getName());
			model.addAttribute("price", movie.getSale());
		} else {	// 담긴 제품이 여러개라면
			int price = 0;
			for ( int i = 0 ; i < movie_no.length ; i ++ ) {
				movie.setMovie_no(Integer.parseInt(movie_no[i]));
				movie = movieService.getMovieItem(movie);
				price += movie.getSale();
			}
			model.addAttribute("movie_title", movie.getName() + " 외 " + (movie_no.length - 1) + " 건");
			model.addAttribute("price", price);
		}
		
		String movie_number = "";
		for (String str: movie_no) {
			movie_number = movie_number+","+str;
		}
		
		model.addAttribute("movie_no", movie_number.substring(1));
		model.addAttribute("topInfo", "영화 결제하기");
		return "Movie_buy";
	}
	
	/** 영화 환불 검사 */
	@ResponseBody
	@RequestMapping(value = "movie_delete_ok.do", method = RequestMethod.POST)
	public int deleteBuyMovieListOk(HttpSession session,
			@RequestParam(value="buy_movie_list_no") int buy_movie_list_no) {
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		BuyMovieList input = new BuyMovieList();
		
		int user_no = (int)session.getAttribute("user_no");
		User user_info = loginService.randerUser(user_no);
		
		input.setCoin(user_info.getCoin());
		input.setUser_no(user_no);
		input.setBuy_movie_list_no(buy_movie_list_no);
		
		// 개발자도구로 나쁜짓하면 혼내주기
		if (buyMovieListService.checkBuyMovieList(input) == null) {
			return 1;
		} else if (buyMovieListService.checkWatched(input)) {	// 시청했는지 확인
			return 2;
		} else if (buyMovieListService.checkDate(input)) {		// 환불 기간이 지났는지 확인
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
	
	/** 영화 삭제나 복원 */
	@ResponseBody
	@RequestMapping(value = "movie_status_change.do", method = RequestMethod.POST)
	public int changeMovieStatus(HttpSession session,
			@RequestParam(value="buy_movie_list_no") int buy_movie_list_no) {
		// TODO 시간 남으면 jsp에서 포문돌리지말고 string 배열값으로 파라미터 받아와서 안에서 해결하기
		BuyMovieList input = new BuyMovieList();
		
		int user_no = (int)session.getAttribute("user_no");

		input.setUser_no(user_no);
		input.setBuy_movie_list_no(buy_movie_list_no);
		
		// 개발자도구로 나쁜짓하면 혼내주기
		input = buyMovieListService.checkBuyMovieList(input);
		if (input == null) {
			return 1;
		}
		
		// 영화 삭제나 복원
		buyMovieListService.changeStatus(input);

		return 0;
	}
	
	/** 영화 시청 확인 */
	@ResponseBody
	@RequestMapping(value = "movie_watch_check.do", method = RequestMethod.POST)
	public int movieWatchCheck(Model model, HttpSession session,
			@RequestParam(value="buy_movie_list_no") int buy_movie_list_no) {
		
		BuyMovieList input = new BuyMovieList();
		
		int user_no = (int)session.getAttribute("user_no");

		input.setUser_no(user_no);
		input.setBuy_movie_list_no(buy_movie_list_no);
		
		// 개발자도구로 나쁜짓하면 혼내주기
		input = buyMovieListService.checkBuyMovieList(input);
		if (input == null) {
			return 1;
		} else if (buyMovieListService.checkWatched(input)) {	// 이미 시청한 제품이라면
			return 2;
		} else if (buyMovieListService.checkDate(input)) {		// 기간이 지난 제품이라면
			return 3;
		}

		return 0;
	}
	
	/** 영화 시청 */
	@ResponseBody
	@RequestMapping(value = "movie_watch.do", method = RequestMethod.POST)
	public void movieWatch(
			@RequestParam(value="buy_movie_list_no") int buy_movie_list_no) {
		buyMovieListService.watchMovie(buy_movie_list_no);
	}
	
	/** 영화 구매시 중복영화 체크 */
	@ResponseBody
	@RequestMapping(value = "movie_add_check.do", method = RequestMethod.POST)
	public int movieBuyCheck(HttpSession session,
			@RequestParam(value="movieNo") String movieNo ) {	// movie_no, 순으로 짤라서 배열로 잘라서 사용
		
		BuyMovieList input = new BuyMovieList();

		int user_no = (int)session.getAttribute("user_no");

		input.setUser_no(user_no);
		
		String[] movie_no = movieNo.split(",");
		
		for ( int i = 0 ; i < movie_no.length ; i++ ) {
			input.setMovie_no(Integer.parseInt(movie_no[i]));
			// 이미 구매한 제품으로 존재 한다면
			if (buyMovieListService.duplicateCheck(input)) {
				return 1;
			}
		}
		
		return 0;
	}
	
	/** 영화 구매 */
	@ResponseBody
	@RequestMapping(value = "movie_add_ok.do", method = RequestMethod.POST)
	public void movieBuy(HttpSession session,
			@RequestParam(value="movieNo") String movieNo,
			@RequestParam(value="price") int price) {
		
		BuyMovieList input = new BuyMovieList();
		Movie movie = new Movie();
		WishList wish = new WishList();
		
		int user_no = (int)session.getAttribute("user_no");
		User user = loginService.randerUser(user_no);
		
		input.setCoin(user.getCoin());
		input.setUser_no(user_no);
		input.setPrice(price);
		
		buyMovieListService.editUserCoin(input);
		
		String[] movie_no = movieNo.split(",");
		
		for ( int i = 0 ; i < movie_no.length ; i++ ) {
			movie.setMovie_no(Integer.parseInt(movie_no[i]));
			movie = movieService.getMovieItem(movie);
			input.setPrice(movie.getSale());
			input.setMovie_no(movie.getMovie_no());
			buyMovieListService.addBuyMovieList(input);
			
			// 장바구니 안에 구매된 목록이 있다면 삭제
			wish.setMovie_no(movie.getMovie_no());
			wish.setUser_no(user_no);
			if (wishListService.checkWishList(wish)) {
				try {
					wishListService.deleteWishList(wish);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
	}

}
