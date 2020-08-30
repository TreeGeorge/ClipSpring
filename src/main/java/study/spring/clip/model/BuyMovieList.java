package study.spring.clip.model;

import lombok.Data;

@Data
public class BuyMovieList {
	private int buy_movie_list_no;
	private String date;
	private String is_delete;
	private int user_no;
	private int movie_no;
}
