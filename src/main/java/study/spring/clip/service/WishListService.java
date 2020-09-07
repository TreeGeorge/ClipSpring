package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.WishList;



public interface WishListService {

	public List<WishList> getWishListList(int x);
	
	public int insertWishList(WishList input) throws Exception;
	
	public int deleteWishList(WishList input) throws Exception;
	
	public boolean checkWishList(WishList input);
}
