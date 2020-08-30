package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.FreeMovie;

public interface FreeMovieService {

	public List<FreeMovie> getFreeMovieList();
	
	public int getFreeMovieCount();
	
	public void editFreeMovie();
	
	public void endFreeMovie();
	
}
