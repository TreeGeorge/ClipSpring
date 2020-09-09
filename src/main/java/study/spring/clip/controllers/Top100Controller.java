package study.spring.clip.controllers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Top100Controller {

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "Movie_top100", method = RequestMethod.GET)
	public String goTop100(Model movie) {
		return "Movie_top100";
	}
}
