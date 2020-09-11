package study.spring.clip.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.service.BuyMovieListService;
import study.spring.clip.service.FreeMovieService;
import study.spring.clip.service.Top100Service;
import study.spring.clip.service.UserCouponService;

@Slf4j
@Controller
public class FreeMovieScheduler {
	
	@Autowired
	FreeMovieService freeMovieService;
	
	@Autowired
	UserCouponService userCouponService;
	
	@Autowired
	BuyMovieListService buyMovieListService;
	
	@Autowired
	Top100Service top100service;
	
	public void everyMidnightEndRental() {
		buyMovieListService.rentalEnd();
		log.debug("기간이 지난 대여상품 삭제 완료!");
	}
	
	public void everyMidnightCoupon() {
		userCouponService.deleteUserCouponList();
		log.debug("기간이 지난 쿠폰 삭제 완료!");
	}
	
	public void everyMonth() {
		freeMovieService.resetSale();
		log.debug("세일영화 리셋 완료!");
	}
	
	public void everyMidnight() {
		freeMovieService.endFreeMovie();
		freeMovieService.editFreeMovie();
		freeMovieService.editSaleMovie();
		log.debug("무료영화 + 세일영화 업데이트 완료!");
		top100service.insertDummyData();
		top100service.deleteCount();
		log.debug("top100용 더미데이터 생성 완료! + 기간이 지난 상품 삭제 완료!");
	}

}
