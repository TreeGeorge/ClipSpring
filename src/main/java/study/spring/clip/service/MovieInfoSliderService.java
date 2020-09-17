package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.MovieInfoSlider;

public interface MovieInfoSliderService {
	
	/**
	 * 출연진의 다른영화
	 */
	public List<MovieInfoSlider> getMovieInfoSliderActor(String name);
	
	/**
	 * 장르의 인기영화
	 */
	public List<MovieInfoSlider> getMovieInfoSliderJangre(int category_type_no);
}
