package study.spring.clip.model;

import lombok.Data;

@Data
public class MovieSearch {
	private String thumbnail;
	private String name;
	private int age;
	private String type;
	private int price;	
	private int actor_no;
	private String movie_actor;
	private String director;
	private int movie_no;
}
