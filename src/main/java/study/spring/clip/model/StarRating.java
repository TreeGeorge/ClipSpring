package study.spring.clip.model;

import lombok.Data;

@Data
public class StarRating {
	private int star_rating_number;
	private double score;
	private int user_no;
	private int movie_no;

}
