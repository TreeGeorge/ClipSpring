package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.CategorySorted;

public interface CategorySortedService {
	/**
	 * 여러가지 장르 중 한개 영화 조회
	 */
	public List<CategorySorted> getCategorySorted(int category_type_no);

	/**
	 * 총 영화 갯수
	 */
	public int getTotalCount(int category_type_no);
	/**
	 * 카테고리 타이틀
	 * */
	public String getCategoryName(int category_type_no);
	
	/**
	 * 최신순 정렬
	 * */
	public List<CategorySorted> getrecentList(int category_type_no);
	/**
	 * 낮은 가격순 정렬
	 * */
	public List<CategorySorted> getrowpriceList(int category_type_no);
	/**
	 * 높은 가격순 정렬
	 * */
	public List<CategorySorted> gethighpriceList(int category_type_no);

}
