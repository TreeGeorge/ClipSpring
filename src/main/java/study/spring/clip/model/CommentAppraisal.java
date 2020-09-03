package study.spring.clip.model;

import lombok.Data;

@Data
public class CommentAppraisal {
	private int appraisal_no;
	private String answer;
	private int user_no;
	private int movie_comment_no;
}
