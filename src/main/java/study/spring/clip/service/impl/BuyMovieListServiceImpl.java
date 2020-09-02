package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.BuyMovieList;
import study.spring.clip.service.BuyMovieListService;

@Slf4j
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

	@Override
	public int deleteBuyMovieList(BuyMovieList input) throws Exception {
		int result = 0;
		
		sqlSession.update("BuyMovieListMapper.userCoinEdit", input);
		
		try {
			result = sqlSession.delete("BuyMovieListMapper.deleteItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		
		return result;
	}

}
