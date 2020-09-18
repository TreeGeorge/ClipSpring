package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.CategoryType;
import study.spring.clip.service.CategoryTypeService;

@Service
public class CategoryTypeServieImpl implements CategoryTypeService {

	@Autowired
	SqlSession sqlSession;

	// 장르별 타입 목록 조회
	@Override
	public List<CategoryType> getCategoryTypeListG(String type) {
		CategoryType input = new CategoryType();
		input.setType(type);
		List<CategoryType> result = sqlSession.selectList("CategoryTypeMapper.OneCategoryType",input);

		return result;
	}

	// 상품별 타입 목록 조회
	@Override
	public List<CategoryType> getCategoryTypeListP(String type) {
		CategoryType input = new CategoryType();
		input.setType(type);
		List<CategoryType> result = sqlSession.selectList("CategoryTypeMapper.ThreeCategoryType",input);
		
		return result;
	}
	
	// 메인 페이지 카테고리 타입 목록 조회
	@Override
	public List<CategoryType> getHomeCategoryType(String type) {
		CategoryType input = new CategoryType();
		input.setType(type);
		List<CategoryType> result = sqlSession.selectList("CategoryTypeMapper.HomeCategoryType",input);

		return result;
	}

	// 메인 페이지 카테고리 타입 목록  더보기 조회
	@Override
	public List<CategoryType> getHomeCategoryTypePlus(String type) {
		CategoryType input = new CategoryType();
		input.setType(type);
		List<CategoryType> result = sqlSession.selectList("CategoryTypeMapper.HomeCategoryTypePlus",input);

		return result;
	}



}
