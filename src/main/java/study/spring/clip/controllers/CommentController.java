package study.spring.clip.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.clip.service.MovieCommentService;

@Controller
public class CommentController {
	
	@Autowired
	MovieCommentService movieCommentService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "Movie_comment", method = RequestMethod.GET)
	public String goMoviecomment(Model movie){
		
		
		return "Movie_comment";
	}
	
	
}
