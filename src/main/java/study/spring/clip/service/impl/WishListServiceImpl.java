package study.spring.clip.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import study.spring.clip.model.WishList;
import study.spring.clip.service.WishListService;

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
	public int insertWishList(WishList input){
		int result = 0;

			result = sqlSession.insert("WishListMapper.wishListInsert",input);

		return result;
	}
	
	@Override
	public int deleteWishList(WishList input){
		int result = 0;

			result = sqlSession.delete("WishListMapper.wishListDelete",input);

		return result;
	}

	@Override
	public boolean checkWishList(WishList input) {
		if(sqlSession.selectOne("WishListMapper.wishListInsertCheck",input)==null){
			return true;
		}
			
		return false;
	}


	
	
}
