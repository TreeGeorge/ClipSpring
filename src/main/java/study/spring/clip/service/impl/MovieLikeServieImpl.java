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
	public int insertMovieLike(MovieLike input)  {
		int result = 0;
		
		
			result = sqlSession.insert("MovieLikeMapper.insertLike",input);
			
		
		return result;
	}

	@Override
	public int deleteMovieLike(MovieLike input)  {
		int result = 0;
		
		
			result = sqlSession.delete("MovieLikeMapper.deleteLike",input);
		
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
