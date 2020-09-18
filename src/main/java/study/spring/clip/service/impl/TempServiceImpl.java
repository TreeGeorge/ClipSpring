package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.Temp;
import study.spring.clip.service.TempService;

@Service
public class TempServiceImpl implements TempService{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Temp> getAllMovie() {
		List<Temp> result = sqlSession.selectList("TempMapper.allMovie");
		return result;
	}

	@Override
	public boolean searchActor(Temp input) {
		if (sqlSession.selectOne("TempMapper.checkActor", input) == null) {
			return true;
		}
		return false;
	}

	@Override
	public void insertActor(Temp input) {
		sqlSession.insert("TempMapper.insertActor", input);
	}

	@Override
	public int getActorNo(Temp input) {
		int result = sqlSession.selectOne("TempMapper.getActorNo", input);
		return result;
	}

	@Override
	public void connectActor(Temp input) {
		sqlSession.insert("TempMapper.connectActor", input);
	}

	@Override
	public void connectCategory(Temp input) {
		sqlSession.insert("TempMapper.connectCategory", input);
	}

	@Override
	public void deleteSaleCategory() {
		sqlSession.delete("TempMapper.deleteSaleCategory");
	}

	@Override
	public void connectSaleCategory(Temp input) {
		sqlSession.insert("TempMapper.connectSaleCategory", input);
	}

	@Override
	public void connectNewCategory(Temp input) {
		sqlSession.insert("TempMapper.connectNewCategory", input);
	}

	@Override
	public List<Temp> getSaleMovie() {
		List<Temp> result = sqlSession.selectList("TempMapper.saleMovie");
		return result;
	}

	@Override
	public List<Temp> getNewMovie() {
		List<Temp> result = sqlSession.selectList("TempMapper.newMovie");
		return result;
	}

}
