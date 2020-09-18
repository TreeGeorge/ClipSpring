package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.WishList;



public interface WishListService {
	// 장바구니 불러오기
	public List<WishList> getWishListList(int x);
	// 장바구니 삽입
	public int insertWishList(WishList input);
	// 장바구니 삭제
	public int deleteWishList(WishList input);
	// 장바구니 중복검사
	public boolean checkWishList(WishList input);
}
