package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.CategorySorted;
import study.spring.clip.model.HomeMovieSlider;
import study.spring.clip.service.HomeMovieSliderService;

@Slf4j
@Service
public class HomeMovieSliderServiceImpl implements HomeMovieSliderService {

	@Autowired
	SqlSession sqlSession;
	
	// 추천영화
	@Override
	public List<HomeMovieSlider> getHomeMovieSliderList() {

		List<HomeMovieSlider> result = sqlSession.selectList("HomeMovieSliderMapper.RecommandHomeMovieSlider");
		return result;
		}
	
	// 장르영화 ( 액션, 코디디 등등 ) 
	@Override
	public List<HomeMovieSlider> getJangreMovieSliderList(String name) {
		
		HomeMovieSlider input = new HomeMovieSlider();
		input.setName(name);
		List<HomeMovieSlider> result = sqlSession.selectList("HomeMovieSliderMapper.JangreMovieSlider",input);
		return result;
	}

	// 할인영화
	@Override
	public List<HomeMovieSlider> getSaleMovieSliderList(String name) {
		HomeMovieSlider input = new HomeMovieSlider();
		input.setName(name);
		List<HomeMovieSlider> result = sqlSession.selectList("HomeMovieSliderMapper.SaleMovieSlider",input);
		return result;
	}
	


}
