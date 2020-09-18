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
import study.spring.clip.model.MovieComment;
import study.spring.clip.service.LoginService;
import study.spring.clip.service.MovieCommentService;

@Slf4j
@Controller
public class CommentController {
	
	// 댓글 객체 주입
	@Autowired
	MovieCommentService movieCommentService;
	
	// 로그인 객체 주입
	@Autowired
	LoginService loginService;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	//댓글 조회
	@RequestMapping(value = "Movie_comment", method = RequestMethod.GET)
	public String goMoviecomment(Model movie, HttpServletResponse response,HttpSession session,
			@RequestParam(value="movieNo") int movie_no){
		
		// session id값 가져오기
		String id = (String)session.getAttribute("id");	
		
		// 조회필요값 빈즈에저장
		MovieComment input =new MovieComment();
		input.setMovie_no(movie_no);

		// 조회결과를 저장할 객체 선언
		List<MovieComment> output = null;
	
		try {
			//데이터조회
			output = movieCommentService.MovieComment(input);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String CommentTitle = movieCommentService.getMovieComment(movie_no);
	
		//view  처리
		movie.addAttribute("output", output);			// 댓글조회
		movie.addAttribute("count", output.size());		// 댓글 총 갯수 조회
		movie.addAttribute("id", id);					// id조회
		movie.addAttribute("topInfo", CommentTitle);	// 해당 댓글 영화제목 조회
		
		return "Movie_comment";
	}
	
	//댓글 삽입
	@ResponseBody
	@RequestMapping(value="InsertMovieComment.do",method = RequestMethod.POST)
	public int insertMovieComment(Model model,HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="movie_no") int movie_no,
			@RequestParam(value="comment") String comment) {
		
		// session 가 null일때, 2리턴 		
		// 로그인이 안되어있을때의 예외처리
		if ( session.getAttribute("id") == null ) {
			return 2;
		}
		
		// 세션 아이디 가져오기
		String session_Id = (String)session.getAttribute("id");
		// 유저no 가져오기
		int session_user_no = (int)session.getAttribute("user_no");
			
		// 만약 로그인이 되어있다면
		if(session_Id != null) {
			
			//댓글 삽입
			try {
				movieCommentService.insertMovieComment(session_Id,comment,movie_no,session_user_no);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
		}
		
		return 1;
	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value="DeleteMovieComment.do",method = RequestMethod.POST)
	public void deleteMovieComment(Model model,HttpServletResponse response,
			HttpSession session,
			@RequestParam(value="movie_comment_no") int movie_comment_no) {
		try {
			// 댓글 삭제 기능 
			movieCommentService.deleteMovieComment(movie_comment_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}	
	
	
}
