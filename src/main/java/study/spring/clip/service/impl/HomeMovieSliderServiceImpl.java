package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.HomeMovieSlider;
import study.spring.clip.service.HomeMovieSliderService;

@Slf4j
@Service
public class HomeMovieSliderServiceImpl implements HomeMovieSliderService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<HomeMovieSlider> getHomeMovieSliderList() {

		List<HomeMovieSlider> result = sqlSession.selectList("HomeMovieSliderMapper.RecommandHomeMovieSlider");
		return result;
		}

	@Override
	public List<HomeMovieSlider> getJangreMovieSliderList(String category_type) {
		List<HomeMovieSlider> result = sqlSession.selectList("HomeMovieSliderMapper.JangreMovieSlider");
		return result;
	}





	




}
