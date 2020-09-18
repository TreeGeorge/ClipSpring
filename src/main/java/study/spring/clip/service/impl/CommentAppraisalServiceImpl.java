package study.spring.clip.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.CommentAppraisal;
import study.spring.clip.service.CommentAppraisalService;

@Slf4j
@Service
public class CommentAppraisalServiceImpl implements CommentAppraisalService {

	@Autowired
	SqlSession sqlSession;

	
	@Override
	public void CommentAppraisal(int user_no, int movie_comment_no, String answer) {
		CommentAppraisal input = new CommentAppraisal();
		input.setUser_no(user_no);
		input.setMovie_comment_no(movie_comment_no);
		
		CommentAppraisal result = sqlSession.selectOne("CommentAppraisalMapper.oneCommentAppraisal",input);
		if(result == null) {
			input.setAnswer(answer);
			sqlSession.selectOne("CommentAppraisalMapper.insertCommentAppraisal",input);
		} else {
			input.setAnswer(answer);
			sqlSession.selectOne("CommentAppraisalMapper.updateCommentAppraisal",input);
		}
		
	}

	@Override
	public int getlikeComment(CommentAppraisal input) {
		
	int result = 0;
	
		try {
			result = sqlSession.selectOne("CommentAppraisalMapper.GoodComment", input);
			System.out.println(result);
			if (result == 0) {
				throw new NullPointerException("resut=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		}
		return result;
	}
}


