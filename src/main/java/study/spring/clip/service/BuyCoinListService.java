package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.BuyCoinList;
import study.spring.clip.model.User;

public interface BuyCoinListService {

	public List<BuyCoinList> getBuyCoinList(int user_no);
	
	public int deleteBuyCoinList(BuyCoinList input) throws Exception;
	
	public int addBuyCoinList(BuyCoinList input) throws Exception;
	
	public boolean checkCoinList(BuyCoinList input);
	
	public User getUserInfo(int user_no); 
	
}
