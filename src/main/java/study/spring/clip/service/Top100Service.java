package study.spring.clip.service;

import java.util.List;

import study.spring.clip.model.Top100;

public interface Top100Service {
	public List<Top100> dailyRanking();
	public List<Integer> dailyRankChange();
	public List<Top100> weeklyRanking();
	public List<Integer> weeklyRankChange();
	public void deleteCount();
	public void insertDummyData();
}
