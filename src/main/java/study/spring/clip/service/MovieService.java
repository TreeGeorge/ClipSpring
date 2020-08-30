package study.spring.clip.service;

import study.spring.clip.model.Movie;

public interface MovieService {
	/**
	 * 영화 데이터 상세 조회
	 */
	public Movie getMovieItem(Movie input) throws Exception;
}
