package study.spring.clip.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.MovieLike;
import study.spring.clip.service.MovieLikeService;
@Slf4j
@Controller
public class MovieLikeServieImpl implements MovieLikeService{

	@Autowired
	SqlSession sqlSession;
	@Override
	public int insertMovieLike(MovieLike input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("MovieLikeMapper.insertLike",input);
			
			if(result==0) {
				throw new NullPointerException("result=0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삽입된데이터가엄쪄");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삽입 실패");
		}
		
		return result;
	}

	@Override
	public int deleteMovieLike(MovieLike input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("MovieLikeMapper.deleteLike",input);
			
			if(result == 0) {
				throw new NullPointerException("result=0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된터가 엄쪄");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제실패");
		}
		return result;
	}

	@Override
	public boolean checkMovieLike(MovieLike input) {
		if(sqlSession.selectOne("MovieLikeMapper.likeCommit",input)!=null){
			return true;
		}
			
		return false;
	}

}
