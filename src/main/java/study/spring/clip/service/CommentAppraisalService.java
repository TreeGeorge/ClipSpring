package study.spring.clip.service;

import study.spring.clip.model.CommentAppraisal;

public interface CommentAppraisalService{
	/**
	 * 
	 * 좋아요 싫어요 조회
	 * */
	public CommentAppraisal getCommentAppraisalItem(CommentAppraisal input) throws Exception;
}