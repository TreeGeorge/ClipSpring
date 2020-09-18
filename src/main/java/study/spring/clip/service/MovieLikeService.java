package study.spring.clip.service;

import study.spring.clip.model.MovieLike;

public interface MovieLikeService {
	// 영화 좋아요 삽입
	public int insertMovieLike(MovieLike input) throws Exception;
	// 영화 좋아요 삭제
	public int deleteMovieLike(MovieLike input) throws Exception;
	// 영화 좋아요 중복검사
	public boolean checkMovieLike(MovieLike input);
}
