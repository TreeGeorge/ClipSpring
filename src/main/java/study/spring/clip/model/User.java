package study.spring.clip.model;

import lombok.Data;

@Data
public class User {
	private int user_no;
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String birthdate;
	private String editdate;
	private String email;
	private String is_sendagree;
	private int coin;
	private String card;
}
