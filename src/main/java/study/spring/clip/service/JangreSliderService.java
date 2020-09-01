package study.spring.clip.service;

import study.spring.clip.model.JangreSlider;

public interface JangreSliderService {
	/**
	 * 여러가지 장르 중 한개 영화 조회
	 * */
	public JangreSlider getJangreSliderItem(JangreSlider input) throws Exception;
}
