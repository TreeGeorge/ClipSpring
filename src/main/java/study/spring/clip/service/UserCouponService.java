package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.UserCoupon;

public interface UserCouponService {
	// MY coupon
	public List<UserCoupon> getUserCouponList(int user_no);
	// 스케쥴러
	public void deleteUserCouponList();
	// index
	public UserCoupon getCouponInfo(int coupon_no);
	// index post
	public int addUserCouponList(UserCoupon input) throws Exception;
	// addUserCouponList 안에서 체크해서 중복되면 return 0 --> 컨트롤러,,
	public boolean checkCouponList(UserCoupon input);
	// 이거 Movie buy 컨트롤러에서 use_coupon.do 메서드 만들어서 사용해야함
	public void useCoupon(UserCoupon input);
	
	public int searchCoupon(String name);
	
}
