package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.MovieSearch;

public interface MovieSearchService {

	/**
	 * 검색
	 * */
	public List<MovieSearch> getMovieSearch(String name);
		
}
