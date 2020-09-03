package study.spring.clip.service;

import study.spring.clip.model.MovieCategoryJoin;

public interface MovieCategoryJoinService {
	/**
	 * 여러가지 장르 중 한개 영화 조회
	 * */
	public MovieCategoryJoin getMovieCategoryJoinItem(MovieCategoryJoin input) throws Exception;
}
