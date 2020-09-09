package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.CategorySorted;
import study.spring.clip.model.Interest;

public interface CategorySortedService {
	/**
	 * 여러가지 장르 중 한개 영화 조회
	 */
	public List<CategorySorted> getCategorySorted(int category_type_no);

	/**
	 * 총 영화 갯수
	 */
	public int getTotalCount(int category_type_no);
	
	public String getCategoryName(int category_type_no);

	public List<CategorySorted> getrecentList(int category_type_no);

	public List<CategorySorted> getrowpriceList(int category_type_no);

	public List<CategorySorted> gethighpriceList(int category_type_no);

}
