package com.mp.post.vo;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Post {

	@Id
	private int post_id;
	@Range(min = 1)
	@Column
	private Integer board_id;
	@NotBlank
	@Column
	private String post_title = null;
	@Size(max = 2000)
	private String post_content;
	@Min(value = 1)
	private Integer uploader_uqid;
	private String org_file_name;
	private String chg_file_name;
	private Integer file_size;
	private boolean is_active;
	private LocalDateTime cre_date;
}
