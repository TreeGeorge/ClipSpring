package study.spring.clip.model;

import lombok.Data;

@Data
public class CategorySorted {
	private int movie_no;
	private String name;
    private String thumbnail;
	private int sale;
	private int price;
	private String type;
	private int category_type_no;
	private String release_date;
}
