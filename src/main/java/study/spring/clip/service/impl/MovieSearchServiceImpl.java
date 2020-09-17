package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.HomeMovieSlider;
import study.spring.clip.model.MovieSearch;
import study.spring.clip.service.MovieSearchService;

@Slf4j
@Service
public class MovieSearchServiceImpl implements MovieSearchService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MovieSearch> getMovieSearch(String name) {
		MovieSearch input = new MovieSearch();
		input.setDirector(name);
		input.setName(name);
		List<MovieSearch> result = sqlSession.selectList("MovieSearchMapper.oneMovieSearch",input);
		return result;
	}
	
}
