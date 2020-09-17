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

import study.spring.clip.model.Actor;
import study.spring.clip.model.Movie;
import study.spring.clip.service.ActorService;
import study.spring.clip.service.MovieService;


@Controller
public class MovieController {
	
	
		@Autowired
		MovieService movieService;
		@Autowired
		ActorService actorService;
		@Value("#{servletContext.contextPath}")
		String contextPath;

		@RequestMapping(value="Movie_information",method=RequestMethod.GET)
		public String movieinfo(Model model,HttpServletResponse response,
				@RequestParam(value="movieNo") int movie_no,
				HttpSession session) throws IOException {
			
			// 조회필요값 빈즈에저장
			Movie input =new Movie();
			input.setMovie_no(movie_no);
			List<Actor> output6 = actorService.getActor(movie_no);
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
			
			System.out.println(output2);
			System.out.println(output3);
			//view  처리
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

		//2
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

			
			return result;
	}
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

			
			return result;
	}
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

			
			return result;
	}

			
			
}



