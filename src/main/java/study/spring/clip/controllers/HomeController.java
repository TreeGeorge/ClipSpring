package study.spring.clip.controllers;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.CategoryType;
import study.spring.clip.model.FreeMovie;
import study.spring.clip.model.HomeMovieSlider;
import study.spring.clip.model.Top100;
import study.spring.clip.model.UserCoupon;
import study.spring.clip.service.CategoryTypeService;
import study.spring.clip.service.FreeMovieService;
import study.spring.clip.service.HomeMovieSliderService;
import study.spring.clip.service.Top100Service;
import study.spring.clip.service.UserCouponService;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	UserCouponService userCouponService;
	
	@Autowired
	HomeMovieSliderService homeMovieSliderService;
	
	@Autowired
	CategoryTypeService categoryTypeService;
	
	@Autowired
	Top100Service top100Service;
	
	@Autowired
	FreeMovieService freeMovieService;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = {"/", "home"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Locale locale, Model movie, HttpServletRequest requeset, HttpServletResponse response) {
		log.debug("Locale : " + locale.getLanguage());			// 언어 코드 (ko)
		log.debug("Locale : " + locale.getCountry());			// 국가 코드 (KO)
		log.debug("Locale : " + locale.getDisplayLanguage());	// 언어 이름 (한국어)
		log.debug("Locale : " + locale.getDisplayCountry());	// 국가 이름 (대한민국)
		
		String[] color = {"#FF7688","#FE506B","#FF3253","#B9062D","#8C0120","#FF7688","#FE506B","#FF3253","#B9062D","#8C0120"};	// 추천  슬라이더 색깔
		List<HomeMovieSlider> RecommandMovieSlider = homeMovieSliderService.getJangreMovieSliderList("추천 영화"); // 추천영화조회(그 외 장르도 가능)
		List<HomeMovieSlider> actionMovieSlider = homeMovieSliderService.getJangreMovieSliderList("액션"); // 액션장르영화조회(그 외 장르도 가능)
		List<HomeMovieSlider> marvelyMovieSlider = homeMovieSliderService.getMarvelySlider(); // 마동석 영화조회(그 외 장르도 가능)
		List<HomeMovieSlider> harryPotterMovieSlider = homeMovieSliderService.getHarryPotterSlider(); // 마블영화조회(그 외 장르도 가능)
		List<HomeMovieSlider> saleMovieSlider = homeMovieSliderService.getJangreMovieSliderList("할인 영화관"); // 할인영화조회
		List<HomeMovieSlider> animationSlider = homeMovieSliderService.getJangreMovieSliderList("애니메이션"); // 애니메이션영화조회(그 외 장르도 가능)
		List<CategoryType> HomeCategoryType = categoryTypeService.getHomeCategoryType("G"); // 홈화면 카테고리 조회
		List<CategoryType> HomeCategoryTypePlus = categoryTypeService.getHomeCategoryTypePlus("G"); // 홈화면 카테고리  더보기 조회
		
		movie.addAttribute("color", color);
		movie.addAttribute("RecommandMovieSlider", RecommandMovieSlider);
		movie.addAttribute("actionMovieSlider", actionMovieSlider);
		movie.addAttribute("saleMovieSlider", saleMovieSlider);
		movie.addAttribute("marvelyMovieSlider", marvelyMovieSlider);
		movie.addAttribute("harryPotterMovieSlider", harryPotterMovieSlider);
		movie.addAttribute("animationSlider", animationSlider);
		movie.addAttribute("HomeCategoryType", HomeCategoryType);
		movie.addAttribute("HomeCategoryTypePlus", HomeCategoryTypePlus);
		
		// top100 슬라이더
		List<Top100> dayList = top100Service.dailyRanking();
		List<Integer> dailyRank = top100Service.dailyRankChange();
		movie.addAttribute("dayList", dayList);
		movie.addAttribute("dailyRank", dailyRank);
		
		// 무료 영화
		List<FreeMovie> freeMovie = freeMovieService.getFreeMovieList(); // 조회 처리가 저장될 객체
		movie.addAttribute("freeMovie", freeMovie);
		
		// 관리자 페이지가 없기때문에 파라미터값은 db에서 쿠폰 추가하고 개발자가 넣어줘야함...
		UserCoupon input = userCouponService.getCouponInfo(3);
		
		movie.addAttribute("coupon_no", input.getCoupon_no());
		movie.addAttribute("coupon_name", input.getName());
		movie.addAttribute("coupon_price", input.getPrice());
		movie.addAttribute("coupon_date", input.getPeriod());
		
		return "index";
	}
}
