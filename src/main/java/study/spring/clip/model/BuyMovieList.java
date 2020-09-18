package study.spring.clip.model;

import lombok.Data;

@Data
public class BuyMovieList {
	private int buy_movie_list_no;
	private int buy_count_no;
	private String date;
	private String is_delete;
	private int user_no;
	private int movie_no;
	private String name;
	private int price;
	private String thumbnail;
	private int coin;
	private String is_watched;
	private String runtime;
	private String type;
	private String end_date;
	private String age;
	private String coupon_used;
}
