package com.mp.member.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//@Getter
//@Setter
@NoArgsConstructor
@Data
public class Member {

	private int member_uqid;
	@NotBlank
	private String member_acc;
	@NotBlank
	private String member_pw;
	private int member_active;
	private LocalDateTime member_cre_date;
	private int member_rank;
//	@org.hibernate.validator.constraints.NotEmpty
	private String member_name;
}
