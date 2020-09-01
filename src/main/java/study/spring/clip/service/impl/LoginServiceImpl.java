package study.spring.clip.service.impl;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import study.spring.clip.model.User;
import study.spring.clip.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*로그인*/
	public boolean loginCheck(HttpSession session, String id, String pw) {
		User input = new User();		
		User result = new User();
		input.setId(id);
		result = sqlSession.selectOne("UserMapper.selectUser",input);
	
		if(result==null||!pw.equals(result.getPw())) { return false; }
		else { pushSession(session, result); return true; }
	}
	
	/*세션에 회원정보 저장*/
	 public void pushSession(HttpSession session, User user) {
			session.setAttribute("id", user.getId());
			session.setAttribute("pw", user.getPw());
			session.setAttribute("name", user.getName());
			session.setAttribute("user_no", user.getUser_no());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("is_sendagree", user.getIs_sendagree());
			session.setAttribute("coin", user.getCoin());
			session.setAttribute("card", user.getCard());
			session.setAttribute("birthdate", user.getBirthdate());
			session.setAttribute("gender", user.getGender());
			session.setAttribute("editdate", user.getEditdate());
	   }
	 
	 
}
