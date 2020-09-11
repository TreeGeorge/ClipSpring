package study.spring.clip.model;

import lombok.Data;

@Data
public class Top100 {
	private int movie_no;
	private int buy_count_no;
	private String name;
	private String type;
	private int price;
	private String thumbnail;
	private String date;
}
