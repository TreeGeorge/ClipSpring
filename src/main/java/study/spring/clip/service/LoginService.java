package study.spring.clip.service;

import javax.servlet.http.HttpSession;

import study.spring.clip.model.User;

public interface LoginService {
	
	
	public boolean loginCheck(HttpSession session, String id, String pw);
	public void pushSession(HttpSession session, User user) ;
	
}
