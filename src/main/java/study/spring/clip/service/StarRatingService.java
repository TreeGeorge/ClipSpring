package study.spring.clip.service;

import study.spring.clip.model.StarRating;

public interface StarRatingService {
	public double insertStar(StarRating input) throws Exception;
	
	public boolean checkStar(StarRating input);
}
