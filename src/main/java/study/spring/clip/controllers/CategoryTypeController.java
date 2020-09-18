package study.spring.clip.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.clip.model.CategoryType;
import study.spring.clip.service.CategoryTypeService;

@Controller
public class CategoryTypeController {

	// 카테고리타입 객체 주입
	@Autowired
	CategoryTypeService categoryTypeService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "Category_list", method = RequestMethod.GET)
	public String goCategoryList(Model movie){
		
		// 장르별 조회
		List<CategoryType> categoryTypeG = categoryTypeService.getCategoryTypeListG("G");
		
		// 상품별 조회
		List<CategoryType> categoryTypeP = categoryTypeService.getCategoryTypeListP("P"); 

		movie.addAttribute("categoryTypeG", categoryTypeG);
		movie.addAttribute("categoryTypeP", categoryTypeP);
		
		return "Movie_category_list";
	}
}
