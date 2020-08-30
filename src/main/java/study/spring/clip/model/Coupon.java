package study.spring.clip.model;

import lombok.Data;

@Data
public class Coupon {
	private int coupon_no;
	private String name;
	private String period;
	private int price;
}
