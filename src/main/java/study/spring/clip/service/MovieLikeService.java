package study.spring.clip.service;

import study.spring.clip.model.MovieLike;

public interface MovieLikeService {
	
	public int insertMovieLike(MovieLike input) throws Exception;
	
	public int deleteMovieLike(MovieLike input) throws Exception;
	
	public boolean checkMovieLike(MovieLike input);
}
