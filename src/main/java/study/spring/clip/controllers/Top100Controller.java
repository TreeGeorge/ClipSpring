package study.spring.clip.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.clip.model.Top100;
import study.spring.clip.service.Top100Service;

@Controller
public class Top100Controller {
	
	@Autowired
	Top100Service top100Service;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	

	@RequestMapping(value = "Movie_top100", method = RequestMethod.GET)
	public String goTop100(Model movie) {
		
		List<Top100> dayList = top100Service.dailyRanking();
		List<Integer> dailyRank = top100Service.dailyRankChange();
		List<Top100> weekList = top100Service.weeklyRanking();
		List<Integer> weeklyRank = top100Service.weeklyRankChange();
		
		movie.addAttribute("dayList", dayList);
		movie.addAttribute("dailyRank", dailyRank);
		movie.addAttribute("weekList", weekList);
		movie.addAttribute("weeklyRank", weeklyRank);
		
		return "Movie_top100";
	}
}
