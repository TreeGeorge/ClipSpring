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

import study.spring.clip.model.BuyMovieList;
import study.spring.clip.service.BuyMovieListService;

@Controller
public class BuyMovieListController {
	
	@Autowired
	BuyMovieListService buyMovieListService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "MY_movie_purchase_list", method = RequestMethod.GET)
	public String goMyMoviePurchaseList(Model movie, HttpServletResponse response, HttpSession session) {
		
		if ( session.getAttribute("id") == null ) {
			try {
				response.sendRedirect(contextPath + "/Login");
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
    	
		int user_no = (int)session.getAttribute("user_no");
		
		List<BuyMovieList> output = buyMovieListService.getBuyMovieList(user_no);
		
		movie.addAttribute("output", output);
		
		return "MY_movie_purchase_list";
	}

}
