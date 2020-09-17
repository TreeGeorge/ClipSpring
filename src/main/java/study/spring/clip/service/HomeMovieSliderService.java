package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.HomeMovieSlider;

public interface HomeMovieSliderService {
	
	/**
	 * 홈 영화 추천  슬라이더 조회
	 * */
	public List<HomeMovieSlider> getHomeMovieSliderList();
	
	/**
	 * 액션 영화 슬라이더 조회
	 * */
	public List<HomeMovieSlider> getJangreMovieSliderList(String name);
	
	/**
	 * 할인 영화 슬라이더 조회
	 * */
	public List<HomeMovieSlider> getSaleMovieSliderList(String name);
	
}

