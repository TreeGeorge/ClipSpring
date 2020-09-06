package study.spring.clip.service;

import study.spring.clip.model.MovieInfoSlider;

public interface MovieInfoSliderService {
	/**
	 * 액션 영화 슬라이더 조회
	 * */
	public MovieInfoSlider getMovieInfoSliderItem(MovieInfoSlider input) throws Exception;
}
