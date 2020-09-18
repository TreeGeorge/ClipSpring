package study.spring.clip.service.impl;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.Movie;
import study.spring.clip.service.MovieService;


@Service
public class MovieServiceImpl implements MovieService {
	
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Movie getMovieItem(Movie input){
		Movie result = sqlSession.selectOne("MovieMapper.oneMovie", input);
		return result;
	}

	@Override
	public int getMovieLike(Movie input1){
		int result = 0;
		
			result = sqlSession.selectOne("MovieMapper.likeMovie", input1);;

		return result;
	}

	@Override
	public double getMovieStar(Movie input2){
		double result = 0;	

			result = sqlSession.selectOne("MovieMapper.starMovie", input2);

		return result;
	}

	@Override
	public int getMoviePeople(Movie input3){
		int result = 0;
		
			result = sqlSession.selectOne("MovieMapper.peopleMovie", input3);

		return result;
	}

	@Override
	public int getinterestCommit(Movie input4){
		int result = 0;
	
			result = sqlSession.selectOne("MovieMapper.interestCommit", input4);
					
		return result;
	}

	@Override
	public int getlikeCommit(Movie input5) {
		int result = 0;
		
		result = sqlSession.selectOne("MovieMapper.likeCommit", input5);
				
	return result;
	}

	@Override
	public String recentLike(int movie_no) {
		Movie input = new Movie();
		input.setMovie_no(movie_no);
		String item = sqlSession.selectOne("StarRatingMapper.likeRecent",input);
		return item;
	}
	
	// 영화 검색 리스트 가져오기
	@Override
	public List<Movie> getSearchMovieList(String name) {
		Movie input = new Movie();
		input.setName(name);
		List<Movie> result = sqlSession.selectList("MovieMapper.searchMovieList",input);
		return result;
	}

	@Override
	public List<Movie> getActor(int movie_no) {
		List<Movie> result = sqlSession.selectList("MovieMapper.actorMovie", movie_no);
		return result;
	}

}
