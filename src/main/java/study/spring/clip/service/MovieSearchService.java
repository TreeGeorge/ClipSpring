package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.MovieSearch;

public interface MovieSearchService {

	/**
	 * 배우 이름 조회
	 * */
	public List<MovieSearch> getMovieSearchActor(String actor);
	
	/**
	 * 영화 제목 조회
	 * */
	public List<MovieSearch> getMovieSearchTitle(String title);
	
	/**
	 * 감독 이름 조회
	 * */
	public List<MovieSearch> getMovieSearchDirector(String director);
	
}
