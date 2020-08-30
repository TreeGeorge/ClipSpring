package study.spring.clip.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

// 이 클래스를 컨트롤러로서 지정함
// -> import org.springframework.stereotype.Controller;
@Controller
public class ParamsController {
	/** GET 방식의 파라미터를 전송받기 위한 컨트롤러 메서드 */
	// 변수값을 View에게 전달할 필요가 있는 경우 Model 파라미터를 정의한다.
	// import org.springframework.ui.Model;
	@RequestMapping(value = "Movie_information", method = RequestMethod.GET)
	public String getMovieInfo(Model movie,
			// GET, POST 파라미터 받기
			@RequestParam(value="movieNo", defaultValue="영화 번호") String movieNo) {
		String movieTitle = "임시 제목";
		int price = 2000;		// 임시 가격
		String director = "임시 감독";
		String actor = "임시 배우";
		int runTime = 120;		// 임시 관람 시간
		String summary = "임시 줄거리";
		String preview = "임시 예고편 링크";
		double rating = 4.2;	// 임시 별점
		int ratingCount = 12;	// 임시 별점을 준 사람 수
				
		// db 값을 위에 선언해준 변수에 담기.
		// db에서 movieNo 가 무비 프라이머리키 
		
		// 파라미터값을 View에게 전달한다
		movie.addAttribute("price",price);
		movie.addAttribute("movieTitle",movieTitle);
		movie.addAttribute("director",director);
		movie.addAttribute("actor",actor);
		movie.addAttribute("runTime",runTime);
		movie.addAttribute("summary",summary);
		movie.addAttribute("preview",preview);
		movie.addAttribute("rating",rating);
		movie.addAttribute("ratingCount",ratingCount);
		
		// "/src/main/webapp/WEB-INF/views/params/get.jsp" 파일로 View로 지정한다
		return "Movie_information";
	}
	
	@RequestMapping(value = "Youth_protection_policy", method = RequestMethod.GET)
	public String goYouthProtectionPolicy() {
		return "Youth_protection_policy";
	}
	
	@RequestMapping(value = "Clip_terms", method = RequestMethod.GET)
	public String goClipTerms() {
		return "Clip_terms";
	}
	
	@RequestMapping(value = "Privacy_policy", method = RequestMethod.GET)
	public String goPrivacyPolicy() {
		return "Privacy_policy";
	}
	
	@RequestMapping(value = "Customer_service", method = RequestMethod.GET)
	public String goCustomerService() {
		return "Customer_service";
	}
	
	@RequestMapping(value = "Category_list", method = RequestMethod.GET)
	public String goCategoryList(Model movie) {
		int categoryTypeNo[] = {1,2,3,4,5,6,7,8,9,10,100,101,102,103,104,105,1000,1001,1002};
		String categoryTypeName[] = {"카테고리1","카테고리2","카테고리3","카테고리4","카테고리5","카테고리6","카테고리7","카테고리8","카테고리9","카테고리10","카테고리11","카테고리12","카테고리13","카테고리14","카테고리15","카테고리16","카테고리17","카테고리18","카테고리19"};
		String categoryTypeIcon[] = {"아이콘 주소1","아이콘 주소2","아이콘 주소3","아이콘 주소4","아이콘 주소5","아이콘 주소6","아이콘 주소7","아이콘 주소8","아이콘 주소9","아이콘 주소10","아이콘 주소11","아이콘 주소12","아이콘 주소13","아이콘 주소14","아이콘 주소15","아이콘 주소16","아이콘 주소17","아이콘 주소18","아이콘 주소19"};
		
		for ( int i = 0 ; i < categoryTypeNo.length ; i++ ) {
			movie.addAttribute("categoryTypeName"+i, categoryTypeName[i]);
			movie.addAttribute("categoryTypeIcon"+i, categoryTypeIcon[i]);
			movie.addAttribute("categoryTypeNo"+i, categoryTypeNo[i]);
		}
		return "Movie_category_list";
	}
	
