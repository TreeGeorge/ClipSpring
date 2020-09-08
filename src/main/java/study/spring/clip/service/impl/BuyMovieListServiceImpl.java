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

	/** 영화 구매 리스트 조회 */
	@Override
	public List<BuyMovieList> getBuyMovieList(int user_no) {
		
		List<BuyMovieList> result = sqlSession.selectList("BuyMovieListMapper.buyList", user_no);
		
		return result;
	}

	/** 영화 환불(삭제) 및 유저 코인 변경 */
	@Override
	public int deleteBuyMovieList(BuyMovieList input) throws Exception {
		int result = 0;
		
		sqlSession.update("BuyMovieListMapper.userMovieDelete", input);
		
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

	/** 시청 유무 확인 */
	@Override
	public boolean checkWatched(BuyMovieList input) {
		if (sqlSession.selectOne("BuyMovieListMapper.checkWatched", input) == null) {
			return true;
		}
		return false;
	}

	// 일주일 지났는지 확인
	@Override
	public boolean checkDate(BuyMovieList input) {
		if (sqlSession.selectOne("BuyMovieListMapper.dateCheck", input) != null) {
			return true;
		}
		return false;
	}

	// 영상 삭제, 복원시
	@Override
	public void changeStatus(BuyMovieList input) {
		if (input.getIs_delete().equals("N")) {
			sqlSession.update("BuyMovieListMapper.goRemove", input);
		} else {
			sqlSession.update("BuyMovieListMapper.restoreMovie", input);
		}
	}

	// 실제 db값과 가져온 값 확인작업
	@Override
	public BuyMovieList checkBuyMovieList(BuyMovieList input) {
		BuyMovieList result = sqlSession.selectOne("BuyMovieListMapper.checkList", input);
		return result;
	}
	
	// 영상 시청시
	@Override
	public void watchMovie(int buy_movie_list_no) {
		sqlSession.selectOne("BuyMovieListMapper.watchMovie", buy_movie_list_no);
	}

	// 대여 기간이 끝났을때
	@Override
	public void rentalEnd() {
		sqlSession.update("BuyMovieListMapper.userMovieEnd");
	}

	// 이미 구매한 제품이라면
	@Override
	public boolean duplicateCheck(BuyMovieList input) {
		// 이미 구매 했다면
		if (sqlSession.selectOne("BuyMovieListMapper.duplicateCheck", input) != null) {
			return true;
		}
		// 기간이 지났거나 구매하지 않은 상품인경우
		return false;
	}

}
