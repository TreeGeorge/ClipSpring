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
		//관심영화 불러오기
		List<Interest> result = sqlSession.selectList("InterestMapper.interestList",x);
		
		return result;
	}
	@Override
	public List<Interest> getrecentList(int x) {
		List<Interest> result = sqlSession.selectList("InterestMapper.resentList",x);
		//관심영화 페이지 개봉순 정렬
		return result;
	}
	@Override
	public List<Interest> getrrowpriceList(int x) {
		List<Interest> result = sqlSession.selectList("InterestMapper.rowpriceList",x);
		//관심영화 페이지 낮은가격순 정렬
		return result;
	}
	@Override
	public List<Interest> gethighpriceList(int x) {
		List<Interest> result = sqlSession.selectList("InterestMapper.highpriceList",x);
		//관심영화 페이지 높은 가격순 정렬
		return result;
	}
	@Override
	public List<Interest> getnameList(int x) {
		List<Interest> result = sqlSession.selectList("InterestMapper.nameList",x);
		//관심영화 페이지 이름순 정렬
		return result;
	}

	//관심영화 추가하기
	@Override
	public int insertInterest(Interest input){
		int result = 0;

			result = sqlSession.insert("InterestMapper.interestInsert",input);
			
		return result;
		
	}
	
	//관심영화 삭제하기
	@Override
	public int deleteInterest(Interest input){
		int result = 0;

			result = sqlSession.delete("InterestMapper.interestDelete",input);

		return result;
	}
	
	//관심영화 체크여부 확인(무비 인포페이지)
	@Override
	public boolean checkInterest(Interest input) {
		if(sqlSession.selectOne("InterestMapper.interestInsertCheck",input)!=null){
			return true;
		}
			
		return false;
	}
	
}
