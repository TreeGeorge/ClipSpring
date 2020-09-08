package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.UserCoupon;

public interface UserCouponService {
	
	public List<UserCoupon> getUserCouponList(int user_no);
	
	public List<UserCoupon> getUnusedCouponList(int user_no);
	
	public void deleteUserCouponList();
	
	public UserCoupon getCouponInfo(int coupon_no);
	
	public int addUserCouponList(UserCoupon input) throws Exception;
	
	public boolean checkCouponList(UserCoupon input);
	
	public boolean checkUseCoupon(UserCoupon input);
	
	public void useCoupon(UserCoupon input);
	
}
