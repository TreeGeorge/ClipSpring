package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.BuyMovieList;

public interface BuyMovieListService {
	
	public List<BuyMovieList> getBuyMovieList(int user_no);

}
