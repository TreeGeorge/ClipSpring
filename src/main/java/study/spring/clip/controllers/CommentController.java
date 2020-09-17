package study.spring.clip.controllers;

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
import study.spring.clip.model.CommentAppraisal;
import study.spring.clip.model.MovieComment;
import study.spring.clip.service.CommentAppraisalService;
import study.spring.clip.service.LoginService;
import study.spring.clip.service.MovieCommentService;

@Slf4j
@Controller
public class CommentController {

	@Autowired
	MovieCommentService movieCommentService;
	
	@Autowired
	CommentAppraisalService commentAppraisalService;

	@Autowired
	LoginService loginService;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	//댓글 조회
	@RequestMapping(value = "Movie_comment", method = RequestMethod.GET)
	public String goMoviecomment(Model movie, HttpServletResponse response,HttpSession session,
			@RequestParam(value="movieNo") int movie_no) {
		
		String id = (String)session.getAttribute("id");
		
		
		// 조회필요값 빈즈에저장
		MovieComment input =new MovieComment();
		CommentAppraisal input2 = new CommentAppraisal();
		input.setMovie_no(movie_no);
		
		
		// 조회결과를 저장할 객체 선언
		List<MovieComment> output = null;
		int output2 = 0;
		
		try {
			//데이터조회
			output = movieCommentService.MovieComment(input);
			output2 = commentAppraisalService.getlikeComment(input2);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String CommentTitle = movieCommentService.getMovieComment(movie_no);
	
		//view  처리
		movie.addAttribute("output", output);
		movie.addAttribute("count", output.size());
		movie.addAttribute("id", id);
		movie.addAttribute("topInfo", CommentTitle);
		movie.addAttribute("like",output2);
		
		return "Movie_comment";
	}
	
	//댓글 삽입
	@ResponseBody
	@RequestMapping(value="InsertMovieComment.do",method = RequestMethod.POST)
	public void insertMovieComment(Model model,HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="movie_no") int movie_no,
			@RequestParam(value="comment") String comment) {
		
		String session_Id = (String)session.getAttribute("id");
		
		int session_user_no = (int)session.getAttribute("user_no");
		log.debug(session_Id + comment + movie_no + session_user_no + "242");
		if(session_Id != null) {
			
			try {
				movieCommentService.insertMovieComment(session_Id,comment,movie_no,session_user_no);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="DeleteMovieComment.do",method = RequestMethod.POST)
	public void deleteMovieComment(Model model,HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="movie_comment_no") int movie_comment_no) {

		try {
			movieCommentService.deleteMovieComment(movie_comment_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}	
	
	//댓글 좋아요 싫어요 조회
	@ResponseBody
	@RequestMapping(value="CommentAppraisal.do",method = RequestMethod.POST)
	public void CommentAppraisal(Model model,HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="comment_appraisal") int movie_comment_no,
			@RequestParam(value="comment_appraisal") String answer){
		int user_no = (int)session.getAttribute("user_no");
		commentAppraisalService.CommentAppraisal(user_no, movie_comment_no, answer);
	}
	
	
	
}
