package study.spring.clip.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.clip.model.MovieSearch;
import study.spring.clip.service.MovieSearchService;

@Controller
public class MovieSearchController {
	@Autowired
	MovieSearchService movieSearchService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value ="Movie_search", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMovieSearch(Model movie,
		@RequestParam(value="name", required=false) String name){
		
		MovieSearch input = new MovieSearch();
		input.setDirector(name);
		input.setName(name);
		
		List<MovieSearch> output = null;
		
		try {
			output = movieSearchService.getMovieSearch(name);
		} catch (Exception e) {e.printStackTrace();
			}
		
	
		movie.addAttribute("name", name);			// 검색
//		movie.addAttribute("count", output.size());		// 총 갯수

		return "Movie_search";
	}
}