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
	
	/*로그인 후 세션 생성*/
	public boolean loginCheck(HttpSession session, String id, String pw) {
		User input = new User();		
		User result = new User();
		input.setId(id);
		result = sqlSession.selectOne("UserMapper.selectUser",input);
	
		if(result==null||!pw.equals(result.getPw())) { return false; }
		else { pushSession(session, result); return true; }
	}
	
	/*세션 id랑 비밀번호 검사*/
    public boolean pwCheck(String id, String pw){
    	User input = new User();
		User result = new User();
		input.setId(id);
		result = sqlSession.selectOne("UserMapper.selectUser",input);
		if(pw.equals(result.getPw())){return true;}
		return false;
    }
    
    /*유저 객체 리턴*/
    public User randerUser(int user_no) {
    	User result = sqlSession.selectOne("UserMapper.selectUserToNumber", user_no);
    	return result;
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
	 
	 /*아이디 중복 검사, 세션 저장*/
	 public boolean idOverlapCheck(String id, HttpSession session) {
		 User input = new User();
		 input.setId(id);
		 User result =  sqlSession.selectOne("UserMapper.selectUser",input);
		 
		
		 if(result != null) {
			 session.setAttribute("id_check", result.getId());
			 return true;
		}
		 return false;
	 }
	 
	 /*이메일 중복 검사*/
	 public boolean emailOverlapCheck(String email){
		 User input = new User();
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
	 
	 /*회원 탈퇴 처리*/
	 public void deleteUser(int user_no) {
		 User input = new User();
		 input.setUser_no(user_no);
		 /*삭제 테이블*/
		 sqlSession.selectList("WishListMapper.deleteList",input);
		 sqlSession.selectList("BuyCoinListMapper.deleteList",input);
		 sqlSession.selectList("InterestMapper.deleteList",input);
		 sqlSession.selectList("UserCouponMapper.deleteList",input);
		 sqlSession.selectList("BuyMovieListMapper.deleteList",input);
		 
		 /*null 처리*/
		 sqlSession.selectList("CommentAppraisalMapper.nullList",input);
		 sqlSession.selectList("MovieCommentMapper.nullList",input);
		 sqlSession.selectList("StarRatingMapper.nullList",input);
		 
		 /*회원 테이블 삭제(탈퇴)*/
		 sqlSession.selectOne("UserMapper.deleteUser", input);
	 }
	 
	 /*비밀번호 변경*/
	 public void pwChange(int user_no, String pw) {
		 User input = new User();
		 input.setUser_no(user_no);
		 input.setPw(pw);
		 sqlSession.selectOne("UserMapper.pwChange", input);
	 }
	 
	 /*이메일 변경*/
	 public void emailChange(int user_no, String email) {
		 User input = new User();
		 input.setUser_no(user_no);
		 input.setEmail(email);
		 		
		 sqlSession.selectOne("UserMapper.emailChange", input);		
	 }
	 
	 /*카드정보 등록/변경*/
	 public void cardChange(int user_no, String card) {
		 User input = new User();
		 input.setUser_no(user_no);
		 input.setCard(card);
		 
		 sqlSession.selectOne("UserMapper.cardChange", input);	
	 }
	 
	 public boolean emailCheckToName(String name, String email) {
		 User input = new User();
		 input.setName(name);
		 input.setEmail(email);
		 if(sqlSession.selectOne("UserMapper.SelectUserNameAndEmail",input)==null) {
			 return true;
		 }
		 return false;
	 }
	 
	 public User randerID(String email) {
		 User input = new User();
		 input .setEmail(email);
		 User result =  sqlSession.selectOne("UserMapper.selectUserToEmail",input);
		 return result;
	 }
	 
	 public boolean searchUserToChangePW(String id, String email, String name) {
		 User input = new User();
		 input.setId(id);
		 input.setEmail(email);
		 input.setName(name);
		 if(sqlSession.selectOne("UserMapper.searchUserToChangePW",input)==null) {return false;}
		 return true;
	 }
	 
	 public void searchpwToChange(String id, String pw){
		 User input = new User();
		 input.setId(id);
		 User result1 = sqlSession.selectOne("UserMapper.selectUser",input);
		 User result2 = new User();
		 result2.setUser_no((result1.getUser_no()));
		 result2.setPw(pw);
		 
		 sqlSession.selectOne("UserMapper.pwChange",result2);
	 }
}
