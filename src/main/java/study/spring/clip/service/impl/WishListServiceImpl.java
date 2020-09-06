package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.WishList;
import study.spring.clip.service.WishListService;
@Slf4j
@Service
public class WishListServiceImpl implements WishListService{
	
	@Autowired
	SqlSession sqlSession;
	@Override
	public List<WishList> getWishListList(int x) {
		
		List<WishList>  result = sqlSession.selectList("WishListMapper.wishListList",x);
			
		return result;
		
	}
	
	@Override
	public int insertWishList(WishList input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("WishListMapper.wishListInsert",input);
			
			if(result==0) {
				throw new NullPointerException("result=0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삽입된데이터가엄쪄");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삽입 실패");
		}
		
		return result;
	}
	
	@Override
	public int deleteWishList(WishList input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("WishListMapper.wishListDelete",input);
			
			if(result == 0) {
				throw new NullPointerException("result=0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된터가 엄쪄");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제실패");
		}
		return result;
	}

	@Override
	public boolean checkWishList(WishList input) {
		if(sqlSession.selectOne("WishListMapper.wishListInsertCheck",input)!=null){
			return true;
		}
			
		return false;
	}


	
	
}
