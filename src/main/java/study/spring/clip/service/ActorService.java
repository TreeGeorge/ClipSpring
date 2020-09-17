package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.Actor;

public interface ActorService {
	
	//배우정보가져오기
	public List<Actor> getActor(int movie_no);
	
	public List<Actor> getInterestActor(int movie_no);
} 
