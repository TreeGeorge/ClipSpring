package study.spring.simplespring.service;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

//import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.MovieComment;
//import study.spring.clip.service.MovieCommentService;

/** Lombok의 Log4j 객체 */
//import lombok.extern.slf4j.Slf4j;
//@Slf4j
/** JUnit에 의한 테스트 클래스로 정의 */
//import org.junit.runner.RunWith;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
//import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
//import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
//import org.junit.FixMethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MovieCommentServiceTest {

//	@Autowired
//	private MovieCommentService movieCommentService;

//	/** 단일행 조회 테스트 */
//	@Test
//	public void testA() {
//		
//		try {
//			movieCommentService.MovieComment();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

//	/** 삭제 테스트 */
//	@Test
//	public void testB() {
//		// 검색조건으로 사용될 POJO 클래스 객체
//		MovieComment input = new MovieComment();
//		input.setMovie_comment_no(12);
//
//		int output = 0;
//
//		try {
//			output = movieCommentService.deleteMovieComment(input);
//			log.debug("삭제된 데이터 수 " + output);
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
//	}
	
	/** 생성 테스트 */
	@Test
	public void testC() {
		// 검색조건으로 사용될 POJO 클래스 객체
		MovieComment input = new MovieComment();
		input.setMovie_comment_no(5);
		input.setEditdate("2020-08-12 00:00:00");
		input.setContent("모임");
		input.setUserid("master004");
		input.setUser_no(5);
		input.setMovie_no(5);

//		int output = 0;

//		try {
//			output = movieCommentService.insertMovieComment(input);
//			log.debug("생성된 데이터 수 " + output);
//		} catch (Exception e) {
//			log.error(e.getLocalizedMessage());
//			e.printStackTrace();
//		}
	}
}
