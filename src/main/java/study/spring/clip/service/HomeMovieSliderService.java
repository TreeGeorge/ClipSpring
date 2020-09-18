package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.HomeMovieSlider;

public interface HomeMovieSliderService {
	
	/**
	 * 액션 영화 슬라이더 조회
	 * */
	public List<HomeMovieSlider> getJangreMovieSliderList(String name);
	
	// 마동석 영화 슬라이더
	public List<HomeMovieSlider> getMarvelySlider();
	
	// 해리포터 영화 슬라이더
	public List<HomeMovieSlider> getHarryPotterSlider();
	
}

