package study.spring.clip.service;

import study.spring.clip.model.StarRating;

public interface StarRatingService {
	// 별점 삽입
	public double insertStar(StarRating input);
	// 별점 중복검사
	public boolean checkStar(StarRating input);
}
