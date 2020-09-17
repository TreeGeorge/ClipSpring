package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.CategorySorted;
import study.spring.clip.model.HomeMovieSlider;
import study.spring.clip.model.MovieInfoSlider;
import study.spring.clip.service.MovieInfoSliderService;

@Slf4j
@Service
public class MovieInfoSliderServiceImpl implements MovieInfoSliderService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MovieInfoSlider> getMovieInfoSliderActor(String name) {
		
		MovieInfoSlider input = new MovieInfoSlider();
		input.setName(name);
		List<MovieInfoSlider> result = sqlSession.selectList("MovieInfoSliderMapper.ActorMovieInfoSlider", input);

		return result;
	}

	@Override
	public List<MovieInfoSlider> getMovieInfoSliderJangre(int category_type_no) {
		
		MovieInfoSlider input = new MovieInfoSlider();
		input.setCategory_type_no(category_type_no);
		List<MovieInfoSlider> result = sqlSession.selectList("MovieInfoSliderMapper.JangreMovieInfoSlider", input);

		return result;
	}


}
