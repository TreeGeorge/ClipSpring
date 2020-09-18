package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.Temp;

public interface TempService {
	
	public List<Temp> getAllMovie();
	
	public List<Temp> getSaleMovie();
	
	public List<Temp> getNewMovie();
	
	public boolean searchActor(Temp input);
	
	public void insertActor(Temp input);
	
	public int getActorNo(Temp input);
	
	public void connectActor(Temp input);
	
	public void connectCategory(Temp input);
	
	public void deleteSaleCategory();
	
	public void connectSaleCategory(Temp input);
	
	public void connectNewCategory(Temp input);

}
