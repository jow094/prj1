package com.project.domain;

import java.sql.Timestamp;

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
	private String wf_sender;
	private String wf_getter;
	private String wf_status;
	private Timestamp wf_create_date;
	private Timestamp wf_read_date;
	private String wf_file;
	

}
