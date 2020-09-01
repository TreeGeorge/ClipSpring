package study.spring.clip.service;

import study.spring.clip.model.Top100Slider;

public interface Top100SliderService {
	/**
	 * 여러가지 장르 중 한개 영화 조회
	 * */
	public Top100Slider getTop100SliderItem(Top100Slider input) throws Exception;
}
