package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.CategoryType;

public interface CategoryTypeService{
	
	/**
	 * 장르별 카테고리 목록 조회
	 * */
	public List<CategoryType> getCategoryTypeListG();
	
	/**
	 * 브랜드별 카테고리 목록 조회
	 * */
	public List<CategoryType> getCategoryTypeListB();
}
