package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.BuyMovieList;

public interface BuyMovieListService {
	
	public List<BuyMovieList> getBuyNewMovieList(int user_no);
	
	public List<BuyMovieList> getBuyNameMovieList(int user_no);
	
	public int deleteBuyMovieList(BuyMovieList input) throws Exception;
	
	public BuyMovieList checkBuyMovieList(BuyMovieList input);
	
	public boolean checkWatched(BuyMovieList input);
	
	public boolean checkDate(BuyMovieList input);
	
	public boolean checkUsedCoupon(BuyMovieList input);
	
	public boolean duplicateCheck(BuyMovieList input);
	
	public void changeStatus(BuyMovieList input);
	
	public void watchMovie(int buy_movie_list_no);
	
	public void rentalEnd();
	
	public void editUserCoin(BuyMovieList input);
	
	public void couponUsed(BuyMovieList input);
	
	public void addBuyMovieList(BuyMovieList input);

}
