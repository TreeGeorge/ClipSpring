package study.spring.clip.model;

import lombok.Data;

@Data
public class Interest {
	private int interest_no;
	private int user_no;
	private int movie_no;
	private String name;
	private String age;
	private String runtime;
	private String thumbnail;
	private String release_date;
}
