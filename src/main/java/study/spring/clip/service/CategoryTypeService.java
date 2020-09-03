package study.spring.clip.service;

import study.spring.clip.model.CategoryType;

public interface CategoryTypeService{
	/**
	 * 카테고리 목록 조회
	 * */
	public CategoryType getCategoryTypeItem(CategoryType input) throws Exception;
}
