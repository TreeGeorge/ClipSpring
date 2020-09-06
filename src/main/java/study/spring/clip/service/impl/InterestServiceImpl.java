package study.spring.clip.service.impl;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.Interest;
import study.spring.clip.service.InterestService;
@Service
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

}
