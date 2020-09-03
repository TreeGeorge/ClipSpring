package study.spring.clip.service;

import javax.servlet.http.HttpSession;

import study.spring.clip.model.User;

public interface LoginService {
	
	public boolean loginCheck(HttpSession session, String id, String pw);
	public void pushSession(HttpSession session, User user) ;
	public void createUser(User input);
	public boolean idOverlapCheck(String id);
	public boolean emailOverlapCheck(String id);
	public void signUp(String agree, String id, String name, String email, String pw, String edit, String birth, String gender);
    public boolean pwCheck(String id, String pw);
	
}
