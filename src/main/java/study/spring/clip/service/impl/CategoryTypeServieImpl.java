package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.CategoryType;
import study.spring.clip.model.HomeMovieSlider;
import study.spring.clip.service.CategoryTypeService;

@Slf4j
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


}
