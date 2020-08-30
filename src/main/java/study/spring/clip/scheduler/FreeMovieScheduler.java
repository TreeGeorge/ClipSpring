package study.spring.clip.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import study.spring.clip.service.FreeMovieService;

@Slf4j
@Controller
public class FreeMovieScheduler {
	
	@Autowired
	FreeMovieService freeMovieService;
	
	public void everyMidnight() {
		freeMovieService.endFreeMovie();
		freeMovieService.editFreeMovie();
		log.debug("무료영화 업데이트 완료!");
	}

}
