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
import study.spring.clip.model.Interest;
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
		List<CategorySorted> output1 = categorySortedService.getrecentList(categoryTypeNo);
		List<CategorySorted> output3 = categorySortedService.getrowpriceList(categoryTypeNo); 
		List<CategorySorted> output2 = categorySortedService.gethighpriceList(categoryTypeNo);
		
		String cagtegoryName = categorySortedService.getCategoryName(categoryTypeNo);
		
		movie.addAttribute("topInfo", cagtegoryName);
		movie.addAttribute("categorySorted", categorySorted);
		movie.addAttribute("TotalCount", TotalCount);
		movie.addAttribute("output1",output1);
		movie.addAttribute("output3",output3);
		movie.addAttribute("output2",output2);
		
		return "Movie_category_sorted";
	}
}
