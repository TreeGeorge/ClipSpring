package study.spring.clip.model;

import lombok.Data;

@Data
public class Movie {
	private int movie_no;
    private String name;
    private String is_rent;
    private String is_buy;    
    private String director;
    private int price;
    private int sale;
    private String thumbnail;
    private String preview;
    private String summary;
    private String runtime;
    private String age;
}
