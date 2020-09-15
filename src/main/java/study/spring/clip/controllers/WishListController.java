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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.WishList;
import study.spring.clip.service.WishListService;


@Controller
public class WishListController {
	@Autowired
	WishListService wishListService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value="Wish_list", method = RequestMethod.GET)
	public String goWishList(Model model, HttpServletResponse response,
			HttpSession session
			) {
		
		if ( session.getAttribute("id") == null ) {
			try {
				response.sendRedirect(contextPath + "/Login");
				return "Login";
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		int x = (Integer)session.getAttribute("user_no");

		List<WishList> output = wishListService.getWishListList(x);


		model.addAttribute("output",output);
		
		return "Wish_list";
	}
	@ResponseBody
	@RequestMapping(value="wishListInsert.do",method=RequestMethod.POST)
	public int insertWishList(HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="movieNo") int movie_no) {
		if ( session.getAttribute("id") == null ) {
			return 2;
		}	
		
		int x = (Integer)session.getAttribute("user_no");
		WishList input = new WishList();
		input.setUser_no(x);
		input.setMovie_no(movie_no); 
		
		
		if(!wishListService.checkWishList(input)) {
			
			return 0;
		}
		try {
			wishListService.insertWishList(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		return 1;
	}
	@ResponseBody
	@RequestMapping(value="wishListDelete.do",method=RequestMethod.POST)
	public int deleteWishList(HttpServletResponse response,
			HttpSession session,@RequestParam(value="movieNo") int movie_no) {
		int x = (Integer)session.getAttribute("user_no");
		WishList input = new WishList();
		input.setUser_no(x);
		input.setMovie_no(movie_no);
		
		if(wishListService.checkWishList(input)) {
			
			return 1;
		}
		try {
			wishListService.deleteWishList(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		return 0;
	}
}