	@RequestMapping(value = "Category_sorted", method = RequestMethod.GET)
	public String getCategoryInfo(Model movie,
			// GET, POST 파라미터 받기
			@RequestParam(value = "categoryTypeNo", defaultValue = "카테고리 번호") String categoryTypeNo) {
		int[] MovieNo = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
		int total = MovieNo.length;
		String[] MovieTitle = { "액션영화1", "액션영화2", "액션영화3", "액션영화4", "액션영화5", "액션영화6", "액션영화7", "액션영화8", "액션영화9",
				"액션영화10" };
		String[] MovieThumbnail = { "액션 영화 썸네일 주소1", "액션 영화 썸네일 주소2", "액션 영화 썸네일 주소3", "액션 영화 썸네일 주소4", "액션 영화 썸네일 주소5",
				"액션 영화 썸네일 주소6", "액션 영화 썸네일 주소7", "액션 영화 썸네일 주소8", "액션 영화 썸네일 주소9", "액션 영화 썸네일 주소10" };
		String[] MovieType = { "구매", "대여", "대여", "구매", "대여", "구매", "대여", "구매", "구매", "대여" };
		int[] MoviePrice = { 2000, 3000, 5000, 2000, 2000, 2000, 3000, 5000, 4000, 7000 };
		int[] MovieSale = { 50, 20, 0, 10, 0, 15, 20, 33, 55, 0 };
		// TODO 할인율이 0 이면(가격이 똑같다면) script에서 할인전 가격 리무브 해주기
		
		
		for (int i = 0; i < 10; i++) {
			int price = 0;
			if (MovieSale[i] == 0) {
				price = MoviePrice[i];
			} else {
				price = MoviePrice[i] / 100 * MovieSale[i];
			}
			movie.addAttribute("MovieNo" + i, MovieNo[i]);
			movie.addAttribute("MovieThumbnail" + i, MovieThumbnail[i]);
			movie.addAttribute("MovieTitle" + i, MovieTitle[i]);
			movie.addAttribute("MovieType" + i, MovieType[i]);
			movie.addAttribute("MoviePrice" + i, price);
		}
			movie.addAttribute("total" , total);

		// "/src/main/webapp/WEB-INF/views/params/get.jsp" 파일로 View로 지정한다
		return "Movie_category_sorted";
	}
	
	@RequestMapping(value = "Movie_free", method = RequestMethod.GET)
	public String goFreeMovie(Model movie) {
		int[] MovieNo = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
		String[] MovieThumbnail = 
			{ "무료 영화 썸네일 주소1", "무료 영화 썸네일 주소2", "무료 영화 썸네일 주소3", "무료 영화 썸네일 주소4", "무료 영화 썸네일 주소5",
				"무료 영화 썸네일 주소6", "무료 영화 썸네일 주소7", "무료 영화 썸네일 주소8", "무료 영화 썸네일 주소9", "무료 영화 썸네일 주소10" };
		String[] MovieTitle = 
			{ "무료영화1", "무료영화2", "무료영화3", "무료영화4", "무료영화5", "무료영화6", "무료영화7", "무료영화8", "무료영화9","무료영화10" };
		String[] MovieAge = {"12세","15세","전체","12세","15세","전체","12세","15세","전체","12세"};
		int[] MovieRuntime = {120,180,150,120,180,150,120,180,150,120};
		String[] MovieDate = 
			{"2020-09-25","2020-09-23","2020-09-21","2020-09-25","2020-09-23","2020-09-21","2020-09-25","2020-09-23","2020-09-21","2020-09-21"};
	
		
		for (int i = 0; i < 10; i++) {
			MovieDate[i] = MovieDate[i].substring(5,7) + "월" + MovieDate[i].substring(8,10) + "일 까지";
			movie.addAttribute("MovieNo" + i, MovieNo[i]);
			movie.addAttribute("MovieThumbnail" + i, MovieThumbnail[i]);
			movie.addAttribute("MovieTitle" + i, MovieTitle[i]);
			movie.addAttribute("MovieAge" + i, MovieAge[i]);
			movie.addAttribute("MovieRuntime" + i, MovieRuntime[i]);
			movie.addAttribute("MovieDate" + i, MovieDate[i]);	
		}

		// "/src/main/webapp/WEB-INF/views/params/get.jsp" 파일로 View로 지정한다
		return "Movie_free";
	}
	
	
	
