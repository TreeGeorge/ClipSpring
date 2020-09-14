package study.spring.clip.controllers;


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

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.Interest;
import study.spring.clip.model.Movie;
import study.spring.clip.model.MovieLike;
import study.spring.clip.model.StarRating;
import study.spring.clip.model.User;

import study.spring.clip.service.InterestService;
import study.spring.clip.service.LoginService;
import study.spring.clip.service.MovieLikeService;
import study.spring.clip.service.MovieService;
import study.spring.clip.service.StarRatingService;

@Slf4j
@Controller
public class InterestController {
	
	@Autowired
	InterestService interestService;
	
	@Autowired
	MovieLikeService movieLikeService;
	
	@Autowired
	StarRatingService starRatingService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	MovieService movieService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value="MY_interest_movie", method = RequestMethod.GET)
	public String goInterestMovie(Model model, HttpServletResponse response,
			HttpSession session			
			) {

		int x = (Integer)session.getAttribute("user_no");
		User user = loginService.randerUser(x);
		 // id_box의 유저 코인정보
		 model.addAttribute("user_coin", user.getCoin());
		 

		List<Interest> output = interestService.getInterestList(x);
		model.addAttribute("output",output);
		List<Interest> output1 = interestService.getrecentList(x);
		model.addAttribute("output1",output1);
		List<Interest> output2 = interestService.gethighpriceList(x);
		model.addAttribute("output2",output2);
		List<Interest> output3 = interestService.getrrowpriceList(x);
		model.addAttribute("output3",output3);
		
		return "MY_interest_movie";
	}

	@ResponseBody
	@RequestMapping(value="interestInsert.do",method = RequestMethod.POST)
	public int insertMovie(Model model,HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="movieNo") int movie_no) {
		if ( session.getAttribute("id") == null ) {
			return 2;
		}	
		
		int x = (Integer)session.getAttribute("user_no");
		Interest input = new Interest();
		input.setUser_no(x);
		input.setMovie_no(movie_no); 
		
		
		if(interestService.checkInterest(input)) {
			
			return 0;
		}
		try {
			interestService.insertInterest(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		return 1;
	}
	@ResponseBody
	@RequestMapping(value="interestDelete.do",method = RequestMethod.POST)
	public int deleteLike(Model model,HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="movieNo") int movie_no) {
		
		int x = (Integer)session.getAttribute("user_no");
		Interest input = new Interest();
		input.setUser_no(x);
		input.setMovie_no(movie_no); 
		
		
		try {
			interestService.deleteInterest(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		return 1;
	}
	@ResponseBody
	@RequestMapping(value="MovieLikeInsert.do",method = RequestMethod.POST)
	public int insertLike(Model model,HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="movieNo") int movie_no,
			@RequestParam(value="ddd") int movie_like) {
		
		if ( session.getAttribute("id") == null ) {
			return 2;
		}	
		
		int x = (Integer)session.getAttribute("user_no");
		MovieLike input= new MovieLike();
		input.setUser_no(x);
		input.setMovie_no(movie_no); 
				
		if(movieLikeService.checkMovieLike(input)) {
			return 0;
		}
		try {
			movieLikeService.insertMovieLike(input);
			Movie input1=new Movie();
			input1.setMovie_no(movie_no);
			movie_like=movieService.getMovieLike(input1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value="MovieLikeDelete.do",method = RequestMethod.POST)
	public int deleteMovie(Model model,HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="movieNo") int movie_no,
			@RequestParam(value="ddd") int movie_like) {
		
		int x = (Integer)session.getAttribute("user_no");
		MovieLike input = new MovieLike();
		input.setUser_no(x);
		input.setMovie_no(movie_no); 
		
		if(movieLikeService.checkMovieLike(input)) {
			return 0;
		}
		try {
			movieLikeService.deleteMovieLike(input);
			Movie input1=new Movie();
			input1.setMovie_no(movie_no);
			movie_like=movieService.getMovieLike(input1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		return 1;
	}
	@ResponseBody
	@RequestMapping(value="checkStar",method = RequestMethod.POST)
	public int checkStar(Model model,HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="movieNo") int movie_no
			) {
		
		
		if ( session.getAttribute("id") == null ) {
			return 2;
		}
		int x = (Integer)session.getAttribute("user_no");
		StarRating input = new StarRating();
		input.setUser_no(x);
		input.setMovie_no(movie_no); 
		
		if(starRatingService.checkStar(input)) {
			return 0;
		}
		return 1;

	}
	@ResponseBody
	@RequestMapping(value="insertStar",method = RequestMethod.POST)
	public void insertStar(Model model,HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="movieNo") int movie_no,
			@RequestParam(value="score") double rate) {
		
		log.debug("rate");

		int x = (Integer)session.getAttribute("user_no");
		StarRating input = new StarRating();
		input.setUser_no(x);
		input.setMovie_no(movie_no); 
		input.setScore(rate);
		try {
			starRatingService.insertStar(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}
}

