package study.spring.clip.service;

import study.spring.clip.model.Top100Slider;

public interface Top100SliderService {
	/**
	 * top100 영화 조회
	 * */
	public Top100Slider getTop100SliderItem(Top100Slider input) throws Exception;
}