	/** POST 방식의 파라미터를 전송받기 위한 컨트롤러 메서드 */
	// 추가적인 파라미터가 필요하다면 콤마(,)로 구분하여 나열한다.
	@RequestMapping(value = "Wish_list", method = {RequestMethod.GET, RequestMethod.POST})
	public String post(Model model,
			@RequestParam(value="id", defaultValue="") String id) {
		int[] movieNo = {1,2,3,4};
		String[] movieType = {"대여","구매","구매","대여"};
		String[] movieTitle = {"제목1","제목2","제목3","제목4"};
		String[] movieThumbnail = {"썸네일 주소1","썸네일 주소2","썸네일 주소3","썸네일 주소4"};
		int[] moviePrice = {2000,3000,4200,8100};
		int[] movieSale = {50,20,0,25};
		int price = 0;
		
		// TODO post 아이디 값 받아서 DB 비교 해서 위시 리스트 목록 객체 추가 후 할당
		

		
		
		// 파라미터값을 View에게 전달한다.
		for ( int i = 0 ; i < movieNo.length ; i++ ) {
			price = moviePrice[i] / 100 * (100 - movieSale[i]);
			model.addAttribute("movieNo"+i,movieNo[i]);
			model.addAttribute("movieType"+i,movieType[i]);
			model.addAttribute("movieTitle"+i,movieTitle[i]);
			model.addAttribute("movieThumbnail"+i,movieThumbnail[i]);
			model.addAttribute("moviePrice"+i,price);
		}
		
		// TODO 장바구니 삭제 로직에서 DB에서도 삭제되는 로직 추가
		
		// "/src/main/webapp/WEB-INF/views/Wish_list.jsp" 파일을 View로 지정한다.
		return "Wish_list";
	}
//	
//	/** PATH 파라미터를 전송받기 위한 컨트롤러 메서드 (1) */
//	// import org.springframework.web.bind.annotation.PathVariable;
//	@RequestMapping(value = "/params/path1/{txt1}/{txt2}/{num}", method = RequestMethod.GET)
//	public String path1 (Model model,
//			@PathVariable String txt1,
//			@PathVariable String txt2,
//			@PathVariable int num) {
//		
//		// 파라미터값을 View에게 전달한다.
//		model.addAttribute("txt1", txt1);
//		model.addAttribute("txt2", txt2);
//		model.addAttribute("num", num);
//		
//		// "/src/main/webapp/WEB-INF/views/params/path1.jsp" 파일을 view로 지정한다.
//		return "params/path1";
//	}
//	
//	/** PATH 파라미터를 전송받기 위한 컨트롤러 메서드 (2) */
//	@RequestMapping(value = "/params/path2/{txt1}/{txt2}/{num}", method = RequestMethod.GET)
//	public String path2 (Model model,
//			@PathVariable(value="txt1") String textValue1,
//			@PathVariable(value="txt2") String textValue2,
//			@PathVariable(value="num") int numberValue) {
//		
//		// 파라미터값을 View에게 전달한다.
//		model.addAttribute("textValue1", textValue1);
//		model.addAttribute("textValue2", textValue2);
//		model.addAttribute("numberValue", numberValue);
//		
//		// "/src/main/webapp/WEB-INF/views/params/path2.jsp" 파일을 view로 지정한다.
//		return "params/path2";
//	}
}
