package study.spring.clip.service;

import study.spring.clip.model.MovieSearch;

public interface MovieSearchService {
	/**
	 * 영화 검색 조회
	 */
	public MovieSearch getMovieSearchItem(MovieSearch input) throws Exception;
}
