package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.CategorySorted;

public interface CategorySortedService {
	
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
	public List<CategorySorted> getrecentList(int category_type_no, int option, int stack);
	
	// 무비 인포에서 해당 장르 영화 가져오기
	public List<CategorySorted> getMovieInfoGenreList(int category_type_no);
	// 무비 인포에 클립 추천영화 띄워주기
	public List<CategorySorted> getMovieInfoRecommendList();
	// 무비 인포에 할인 영화 띄워주기
	public List<CategorySorted> getMovieInfoSaleList();

}
