package study.spring.clip.service;

import java.util.List;


import study.spring.clip.model.Interest;



public interface InterestService {

	public List<Interest> getInterestList(int x);
	
	public List<Interest> getrecentList(int x);
	
	public List<Interest> getrrowpriceList(int x);
	
	public List<Interest> gethighpriceList(int x);
	
	public List<Interest> getnameList(int x);
	
	public int insertInterest(Interest input);
	
	public int deleteInterest(Interest input);
	
	public boolean checkInterest(Interest input);
}
