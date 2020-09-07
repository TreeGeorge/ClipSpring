package study.spring.clip.service.impl;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.Interest;
import study.spring.clip.service.InterestService;
@Service
@Slf4j
public class InterestServiceImpl implements InterestService {

	@Autowired
	SqlSession sqlSession;
	@Override
	public List<Interest> getInterestList(int x) {
		
		List<Interest> result = sqlSession.selectList("InterestMapper.interestList",x);
		
		return result;
	}
	@Override
	public List<Interest> getrecentList(int x) {
List<Interest> result = sqlSession.selectList("InterestMapper.resentList",x);
		
		return result;
	}
	@Override
	public List<Interest> getrrowpriceList(int x) {
List<Interest> result = sqlSession.selectList("InterestMapper.rowpriceList",x);
		
		return result;
	}
	@Override
	public List<Interest> gethighpriceList(int x) {
List<Interest> result = sqlSession.selectList("InterestMapper.highpriceList",x);
		
		return result;
	}
	@Override
	public int insertInterest(Interest input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("InterestMapper.interestInsert",input);
			
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
	public int deleteInterest(Interest input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("InterestMapper.interestDelete",input);
			
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
	public boolean checkInterest(Interest input) {
		if(sqlSession.selectOne("InterestMapper.interestInsertCheck",input)!=null){
			return true;
		}
			
		return false;
	}

}
