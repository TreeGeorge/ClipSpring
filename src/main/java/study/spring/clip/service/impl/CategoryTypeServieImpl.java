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

	@Override
	public List<CategoryType> getCategoryTypeListG(String type) {
		CategoryType input = new CategoryType();
		input.setType(type);
		List<CategoryType> result = sqlSession.selectList("CategoryTypeMapper.OneCategoryType",input);

		return result;
	}

	@Override
	public List<CategoryType> getCategoryTypeListB(String type) {
		CategoryType input = new CategoryType();
		input.setType(type);
		List<CategoryType> result = sqlSession.selectList("CategoryTypeMapper.TwoCategoryType",input);
		
		return result;
	}

	@Override
	public List<CategoryType> getCategoryTypeListP(String type) {
		CategoryType input = new CategoryType();
		input.setType(type);
		List<CategoryType> result = sqlSession.selectList("CategoryTypeMapper.ThreeCategoryType",input);
		
		return result;
	}
	
	@Override
	public List<CategoryType> getHomeCategoryType(String type) {
		CategoryType input = new CategoryType();
		input.setType(type);
		List<CategoryType> result = sqlSession.selectList("CategoryTypeMapper.HomeCategoryType",input);

		return result;
	}

	@Override
	public List<CategoryType> getHomeCategoryTypePlus(String type) {
		CategoryType input = new CategoryType();
		input.setType(type);
		List<CategoryType> result = sqlSession.selectList("CategoryTypeMapper.HomeCategoryTypePlus",input);

		return result;
	}



}
