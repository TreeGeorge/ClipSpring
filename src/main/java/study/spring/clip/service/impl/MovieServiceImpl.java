package study.spring.clip.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.Movie;
import study.spring.clip.service.MovieService;

@Slf4j
@Service
public class MovieServiceImpl implements MovieService {
	
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Movie getMovieItem(Movie input) throws Exception {
		Movie result = null;
		
		try {
			result = sqlSession.selectOne("MovieMapper.oneMovie", input);
			
			if (result == null) {
				throw new NullPointerException("resut=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int getMovieLike(Movie input1) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("MovieMapper.likeMovie", input1);
			System.out.println("=========================================");
			System.out.println(result);
			if (result == 0) {
				throw new NullPointerException("resut=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public double getMovieStar(Movie input2) throws Exception {
		double result = 0;
		
		try {
			result = sqlSession.selectOne("MovieMapper.starMovie", input2);

			if (result == 0) {
				throw new NullPointerException("resut=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int getMoviePeople(Movie input3) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("MovieMapper.peopleMovie", input3);

			if (result == 0) {
				throw new NullPointerException("resut=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
