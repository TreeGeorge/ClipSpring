package study.spring.clip.service;

import java.util.List;


import study.spring.clip.model.Interest;



public interface InterestService {
	// 관심영화 불러오기
	public List<Interest> getInterestList(int x);
	// 관심영화 개봉순 정렬(드롭박스)
	public List<Interest> getrecentList(int x);
	// 관심영화 낮은가격순 정렬(드롭박스)
	public List<Interest> getrrowpriceList(int x);
	// 관심영화 높은가격순 정렬(드롭박스)
	public List<Interest> gethighpriceList(int x);
	// 관심영화 제목순 정렬(드롭박스)
	public List<Interest> getnameList(int x);
	// 관심영화 추가하기
	public int insertInterest(Interest input);
	// 관심영화 삭제하기
	public int deleteInterest(Interest input);
	// 관심영화 중복검사
	public boolean checkInterest(Interest input);
}
