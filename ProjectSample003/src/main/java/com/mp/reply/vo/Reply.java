package com.mp.reply.vo;

import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

import lombok.Data;

@Data
public class Reply {

	private int reply_id;
	@Range(min = 1)
	private int post_id;
	@Range(min = 1)
	private int uqid;
	@Size(max = 50)
	private String reply_content;
	private boolean is_active_rep;
	private Date cre_date;
}
