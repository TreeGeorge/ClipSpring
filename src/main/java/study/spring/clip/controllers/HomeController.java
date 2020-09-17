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
import study.spring.clip.model.HomeMovieSlider;
import study.spring.clip.model.UserCoupon;
import study.spring.clip.service.CategoryTypeService;
import study.spring.clip.service.HomeMovieSliderService;
import study.spring.clip.service.UserCouponService;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	UserCouponService userCouponService;

	// private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	HomeMovieSliderService homeMovieSliderService;
	
	@Autowired
	CategoryTypeService categoryTypeService;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/", "home"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Locale locale, Model movie, HttpServletRequest requeset, HttpServletResponse response) {
		// logger.info("Welcome home! The client locale is {}.", locale);
		log.debug("Locale : " + locale.getLanguage());			// 언어 코드 (ko)
		log.debug("Locale : " + locale.getCountry());			// 국가 코드 (KO)
		log.debug("Locale : " + locale.getDisplayLanguage());	// 언어 이름 (한국어)
		log.debug("Locale : " + locale.getDisplayCountry());	// 국가 이름 (대한민국)
		
		String[] color = {"#FF7688","#FE506B","#FF3253","#B9062D","#8C0120","#FF7688","#FE506B","#FF3253","#B9062D","#8C0120"};	// 추천  슬라이더 색깔
		List<HomeMovieSlider> RecommandMovieSlider = homeMovieSliderService.getJangreMovieSliderList("추천 영화"); // 추천영화조회(그 외 장르도 가능)
		List<HomeMovieSlider> homeMovieSlider = homeMovieSliderService.getJangreMovieSliderList("액션"); // 액션장르영화조회(그 외 장르도 가능)
		List<HomeMovieSlider> homeMovieSlider2 = homeMovieSliderService.getJangreMovieSliderList("소니픽쳐스"); // 마블영화조회(그 외 장르도 가능)
		List<HomeMovieSlider> saleMovieSlider = homeMovieSliderService.getSaleMovieSliderList("할인 영화관"); // 할인영화조회
		List<HomeMovieSlider> homeMovieSlider3 = homeMovieSliderService.getJangreMovieSliderList("코미디"); // 코미디영화조회(그 외 장르도 가능)
		List<CategoryType> HomeCategoryType = categoryTypeService.getHomeCategoryType("G"); // 홈화면 카테고리 조회
		List<CategoryType> HomeCategoryTypePlus = categoryTypeService.getHomeCategoryTypePlus("G"); // 홈화면 카테고리  더보기 조회
		
		movie.addAttribute("color", color);
		movie.addAttribute("RecommandMovieSlider", RecommandMovieSlider);
		movie.addAttribute("homeMovieSlider", homeMovieSlider);
		movie.addAttribute("saleMovieSlider", saleMovieSlider);
		movie.addAttribute("homeMovieSlider2", homeMovieSlider2);
		movie.addAttribute("homeMovieSlider3", homeMovieSlider3);
		movie.addAttribute("HomeCategoryType", HomeCategoryType);
		movie.addAttribute("HomeCategoryTypePlus", HomeCategoryTypePlus);
		
	
		int[] top100MovieNo = {21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40};
		String[] top100MovieTitle = {"top100영화1","top100영화2","top100영화3","top100영화4","top100영화5","top100영화6","top100영화7","top100영화8","top100영화9","top100영화10","top100영화11","top100영화12","top100영화13","top100영화14","top100영화15","top100영화16","top100영화17","top100영화18","top100영화19","top100영화20"};
		String[] top100MovieThumbnail = {"top100영화 썸네일 주소1","top100영화 썸네일 주소2","top100영화 썸네일 주소3","top100영화 썸네일 주소4","top100영화 썸네일 주소5","top100영화 썸네일 주소6","top100영화 썸네일 주소7","top100영화 썸네일 주소8","top100영화 썸네일 주소9","top100영화 썸네일 주소10","top100영화 썸네일 주소11","top100영화 썸네일 주소12","top100영화 썸네일 주소13","top100영화 썸네일 주소14","top100영화 썸네일 주소15","top100영화 썸네일 주소16","top100영화 썸네일 주소17","top100영화 썸네일 주소18","top100영화 썸네일 주소19","top100영화 썸네일 주소20"};
		int[] top100MoviePrice = {2000,3000,5000,4000,7000,2000,3000,5000,4000,7000,2000,3000,5000,4000,7000,2000,3000,5000,4000,7000};
		int[] top100MovieSale = {50,20,0,0,10,50,20,0,0,10,50,20,0,0,10,50,20,0,0,10};
		// TODO 등수비교 로직 고민
	
//		int[] marvelMovieNo = {51,52,53,54,55,56,57,58,59,60};
//		String[] marvelMovieTitle = {"마블영화1","마블영화2","마블영화3","마블영화4","마블영화5","마블영화6","마블영화7","마블영화8","마블영화9","마블영화10"};
//		String[] marvelMovieThumbnail = {"마블 영화 썸네일 주소1","마블 영화 썸네일 주소2","마블 영화 썸네일 주소3","마블 영화 썸네일 주소4","마블 영화 썸네일 주소5","마블 영화 썸네일 주소6","마블 영화 썸네일 주소7","마블 영화 썸네일 주소8","마블 영화 썸네일 주소9","마블 영화 썸네일 주소10"};
//		String[] marvelMovieType = {"구매","대여","대여","구매","대여","구매","대여","구매","구매","대여"};
//		int[] marvelMoviePrice = {2000,3000,5000,2000,2000,2000,3000,5000,4000,7000};
//		int[] marvelMovieSale = {50,20,0,10,0,15,20,33,55,0};
		
		int[] freeMovieNo = {101,102,103};
		String[] freeMovieTitle = {"무료영화1", "무료영화2", "무료영화3"};
		String[] freeMovieThumbnail = {"무료 영화 썸네일 주소1", "무료 영화 썸네일 주소2", "무료 영화 썸네일 주소3"};
		String[] freeMovieAge = {"12","15",null};
		int[] freeMovieRuntime = {120,180,150};
		String[] freeMovieDate = {"2020-09-25","2020-09-23","2020-09-21"};
		
