package study.spring.clip.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.MovieComment;
import study.spring.clip.service.MovieCommentService;

@Slf4j
@Service
public class MovieCommenServicetImpl implements MovieCommentService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MovieComment getMovieCommentItem(MovieComment input) throws Exception {
		MovieComment result = null;

		try {
			result = sqlSession.selectOne("MovieCommentMapper.oneComment", input);

			if (result == null) {
				throw new NullPointerException("resut=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int deleteMovieComment(MovieComment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("MovieCommentMapper.deleteComment", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int insertMovieComment(MovieComment input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("MovieCommentMapper.insertComment", input);

			if (result == 0) {
				throw new NullPointerException("resut=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("생성된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 생성에 실패했습니다.");
		}

		return result;
	}
}
