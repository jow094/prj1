package com.project.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
public class WorkflowVO {
	
	private String wf_code;  // getUserid();
	private String wf_type;
	private String wf_title;
	private String wf_content;
	private Timestamp wf_create_date;
	private Timestamp wf_read_date;
	private String wf_file;
	private String wf_status;
	private String wf_sender;
	private String wf_getter;
	private String wf_comment;
	private String wf_level;
	private String wf_result;

}
