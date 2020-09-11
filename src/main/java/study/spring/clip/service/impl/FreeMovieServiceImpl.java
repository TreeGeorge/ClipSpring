package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.FreeMovie;
import study.spring.clip.service.FreeMovieService;

@Service
public class FreeMovieServiceImpl implements FreeMovieService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	// 무료영화 정보 가져오기
	@Override
	public List<FreeMovie> getFreeMovieList(){
		
		List<FreeMovie> result = sqlSession.selectList("FreeMovieMapper.freeList");
		
		return result;
	}
	
	// 무료영화 개수 가져오기
	@Override
	public int getFreeMovieCount(){
		
		int result = sqlSession.selectOne("FreeMovieMapper.selectCountFree");
		
		return result;
	}
	
	// 무료영화로 만들어주기
	@Override
	public void editFreeMovie() {
		// 무료영화 개수
		while (getFreeMovieCount() < 10) {

			FreeMovie input = new FreeMovie();
			
			// 무료가 아닌 영화 가져오기
			input = sqlSession.selectOne("FreeMovieMapper.notFreeMovieSearch");
			
			// 무료영화 기간은 mapper에서 (현재는 20일)
			sqlSession.update("FreeMovieMapper.setFreeEdit", input);
		}
	}

	// 무료영화 기간 종료시 가격 되돌리기
	@Override
	public void endFreeMovie() {	
		
		// 동시에 무료영화 기간이 끝날 수 있기 때문에
		while ( null != sqlSession.selectOne("FreeMovieMapper.endFreeMovieSearch") ) {
			int sale = 0;
			// 30% 확률로 세일하게 해줌
			if ((int)(Math.random() * 3) + 1 == 1) {
				sale = (int)(Math.random() * 55) + 5;
			}
			FreeMovie input = sqlSession.selectOne("FreeMovieMapper.endFreeMovieSearch");
			
			input.setSale(sale);
			sqlSession.update("FreeMovieMapper.endFreeEdit", input);
		}
		
	}
	
	// 세일중인 영화 개수 판별하기
	@Override
	public boolean saleMovieCount() {

		int sale = sqlSession.selectOne("FreeMovieMapper.selectCountSale");
		int all = sqlSession.selectOne("FreeMovieMapper.selectCountAll");
		
		if (sale == 0) {
			return true;
		}
		
		// 전체 영화의 1/3이 할인영화가 되도록 유지
		if (all/sale <= 3) {
			return false;
		}
		return true;
	}

	// 세일영화로 만들어주기
	@Override
	public void editSaleMovie() {
		FreeMovie input = new FreeMovie();
		
		while (saleMovieCount()) {
			input = sqlSession.selectOne("FreeMovieMapper.notSaleMovieSearch", input);
			sqlSession.update("FreeMovieMapper.setSaleEdit", input);
		}
	}

	// 세일영화 초기화
	@Override
	public void resetSale() {
		sqlSession.update("FreeMovieMapper.resetSale");
	}

}
