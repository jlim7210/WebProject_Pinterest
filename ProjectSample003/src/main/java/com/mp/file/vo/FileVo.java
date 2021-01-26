package com.mp.file.vo;

import java.io.File;
import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
public class FileVo {

	@Range(min = 1)
	private Integer file_id;
	@Size(max = 260)
	private String org_file_name;
	@Size(max = 36)
	private String chg_file_name;
	private Integer file_size;
	private Date cre_date;
	private boolean delete;
	
}
