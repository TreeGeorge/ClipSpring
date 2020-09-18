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

import study.spring.clip.model.CategorySorted;
import study.spring.clip.model.Movie;
import study.spring.clip.service.CategorySortedService;
import study.spring.clip.service.MovieService;


@Controller
public class MovieController {
	
		@Autowired
		CategorySortedService categorySortedService;
		@Autowired
		MovieService movieService;
		@Value("#{servletContext.contextPath}")
		String contextPath;

		
		//해당영화 정보 불러오기
		@RequestMapping(value="Movie_information",method=RequestMethod.GET)
		public String movieinfo(Model model,HttpServletResponse response,
				@RequestParam(value="movieNo") int movie_no,
				HttpSession session) throws IOException {
			// 파라미터값으로 받은 영화가 실제 존재하는 영화인지 판별 <-- 존재하지 않는다면 메인화면으로 보내버림
			Movie exist = new Movie();
			
				exist.setMovie_no(movie_no);
				if (movieService.getMovieItem(exist) == null) {
					try {
						response.sendRedirect(contextPath + "/home");
						return "index";
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			
			
			Movie input =new Movie();
			input.setMovie_no(movie_no);
			// 배우정보 가져오기
			List<Movie> output6 = movieService.getActor(movie_no);
			//콤마넣고 마지막엔 빼주기
			String actor_name = "";
			for (int i = 0 ; i < output6.size() ; i++ ) {
				actor_name += output6.get(i).getName() + ", ";
			}
			
			String a = actor_name.substring(0, actor_name.lastIndexOf(","));
			
			
			
			// 조회결과를 저장할 객체 선언
			Movie output = null;
			int output1 = 0;
			double output2 = 0;
			int output3  =0;
			
			try {
				//데이터조회
				output = movieService.getMovieItem(input);
				output1 = movieService.getMovieLike(input);
				output2 = movieService.getMovieStar(input);
				output3 = movieService.getMoviePeople(input);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			List<CategorySorted> infoCategory = categorySortedService.getMovieInfoGenreList(output.getCategory_type_no());
			List<CategorySorted> infoRecommend = categorySortedService.getMovieInfoRecommendList();
			List<CategorySorted> infoSale = categorySortedService.getMovieInfoSaleList();
			
			//view  처리
			model.addAttribute("infoCategory", infoCategory);
			model.addAttribute("infoSale", infoSale);
			model.addAttribute("infoRecommend", infoRecommend);
			model.addAttribute("movie_no",output.getMovie_no());
			model.addAttribute("movie_name",output.getName());
			model.addAttribute("movie_director",output.getDirector());		
			model.addAttribute("movie_runtime",output.getRuntime());
			model.addAttribute("movie_thumbnail",output.getThumbnail());
			model.addAttribute("movie_sale", output.getSale());
			model.addAttribute("movie_summary",output.getSummary());
			model.addAttribute("movie_like",output1);
			model.addAttribute("movie_star",output2);
			model.addAttribute("movie_people",output3);
			model.addAttribute("movie_type",output.getType());
			model.addAttribute("movie_actor",a);
			model.addAttribute("movie_preview",output.getPreview());
			model.addAttribute("movie_release_date",output.getRelease_date());
			
			return "Movie_information";
		}

		//관심등록여부판단하기
		@ResponseBody
		@RequestMapping(value="interestCommit",method=RequestMethod.POST)
		public int check1(HttpServletResponse response,
				@RequestParam(value="movieNo") int movie_no,
				HttpSession session) throws IOException {
			
			
			if ( session.getAttribute("id") != null ) {
				int x = (Integer)session.getAttribute("user_no");
				Movie input4=new Movie();
				input4.setMovie_no(movie_no);
				input4.setUser_no(x);
				try {
					if(movieService.getinterestCommit(input4)!=0) {
						return 9;
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		}
			return 8;
	}
		//라이크여부판단하기
		@ResponseBody
		@RequestMapping(value="likeCommit",method=RequestMethod.POST)
		public int check2(HttpServletResponse response,
				@RequestParam(value="movieNo") int movie_no,
				HttpSession session) throws IOException {
			
			
			if ( session.getAttribute("id") != null ) {
				int x = (Integer)session.getAttribute("user_no");
				Movie input5=new Movie();
				input5.setMovie_no(movie_no);
				input5.setUser_no(x);
				try {
					if(movieService.getlikeCommit(input5)!=0) {
						return 9;
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		}
			return 8;
	}

		//좋아요 개수 실시간 변경
		@ResponseBody
		@RequestMapping(value="recent",method=RequestMethod.POST)
		public int recentLike1(Model model,HttpServletResponse response,
				@RequestParam(value="movieNo") int movie_no)  {
			
			Movie input =new Movie();
			input.setMovie_no(movie_no);
			int result = 0;
			try {
				result = movieService.getMovieLike(input);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// @ResponseBody 쓰면 모델로 보낼수가 업성서 리턴으로함
			return result;
	}
		//별점 실시간 변경
		@ResponseBody
		@RequestMapping(value="recentstar",method=RequestMethod.POST)
		public double recentStar(Model model,HttpServletResponse response,
				@RequestParam(value="movieNo") int movie_no)  {
			
			Movie input =new Movie();
			input.setMovie_no(movie_no);
			double result = 0;
			try {
				result = movieService.getMovieStar(input);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// @ResponseBody 쓰면 모델로 보낼수가 업성서 리턴으로함
			return result;
	}
		//별점 매긴사람 실시간 변경
		@ResponseBody
		@RequestMapping(value="recentpeople",method=RequestMethod.POST)
		public int recentPeople(Model model,HttpServletResponse response,
				@RequestParam(value="movieNo") int movie_no)  {
			
			Movie input =new Movie();
			input.setMovie_no(movie_no);
			int result = 0;
			try {
				result = movieService.getMoviePeople(input);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// @ResponseBody 쓰면 모델로 보낼수가 업성서 리턴으로함
			return result;
	}

	// 영화 검색 페이지
	@RequestMapping(value ="Movie_search", method = RequestMethod.GET)
	public String goMovieSearch(Model movie,
		@RequestParam(value="name", required=false) String name){
		
		// 검색값이 존재 한다면
		if (name != null && !name.equals("")) {
			
			List<Movie> output = movieService.getSearchMovieList(name);

			movie.addAttribute("output", output);		
			movie.addAttribute("search_check", 1);
			movie.addAttribute("count", output.size());
			movie.addAttribute("name", name);
		} else {
			movie.addAttribute("search_check", 2);
		}

		return "Movie_search";
	}			
}



