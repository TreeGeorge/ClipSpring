package study.spring.clip.model;

import lombok.Data;

// 영화 - 카테고리, 영화 - 배우 , 배우 테이블 채우는데 필요한 친구임 삭제하면 안됨
@Data
public class Temp {
	private String actor;
	private int actor_no;
	private int movie_no;
	private int category_type_no;
	private String name;
}
