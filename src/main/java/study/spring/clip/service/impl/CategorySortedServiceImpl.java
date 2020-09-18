package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.CategorySorted;
import study.spring.clip.service.CategorySortedService;

@Service
public class CategorySortedServiceImpl implements CategorySortedService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int getTotalCount(int category_type_no) {
		
		int result = sqlSession.selectOne("CategorySortedMapper.total", category_type_no);
		return result;
	}

	@Override
	public String getCategoryName(int category_type_no) {
		String result = sqlSession.selectOne("CategorySortedMapper.getCategoryName", category_type_no);

		return result;
	}

	@Override
	public List<CategorySorted> getMovieInfoGenreList(int category_type_no) {
		CategorySorted input = new CategorySorted();
		input.setCategory_type_no(category_type_no);
		List<CategorySorted> result = sqlSession.selectList("CategorySortedMapper.movieInfoGenre", input);
		return result;
	}

	@Override
	public List<CategorySorted> getMovieInfoRecommendList() {
		List<CategorySorted> result = sqlSession.selectList("CategorySortedMapper.movieInfoRecommend");
		return result;
	}

	@Override
	public List<CategorySorted> getMovieInfoSaleList() {
		List<CategorySorted> result = sqlSession.selectList("CategorySortedMapper.movieInfoSale");
		return result;
	}

	@Override
	public List<CategorySorted> getrecentList(int category_type_no, int option, int stack) {
		CategorySorted input = new CategorySorted();
		input.setCategory_type_no(category_type_no);
		int limit;
		if(stack == 0) {limit = 0;}
		else{limit = stack * 15;}
		input.setLimit(limit);
		//stack * 15 - 1 , 15;
		List<CategorySorted> result = null;
		if(option==1) {
			result = sqlSession.selectList("CategorySortedMapper.resentList", input);
		}else if(option ==2)
			result = sqlSession.selectList("CategorySortedMapper.highpriceList", input);
		else if(option==3) {
			 result = sqlSession.selectList("CategorySortedMapper.lowpriceList", input);
		}else if(option==4){
			result = sqlSession.selectList("CategorySortedMapper.nameList", input);
		}
		
		return result;
	}
	
	

	

}
