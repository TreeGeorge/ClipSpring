package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.BuyMovieList;
import study.spring.clip.service.BuyMovieListService;

@Service
public class BuyMovieListServiceImpl implements BuyMovieListService {
	
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<BuyMovieList> getBuyMovieList(int user_no) {
		
		List<BuyMovieList> result = sqlSession.selectList("BuyMovieListMapper.buyList", user_no);
		
		return result;
	}

}
