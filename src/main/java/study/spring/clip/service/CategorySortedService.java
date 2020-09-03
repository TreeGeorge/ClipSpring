package study.spring.clip.service;

import study.spring.clip.model.CategorySorted;

public interface CategorySortedService {
	/**
	 * 여러가지 장르 중 한개 영화 조회
	 * */
	public CategorySorted getMovieCategorySortedItem(CategorySorted input) throws Exception;
}
