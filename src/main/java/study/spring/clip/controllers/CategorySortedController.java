package study.spring.clip.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
			// GET, POST 파라미터 받기
			@RequestParam(value = "categoryTypeNo", defaultValue = "카테고리 번호") int categoryTypeNo) {

			
		List<CategorySorted> categorySorted = categorySortedService.getCategorySorted(categoryTypeNo); // 조회 처리가 저장될 객체
		int TotalCount = categorySortedService.getTotalCount(categoryTypeNo);	// total 영화 갯수
		
		movie.addAttribute("categorySorted", categorySorted);
		movie.addAttribute("TotalCount", TotalCount);
		
		return "Movie_category_sorted";
	}
}
