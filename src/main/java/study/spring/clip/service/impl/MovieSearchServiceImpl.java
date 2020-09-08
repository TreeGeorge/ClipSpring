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
	public List<MovieSearch> getMovieSearchActor(String actor) {
		MovieSearch input = new MovieSearch();
		input.setName(actor);

		List<MovieSearch> result = sqlSession.selectList("MovieSearchMapper.twoMovieSearch",input);
		
		return result;
	}

	@Override
	public List<MovieSearch> getMovieSearchTitle(String title) {
		MovieSearch input = new MovieSearch();
		input.setName(title);

		List<MovieSearch> result = sqlSession.selectList("MovieSearchMapper.threeMovieSearch",input);
		
		return result;
	}

	@Override
	public List<MovieSearch> getMovieSearchDirector(String director) {
		MovieSearch input = new MovieSearch();
		input.setDirector(director);

		List<MovieSearch> result = sqlSession.selectList("MovieSearchMapper.threeMovieSearch",input);
		
		return result;
	}

	
}
