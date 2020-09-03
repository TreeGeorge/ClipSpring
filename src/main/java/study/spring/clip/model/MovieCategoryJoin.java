package study.spring.clip.model;

import lombok.Data;

// 무비 + 카테고리
@Data
public class MovieCategoryJoin {
	private int movie_no;
	private String name;
    private String thumbnail;
	private int price;
	private int sale;
	private int category_type_no;
}
