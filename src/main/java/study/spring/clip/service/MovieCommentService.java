package study.spring.clip.service;

import study.spring.clip.model.MovieComment;

public interface MovieCommentService{
	/**
	 * 
	 * 댓글 조회
	 * */
	public MovieComment getMovieCommentItem(MovieComment input) throws Exception;
	
	/**
	 * 
	 * 댓글 삭제
	 * */
	public int deleteMovieComment(MovieComment input) throws Exception;
	
	/**
	 * 댓글 추가
	 * */
	public int insertMovieComment(MovieComment input) throws Exception;
}

