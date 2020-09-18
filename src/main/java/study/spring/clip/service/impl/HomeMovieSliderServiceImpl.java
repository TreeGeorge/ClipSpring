package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.HomeMovieSlider;
import study.spring.clip.service.HomeMovieSliderService;

@Service
public class HomeMovieSliderServiceImpl implements HomeMovieSliderService {

	@Autowired
	SqlSession sqlSession;
	
	// 장르영화 ( 액션, 코디디 등등 ) 
	@Override
	public List<HomeMovieSlider> getJangreMovieSliderList(String name) {
		
		HomeMovieSlider input = new HomeMovieSlider();
		input.setName(name);
		List<HomeMovieSlider> result = sqlSession.selectList("HomeMovieSliderMapper.jangreMovieSlider",input);
		return result;
	}

	// 마동석 출연 영화
	@Override
	public List<HomeMovieSlider> getMarvelySlider() {
		List<HomeMovieSlider> result = sqlSession.selectList("HomeMovieSliderMapper.marvelyMovieSlider");
		return result;
	}

	// 해리포터 시리즈
	@Override
	public List<HomeMovieSlider> getHarryPotterSlider() {
		List<HomeMovieSlider> result = sqlSession.selectList("HomeMovieSliderMapper.harryPotterMovieSlider");
		return result;
	}


	


}
