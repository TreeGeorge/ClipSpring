package study.spring.clip.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import study.spring.clip.model.StarRating;
import study.spring.clip.service.StarRatingService;
@Service

public class StarRatingServiceImpl implements StarRatingService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public double insertStar(StarRating input){
		double result = 0;

			result = sqlSession.insert("StarRatingMapper.starInsert",input);

		return result;
	}

	@Override
	public boolean checkStar(StarRating input) {
		if(sqlSession.selectOne("StarRatingMapper.starCheck",input)!=null){
			return true;
		}
			
		return false;
	}

}


