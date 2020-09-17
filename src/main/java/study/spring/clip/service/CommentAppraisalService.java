package study.spring.clip.service;

import study.spring.clip.model.CommentAppraisal;

public interface CommentAppraisalService{
	
	/**
	 * 
	 * 조회
	 * */
	public void CommentAppraisal(int user_no, int movie_comment_no, String answer);
	
	/**
	 * 좋아요 & 싫어요
	 * */
	public int getlikeComment(CommentAppraisal input);
	
}