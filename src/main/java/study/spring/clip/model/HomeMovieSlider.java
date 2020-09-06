package study.spring.clip.model;

import lombok.Data;

@Data
public class HomeMovieSlider {
	private int movie_no;
	private String name;
    private String thumbnail;
	private int price;
	private int sale;
	private int category_type_no;
}
