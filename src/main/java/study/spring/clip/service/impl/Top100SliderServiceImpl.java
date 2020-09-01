package study.spring.clip.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.model.Top100Slider;
import study.spring.clip.service.Top100SliderService;

@Slf4j
@Service
public class Top100SliderServiceImpl implements Top100SliderService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public Top100Slider getTop100SliderItem(Top100Slider input) throws Exception {
		Top100Slider result = null;

		try {
			result = sqlSession.selectOne("Top100SliderMapper.oneTop100Slider", input);

			if (result == null) {
				throw new NullPointerException("resut=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
}
