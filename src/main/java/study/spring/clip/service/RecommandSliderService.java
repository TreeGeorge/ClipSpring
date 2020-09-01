package study.spring.clip.service;

import study.spring.clip.model.RecommandSlider;

public interface RecommandSliderService {
	/**
	 * 추천영화 조회
	 * */
	public RecommandSlider getRecommandSliderItem(RecommandSlider input) throws Exception;
}
