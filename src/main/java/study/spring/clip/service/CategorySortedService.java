package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.CategorySorted;

public interface CategorySortedService {
	/**
	 * 여러가지 장르 중 한개 영화 조회
	 * */
	public List<CategorySorted> getCategorySorted(int category_type_no);
	
	/**
	 * 총 영화 갯수
	 * */
	public int getTotalCount(int category_type_no);
}
