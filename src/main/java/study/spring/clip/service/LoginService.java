package study.spring.clip.service;

import javax.servlet.http.HttpSession;

import study.spring.clip.model.User;

public interface LoginService {
	
	public boolean loginCheck(HttpSession session, String id, String pw);
	public void pushSession(HttpSession session, User user) ;
	public boolean idOverlapCheck(String id);
	public boolean idOverlapCheck(String id, HttpSession session);
	public boolean emailOverlapCheck(String id);
	public void signUp(String agree, String id, String name, String email, String pw, String edit, String birth, String gender);
    public boolean pwCheck(String id, String pw);
	public User randerUser(int user_no);
	public void deleteUser(int user_no);
	public void pwChange(int user_no, String pw);
	public void emailChange(int user_no, String email);
	public void cardChange(int user_no, String card);
	public boolean emailCheckToName(String name, String email);
	public User randerID(String email);
	public boolean searchUserToChangePW(String id, String email, String name);
	public void searchpwToChange(String id, String pw);
}
