package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.BuyCoinList;
import study.spring.clip.service.BuyCoinListService;

@Slf4j
@Service
public class BuyCoinListServiceImpl implements BuyCoinListService {
	
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	/** 코인 구매 리스트 조회 */
	@Override
	public List<BuyCoinList> getBuyCoinList(int user_no) {
		
		List<BuyCoinList> result = sqlSession.selectList("BuyCoinListMapper.buyList", user_no);
		
		return result;
	}

	/** 코인 환불(삭제) 및 유저 코인 변경 */
	@Override
	public int deleteBuyCoinList(BuyCoinList input) throws Exception {
		int result = 0;
		
		sqlSession.update("BuyCoinListMapper.userCoinDelete", input);
		
		try {
			result = sqlSession.delete("BuyCoinListMapper.deleteItem", input);
			
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
	
	/** 코인 구매 및 유저 코인 변경 */
	@Override
	public int addBuyCoinList(BuyCoinList input) throws Exception {
		int result = 0;
		
		sqlSession.update("BuyCoinListMapper.userCoinAdd", input);
		
		try {
			result = sqlSession.insert("BuyCoinListMapper.insertItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
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

	/** 구매정보 db값 확인 */
	@Override
	public boolean checkCoinList(BuyCoinList input) {
		if (sqlSession.selectOne("BuyCoinListMapper.checkList", input) == null) {
			return true;
		}
		return false;
	}

	/** 구매 한지 일주일 지났는지 비교 */
	@Override
	public boolean checkDate(BuyCoinList input) {
		if (sqlSession.selectOne("BuyCoinListMapper.dateCheck", input) != null) {
			return true;
		}
		return false;
	}

	@Override
	public boolean checkCoin(BuyCoinList input) {
		
		int result = sqlSession.selectOne("BuyCoinListMapper.coinCheck", input);
		
		if ( result < 0 ) {
			return true;
		}
		return false;
	}

}
