package study.spring.clip.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.Top100;
import study.spring.clip.service.Top100Service;

@Service
public class Top100ServiceImpl implements Top100Service {
	
	@Autowired
	SqlSession sqlSession;
	
	/*top100 일간 주간에 대한 데이터가 db에 물리적으로 존재하는게 아니므로 유저가 해당 페이지에 진입할때
	로직을 실행해 정렬된 화면을 볼 수 있도록 구현함*/
	
	/*일간 TOP100 영화 리스트*/
	public List<Top100> dailyRanking() {
		
		List<Top100> result = sqlSession.selectList("Top100Mapper.sortedYesterdayList");
		
		return result;
	}
	
	/*일간 순위 변동 수치 저장하는 배열*/
	public List<Integer> dailyRankChange(){

		/*일간 top100의 순위 변동 수치는 2일전과 1일전의 데이터를 비교하여 데이터를 출력하게된다
		 * ex) 1월 3일에 유저가 보게되는 순위변동 수치는 1월1일과 1월2일의 비교값이 된다.*/
		List<Top100> oldItem = sqlSession.selectList("Top100Mapper.sortedTwoDaysAgoList");
		List<Top100> newItem = sqlSession.selectList("Top100Mapper.sortedYesterdayList");
		
		List<Integer> rank = new ArrayList<>();
		
		/**
		 * newItem(하루전 순위 리스트)을 oldItem(이틀전 순위 리스트)에서 검색하여
		 * 일치하는 값이 존재한다면 해당  -> 이틀전 순위 - 어제 순위 = 순위 변동값
		 * 일치하는 값이 없다면 어제자 Top100리스트에 포함되지 않는 것이므로 새롭게 순위권에 진입했다는 new문자 표시
		 */
		for ( int i = 0 ; i < newItem.size() ; i ++ ) {
			boolean is = false;
			for ( int j = 0 ; j < oldItem.size() ; j++ ) {
				// 동일한 데이터 조회되면 순위 변동값 저장
				if ( newItem.get(i).getMovie_no() == oldItem.get(j).getMovie_no() ) {
					// 이틀전 순위 - 어제 순위 = 순위 변동값
					rank.add( j - i );
					is = true;
				}
			}
			// 동일한 데이터가 조회되지 않으면 new 아이템
			if (!is) {
				rank.add(999);
			}
		}
		
		return rank;
	}

	/*주간 TOP100 영화 리스트*/
	@Override
	public List<Top100> weeklyRanking() {
		
		List<Top100> result = sqlSession.selectList("Top100Mapper.sortedLastWeekList");
		
		return result;
	}

	/*주간 순위 변동 수치 저장하는 배열*/
	@Override
	public List<Integer> weeklyRankChange() {

		/*주간 top100의 순위 변동 수치는 2주전과 1주전의 데이터를 비교하여 데이터를 출력하게된다
		 * ex) 지난주 일요일부터 토요일까지와 지지난주 일요일부터 토요일까지.*/
		List<Top100> oldItem = sqlSession.selectList("Top100Mapper.sortedTwoWeeksAgoList");
		List<Top100> newItem = sqlSession.selectList("Top100Mapper.sortedLastWeekList");
		
		List<Integer> rank = new ArrayList<>();
		
		/**
		 * newItem(지난주 순위 리스트)을 oldItem(이주전 순위 리스트)에서 검색하여
		 * 일치하는 값이 존재한다면 해당  -> 이주전 순위 - 지난주 순위 = 순위 변동값
		 * 일치하는 값이 없다면 지난주 Top100리스트에 포함되지 않는 것이므로 새롭게 순위권에 진입했다는 new문자 표시
		 */
		for ( int i = 0 ; i < newItem.size() ; i ++ ) {
			boolean is = false;
			for ( int j = 0 ; j < oldItem.size() ; j++ ) {
				// 동일한 데이터 조회되면 순위 변동값 저장
				if ( newItem.get(i).getMovie_no() == oldItem.get(j).getMovie_no() ) {
					// 이주전 순위 - 지난주 순위 = 순위 변동값
					rank.add( j - i );
					is = true;
				}
			}
			// 동일한 데이터가 조회되지 않으면 new 아이템
			if (!is) {
				rank.add(999);
			}
		}
		
		return rank;
	}
	
	/** buy_count에서 3주이상 지난 기록 삭제 */
	@Override
	public void deleteCount() {
		sqlSession.delete("Top100Mapper.deleteCount");
	}

	/** 고객이 매일 영화를 구매했다는 가정하에 넣는 임의 buy_count 데이터 값 */
	@Override
	public void insertDummyData() {
		
		Top100 top100 = new Top100();
		
		for ( int i = 0 ; i < 1000 ; i++ ) {
			int random_movie_no = (int)(Math.random() * (200)) + 401;
			top100.setMovie_no(random_movie_no);
			sqlSession.insert("Top100Mapper.insertDummyData", top100);
		}
		
	}
}
