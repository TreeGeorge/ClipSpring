package study.spring.clip.service.impl;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.User;
import study.spring.clip.service.LoginService;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void createUser(User input){
		sqlSession.selectOne("UserMapper.createUser",input);
	}

	/*로그인*/
	public boolean loginCheck(HttpSession session, String id, String pw) {
		User input = new User();		
		User result = new User();
		input.setId(id);
		result = sqlSession.selectOne("UserMapper.selectUser",input);
	
		if(result==null||!pw.equals(result.getPw())) { return false; }
		else { pushSession(session, result); return true; }
	}
	
    public boolean pwCheck(String id, String pw){
    	User input = new User();
		User result = new User();
		input.setId(id);
		result = sqlSession.selectOne("UserMapper.selectUser",input);
		if(pw.equals(result.getPw())){return true;}
		return false;
    }

	
	/*세션에 회원정보 저장*/
	 public void pushSession(HttpSession session, User user) {
			session.setAttribute("id", user.getId());
			session.setAttribute("user_no", user.getUser_no());
	  }
	 
	 /*아이디 중복 검사*/
	 public boolean idOverlapCheck(String id) {
		 User input = new User();
		 input.setId(id);
		 User result =  sqlSession.selectOne("UserMapper.selectUser",input);
		 
		 if(result != null) {return true;}
		 return false;
	 }
	 
	 /*이메일 중복 검사*/
	 public boolean emailOverlapCheck(String email){
		 User input = new User();
		 log.debug("333"+email);
		 input.setEmail(email);
		 User result =  sqlSession.selectOne("UserMapper.selectUserToEmail",input);
		 
		 if(result != null) {return true;}
		 return false;
	 }
	 
	 /*회원가입 처리*/
	 public void signUp(String agree, String id, String name, String email, String pw, String edit, String birth, String gender) {
		 	User input = new User();
		 	if(agree.equals("true")) { agree = "Y";}
		 	else { agree = "N"; }
		 	input.setId(id);
			input.setPw(pw);
			input.setName(name);
			input.setGender(gender);
			input.setBirthdate(birth);
			input.setEditdate(edit);
			input.setEmail(email);
			input.setIs_sendagree(agree);
			sqlSession.selectOne("UserMapper.createUser", input);
	 }
}
