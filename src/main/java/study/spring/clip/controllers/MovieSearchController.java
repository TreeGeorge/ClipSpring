package study.spring.clip.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.clip.model.MovieSearch;
import study.spring.clip.service.MovieSearchService;

@Controller
public class MovieSearchController {
	@Autowired
	MovieSearchService movieSearchService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "Movie_search.do", method = RequestMethod.POST)
	public String goMovieSearch(Model movie){
		List<MovieSearch> MovieSearchActor = movieSearchService.getMovieSearchActor(contextPath); // 배우검색
		List<MovieSearch> MovieSearchTitle = movieSearchService.getMovieSearchTitle(contextPath); // 영화제목검색
		List<MovieSearch> MovieSearchDirector = movieSearchService.getMovieSearchDirector(contextPath); // 감독검색

		movie.addAttribute("MovieSearchActor", MovieSearchActor);
		movie.addAttribute("MovieSearchTitle", MovieSearchTitle);
		movie.addAttribute("MovieSearchDirector", MovieSearchDirector);

		
		return "Movie_search";
	}
}