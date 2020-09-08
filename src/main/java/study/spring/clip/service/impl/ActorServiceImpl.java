package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.Actor;
import study.spring.clip.service.ActorService;
@Service
public class ActorServiceImpl implements ActorService {

	@Autowired
	SqlSession sqlSession;
	@Override
	public List<Actor> getActor(int movie_no) {
		List<Actor> result = sqlSession.selectList("ActorMapper.actorMovie", movie_no);
		return result;

	}
		
}
