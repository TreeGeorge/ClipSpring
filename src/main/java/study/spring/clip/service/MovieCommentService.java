package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.MovieComment;

public interface MovieCommentService{
	
	/**
	 * 댓글 조회
	 * */
	public List<MovieComment> MovieComment(MovieComment input) throws Exception;
	
	/**
	 * 댓글 추가
	 * */
	public int insertMovieComment(String user_id, String content, int movie_no, int user_no) throws Exception;
	
	/**
	 * 댓글 삭제
	 * */
	public void deleteMovieComment(int movie_comment_no) throws Exception;
	
	/**
	 * 댓글 영화 타이틀
	 * */
	public String getMovieComment(int movie_no);

	
}


