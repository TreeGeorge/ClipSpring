//package study.spring.clip.dao;
//
//import org.apache.ibatis.session.SqlSession;
//import org.junit.FixMethodOrder;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.junit.runners.MethodSorters;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//
//import lombok.extern.slf4j.Slf4j;
//import study.spring.clip.model.User;
//
///** Lombok의 Log4j 객체 */
//// import lombok.extern.slf4j.Slf4j;
//@Slf4j
///** JUnit에 의한 테스트 클래스로 정의 */
//// import org.junit.runner.RunWith;
//// import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//@RunWith(SpringJUnit4ClassRunner.class)
///** Spring의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
//// import org.springframework.test.context.ContextConfiguration;
//@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
///** 웹 어플리케이션임을 명시 */
//// import org.springframework.test.context.web.WebAppConfiguration;
//@WebAppConfiguration
///** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
//// import org.junit.FixMethodOrder;
//@FixMethodOrder(MethodSorters.NAME_ASCENDING)
//public class UserTest {
//	
//	/** MyBatis의 SQL세션 주입 설정 */
//	// import org.springframework.beans.factory.annotation.Autowired;
//	@Autowired
//	private SqlSession sqlSession;
//
//	/** 단일행 조회 테스트 */
//	
//	//유저생성 (회원가입) 파라미터 회원가입 폼 입력요소 + 약관동의 이메일수신여부 (상태유지 하여 넘겨 받기)
//	@Test
//	public void test5() {
//		User input = new User();
//		//필수
//		input.setId("JWW");
//		//필수
//		input.setPw("0000");
//		//필수
//		input.setName("주영아");
//		//필수
//		input.setGender("F");
//		//필수
//		input.setBirthdate("19971018");
//		//필;수
//		input.setEditdate("20200901");
//		// 필수
//		input.setEmail("qq2222@gmail.com");
//		//약광동의 페이지 상태유지
//		input.setIs_sendagree("N");
//		 sqlSession.selectOne("UserMapper.createUser", input);
//	}
//	
//	
//	// //유저 삭제 (회원 탈퇴) 파라미터 세션 유저 넘버
// //    @Test
// //    public void test6() {    
// //        User input = new User();
// //        input.setUser_no(3);
// //        sqlSession.delete("UserMapper.deleteUser", input);
// //    }
//    
//	
//	// //유저 비밀번호 변경 / 파라미터  세션 유저 아이디(넘버)
//    
// //    @Test
// //    public void test7() {
// //    	User input = new User();
// //    	input.setId("master001");
// //    	input.setPw("1234");
// //    	sqlSession.update("UserMapper.pwChange", input);
// //    }
//
//}
