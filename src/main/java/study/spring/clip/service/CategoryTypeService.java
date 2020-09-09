package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.CategoryType;

public interface CategoryTypeService{
	
	/**
	 * 장르별 카테고리 목록 조회
	 * */
	public List<CategoryType> getCategoryTypeListG(String type);
		
	/**
	 * 브랜드별 카테고리 목록 조회
	 * */
	public List<CategoryType> getCategoryTypeListB(String type);
	
	/**
	 * 상품별 카테고리 목록 조회
	 * */
	public List<CategoryType> getCategoryTypeListP(String type);
	
	
	/**
	 * 홈 카테고리 목록 조회
	 * */
	public List<CategoryType> getHomeCategoryType(String type);

	/**
	 * 홈 카테고리 목록 조회 더보기
	 * */
	public List<CategoryType> getHomeCategoryTypePlus(String type);
}
