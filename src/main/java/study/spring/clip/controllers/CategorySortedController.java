package study.spring.clip.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import study.spring.clip.model.CategorySorted;
import study.spring.clip.service.CategorySortedService;

@Controller
public class CategorySortedController {

	@Autowired
	CategorySortedService categorySortedService;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "Movie_category_sorted", method = RequestMethod.GET)
	public String getCategoryInfo(Model movie,
			@RequestParam(value = "categoryTypeNo", defaultValue = "1") int categoryTypeNo) {

		int TotalCount = categorySortedService.getTotalCount(categoryTypeNo);	// total 영화 갯수
		List<CategorySorted> output1 = categorySortedService.getrecentList(categoryTypeNo, 1, 0);

		String cagtegoryName = categorySortedService.getCategoryName(categoryTypeNo);

		movie.addAttribute("topInfo", cagtegoryName); //장르 이름 헤더
		movie.addAttribute("TotalCount", TotalCount); //총 영화 수
		movie.addAttribute("output1",output1);		  //영화 데이터
		movie.addAttribute("categoryTypeNo", categoryTypeNo); //카테고리 타입 no

		return "Movie_category_sorted";
	}
	
	@ResponseBody
	@RequestMapping(value="moreView.do", method=RequestMethod.POST)
	public List<CategorySorted> moreView(
			@RequestParam(value="no") int no,
			@RequestParam(value="option") int option,
			@RequestParam(value="stack") int stack
			) {
		List<CategorySorted> output1 = categorySortedService.getrecentList(no, option, stack);
		
		return output1;
	}
	
}
