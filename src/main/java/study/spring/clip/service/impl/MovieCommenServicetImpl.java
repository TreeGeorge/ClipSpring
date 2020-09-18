package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.MovieComment;
import study.spring.clip.service.MovieCommentService;

@Service
public class MovieCommenServicetImpl implements MovieCommentService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MovieComment> MovieComment(MovieComment input) throws Exception {

		List<MovieComment> result = sqlSession.selectList("MovieCommentMapper.oneComment",input);

		return result;
	}

	
	@Override
	public int insertMovieComment(String user_id, String content, int movie_no, int user_no) throws Exception {
		int result = 0;
		
		MovieComment input = new MovieComment();
		
		input.setContent(content);
		input.setUserid(user_id);
		input.setMovie_no(movie_no);
		input.setUser_no(user_no);
	
		result = sqlSession.insert("MovieCommentMapper.insertComment", input);
		
		return result;
	}


	@Override
	public void deleteMovieComment(int movie_comment_no) throws Exception {
		
		MovieComment input = new MovieComment();
		input.setMovie_comment_no(movie_comment_no);
	
		sqlSession.delete("MovieCommentMapper.deleteComment", movie_comment_no);
	}


	@Override
	public String getMovieComment(int movie_no) {
		
		MovieComment input = new MovieComment();
		input.setMovie_no(movie_no);
		String result = sqlSession.selectOne("MovieCommentMapper.getCommentName", input);

		return result;
	}


}
