package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.UserCoupon;

public interface UserCouponService {
	
	public List<UserCoupon> getUserCouponList(int user_no);
	
	public void deleteUserCouponList();
	
	public UserCoupon getCouponInfo(int coupon_no);
	
	public int addUserCouponList(UserCoupon input) throws Exception;
	
	public boolean checkCouponList(UserCoupon input);
	// movie buy 컨트롤러에서 써야됨.. 값 받아와서...
	public void useCoupon(UserCoupon input);
	
	public int searchCoupon(String name);
	
}
