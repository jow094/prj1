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
	private String wf_file;
	private String wf_progress;
	private String wf_status;
	private String wf_sender;
	private String wf_receiver;
	private String wf_receiver_1st;
	private String wf_receiver_2nd;
	private String wf_receiver_3rd;
	private String wf_comment;
	private String wf_comment_1st;
	private String wf_comment_2nd;
	private String wf_comment_3rd;
	private String wf_result;
	private String wf_result_1st;
	private String wf_result_2nd;
	private String wf_result_3rd;
	private Timestamp wf_result_date;
	private Timestamp wf_result_date_1st;
	private Timestamp wf_result_date_2nd;
	private Timestamp wf_result_date_3rd;

}
