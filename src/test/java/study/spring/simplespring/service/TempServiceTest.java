//package study.spring.simplespring.service;
//
//import java.util.List;
//
//import org.junit.FixMethodOrder;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.junit.runners.MethodSorters;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//
//import study.spring.clip.model.Temp;
//import study.spring.clip.service.TempService;
//
//@RunWith(SpringJUnit4ClassRunner.class)
///** Spring의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
////import org.springframework.test.context.ContextConfiguration;
//@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
///** 웹 어플리케이션임을 명시 */
////import org.springframework.test.context.web.WebAppConfiguration;
//@WebAppConfiguration
///** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
////import org.junit.FixMethodOrder;
//@FixMethodOrder(MethodSorters.NAME_ASCENDING)
//public class TempServiceTest {
//	
//	@Autowired
//	TempService tempService;
//	// 배우 테이블에 값 넣기 - 현재 못씀 사용하려면 movie 테이블에 actor가 ,식으로 이어져 있는 컬럼이 필요함
//	@Test
//	public void testA() {
//		List<Temp> actor = tempService.getAllMovie();
//		
//		Temp input = new Temp();
//		for ( int i = 0 ; i < actor.size() ; i++ ) {
//			
//			String[] actor_name = actor.get(i).getActor().split(", ");
//			
//			for ( int y = 0 ; y < actor_name.length ; y++ ) {
//
//				input.setName(actor_name[y]);
//
//				if( tempService.searchActor(input) ) {
//					tempService.insertActor(input);
//				}
//			}
//			
//		}
//	}
	
//	// 영화 - 배우 테이블에 값 넣기 - 현재 못씀 사용하려면 movie 테이블에 actor가 ,식으로 이어져 있는 컬럼이 필요함
//	@Test
//	public void testB() {
//		List<Temp> actor = tempService.getAllMovie();
//		
//		Temp input = new Temp();
//		
//		for ( int i = 0 ; i < actor.size() ; i++ ) {
//			
//			String[] actor_name = actor.get(i).getActor().split(", ");
//			
//			for ( int y = 0 ; y < actor_name.length ; y++ ) {
//
//				input.setName(actor_name[y]);
//				
//				int actor_no = tempService.getActorNo(input);
//				
//				input.setActor_no(actor_no);
//				input.setMovie_no(actor.get(i).getMovie_no());
//
//				tempService.connectActor(input);
//			}
//			
//		}
//	}
	
//	// 카테고리 테이블에 값 넣기 - 현재 못씀 사용하려면 movie 테이블에 category_type_no가 컬럼이 필요함
//	@Test
//	public void testC() {
//		
//		List<Temp> category = tempService.getAllMovie();
//		
//		Temp input = new Temp();
//		
//		for ( int i = 0 ; i < category.size() ; i++ ) {
//
//			input.setMovie_no(category.get(i).getMovie_no());
//			input.setCategory_type_no(category.get(i).getCategory_type_no());
//			
//			tempService.connectCategory(input);
//		}
//		
//	}
	
//	// 세일 영화 - 카테고리 연결
//	@Test
//	public void testD() {
//		
//		List<Temp> category = tempService.getSaleMovie();
//		
//		Temp input = new Temp();
//		
//		for ( int i = 0 ; i < category.size() ; i++ ) {
//			
//			input.setMovie_no(category.get(i).getMovie_no());
//							
//			tempService.connectSaleCategory(input);
//		}
//	}
	
//	// 세일 영화 - 카테고리 삭제
//	@Test
//	public void testE() {
//		tempService.deleteSaleCategory();
//	}
	
//	// 최신 영화 - 카테고리 연결
//	@Test
//	public void testF() {
//		
//		List<Temp> category = tempService.getNewMovie();
//		
//		Temp input = new Temp();
//		
//		for ( int i = 0 ; i < category.size() ; i++ ) {
//			
//			input.setMovie_no(category.get(i).getMovie_no());
//							
//			tempService.connectNewCategory(input);
//		}
//	}
	

//}
