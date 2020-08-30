package study.spring.clip.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.clip.model.FreeMovie;
import study.spring.clip.service.FreeMovieService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FreeMoveiController {
	
	@Autowired
	FreeMovieService freeMovieService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "Movie_free", method = RequestMethod.GET)
	public String goFreeMovie(Model movie, HttpServletResponse response) {
		
		List<FreeMovie> output = freeMovieService.getFreeMovieList(); // 조회 처리가 저장될 객체
		
		movie.addAttribute("output", output);
		
		return "Movie_free";
	}

}
