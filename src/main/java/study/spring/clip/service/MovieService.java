package study.spring.clip.service;

import study.spring.clip.model.Movie;

public interface MovieService {
	/**
	 * 영화 데이터 상세 조회
	 */
	public Movie getMovieItem(Movie input);
	// 해당영화 좋아요개수
	public int getMovieLike(Movie input1) throws Exception;
	// 해당영화 평점 평균
	public double getMovieStar(Movie input2) throws Exception;
	// 해당영화 평점매긴사람수
	public int getMoviePeople(Movie input3) throws Exception;
	
	public int getinterestCommit(Movie input4);
	
	public int getlikeCommit(Movie input5);
}
