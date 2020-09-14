package study.spring.clip.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.StarRating;
import study.spring.clip.service.StarRatingService;
@Service
@Slf4j
public class StarRatingServiceImpl implements StarRatingService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public double insertStar(StarRating input) throws Exception {
		double result = 0;
		
		try {
			result = sqlSession.insert("StarRatingMapper.starInsert",input);
			
			if(result==0) {
				throw new NullPointerException("result=0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삽입된데이터가엄쪄");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			System.out.println(input);
			throw new Exception("삽입 실패");
		}
		
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