//		int[] newestMovieNo = {61,62,63,64,65,66,67,68,69,70};
//		String[] newestMovieTitle = {"최신영화1","최신영화2","최신영화3","최신영화4","최신영화5","최신영화6","최신영화7","최신영화8","최신영화9","최신영화10"};
//		String[] newestMovieThumbnail = {"최신 영화 썸네일 주소1","최신 영화 썸네일 주소2","최신 영화 썸네일 주소3","최신 영화 썸네일 주소4","최신 영화 썸네일 주소5","최신 영화 썸네일 주소6","최신 영화 썸네일 주소7","최신 영화 썸네일 주소8","최신 영화 썸네일 주소9","최신 영화 썸네일 주소10"};
//		String[] newestMovieType = {"구매","대여","대여","구매","대여","구매","대여","구매","구매","대여"};
//		int[] newestMoviePrice = {2000,3000,5000,2000,2000,2000,3000,5000,4000,7000};
//		int[] newestMovieSale = {50,20,0,10,0,15,20,33,55,0};
		
		int[] disneyMovieNo = {71,72,73,74,75,76,77,78,79,80};
		String[] disneyMovieTitle = {"디즈니영화1","디즈니영화2","디즈니영화3","디즈니영화4","디즈니영화5","디즈니영화6","디즈니영화7","디즈니영화8","디즈니영화9","디즈니영화10"};
		String[] disneyMovieThumbnail = {"디즈니 영화 썸네일 주소1","디즈니 영화 썸네일 주소2","디즈니 영화 썸네일 주소3","디즈니 영화 썸네일 주소4","디즈니 영화 썸네일 주소5","디즈니 영화 썸네일 주소6","디즈니 영화 썸네일 주소7","디즈니 영화 썸네일 주소8","디즈니 영화 썸네일 주소9","디즈니 영화 썸네일 주소10"};
		String[] disneyMovieType = {"구매","대여","대여","구매","대여","구매","대여","구매","구매","대여"};
		int[] disneyMoviePrice = {2000,3000,5000,2000,2000,2000,3000,5000,4000,7000};
		int[] disneyMovieSale = {50,20,0,10,0,15,20,33,55,0};
			
		// 지환쓰 구현 부 -------- 삭제 금지
		// 관리자 페이지가 없기때문에 파라미터값은 db에서 쿠폰 추가하고 개발자가 넣어줘야함...
		UserCoupon input = userCouponService.getCouponInfo(3);
		
		movie.addAttribute("coupon_no", input.getCoupon_no());
		movie.addAttribute("coupon_name", input.getName());
		movie.addAttribute("coupon_price", input.getPrice());
		movie.addAttribute("coupon_date", input.getPeriod());
		// 지환쓰 구현부 -------- 삭제금지 end
		
		for ( int i = 0 ; i < 20 ; i++ ) {
			int price = 0;
			if (top100MovieSale[i] == 0) {
				price = top100MoviePrice[i];
			} else {
				price = top100MoviePrice[i] / 100 * (100 - top100MovieSale[i]);
			}
			// TODO price가 1인경우 무료영화이니 제외 해야함 로직을 짜는 위치는 자유
			movie.addAttribute("top100MovieTitle"+i, top100MovieTitle[i]);
			movie.addAttribute("top100MovieThumbnail"+i, top100MovieThumbnail[i]);
			movie.addAttribute("top100MovieNo"+i, top100MovieNo[i]);
			movie.addAttribute("top100MoviePrice"+i, price);
			
			if (i < 10) {
				
				if (i < 3) {
					if (freeMovieAge[i] == null) {
						freeMovieAge[i] = "전체";
					}
					freeMovieDate[i] = freeMovieDate[i].substring(5,7) + "월" + freeMovieDate[i].substring(8,10) + "일 까지";
					movie.addAttribute("freeMovieNo"+i, freeMovieNo[i]);
					movie.addAttribute("freeMovieTitle"+i, freeMovieTitle[i]);
					movie.addAttribute("freeMovieThumbnail"+i, freeMovieThumbnail[i]);
					movie.addAttribute("freeMovieAge"+i, freeMovieAge[i]);
					movie.addAttribute("freeMovieRuntime"+i, freeMovieRuntime[i]);
					movie.addAttribute("freeMovieDate"+i, freeMovieDate[i]);
				}
				
				
				if (disneyMovieSale[i] == 0) {
					price = disneyMoviePrice[i];
				} else {
					price = disneyMoviePrice[i] / 100 * (100 - disneyMovieSale[i]);
				}
				movie.addAttribute("disneyMovieTitle"+i, disneyMovieTitle[i]);
				movie.addAttribute("disneyMovieThumbnail"+i, disneyMovieThumbnail[i]);
				movie.addAttribute("disneyMovieType"+i, disneyMovieType[i]);
				movie.addAttribute("disneyMoviePrice"+i, disneyMoviePrice[i]);
				movie.addAttribute("disneyMovieNo"+i, disneyMovieNo[i]);
				movie.addAttribute("disneyMovieSalePrice"+i, price);
						
			}
			
		}
		return "index";
	}
}
