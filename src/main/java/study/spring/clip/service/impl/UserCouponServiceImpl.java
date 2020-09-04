package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.UserCoupon;
import study.spring.clip.service.UserCouponService;

@Slf4j
@Service
public class UserCouponServiceImpl implements UserCouponService {
	
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	/** 보유 쿠폰 리스트 조회 */
	@Override
	public List<UserCoupon> getUserCouponList(int user_no) {
		
		List<UserCoupon> result = sqlSession.selectList("UserCouponMapper.couponList", user_no);
		
		return result;
	}

	/** 기간이 지난 쿠폰 자동 삭제 (24시간에 한번 실행되도록 구현) */
	@Override
	public void deleteUserCouponList() {
		
		// 유저의 쿠폰 목록 삭제 후 쿠폰 삭제 <-- 순서 매우 중요!
		sqlSession.delete("UserCouponMapper.deleteCouponList");
		sqlSession.delete("UserCouponMapper.deleteCoupon");
		
	}

	/** index 페이지에서 뿌려줄 쿠폰 선택 */
	@Override
	public UserCoupon getCouponInfo(int coupon_no) {
		UserCoupon result = sqlSession.selectOne("UserCouponMapper.selectCouponInfo", coupon_no);
		return result;
	}

	/** 쿠폰 발급 */
	@Override
	public int addUserCouponList(UserCoupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("UserCouponMapper.insertItem", input);
			
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

	/** 쿠폰 중복 발급 체크 */
	@Override
	public boolean checkCouponList(UserCoupon input) {
		// 보유중이라면
		if (sqlSession.selectOne("UserCouponMapper.duplicateCheck", input) != null) {
			return true;
		}
		// 보유중이지 않다면
		return false;
	}

	/** 쿠폰 사용 */
	@Override
	public void useCoupon(UserCoupon input) {
		sqlSession.update("UserCouponMapper.useCoupon", input);
	}

	/** 쿠폰 번호 찾기 */
	@Override
	public int searchCoupon(String name) {
		int result = sqlSession.selectOne("UserCouponMapper.searchCoupon", name);
		return result;
	}

}
