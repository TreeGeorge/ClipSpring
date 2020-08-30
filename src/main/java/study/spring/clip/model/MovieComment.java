package study.spring.clip.model;

import lombok.Data;

@Data
public class MovieComment {
	private int movie_comment_no;
	private String editdate;
	private String content;
	private String userid;
	private int user_no;
	private int movie_no;
}
