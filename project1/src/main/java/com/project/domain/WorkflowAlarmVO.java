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
public class WorkflowAlarmVO {
	
	private String wf_code;
    private String wf_type;
    private String wf_title;
    private String wf_progress;
    private String wf_sender;
    private Timestamp wf_date;  // 날짜는 단일 필드로 통합됨
    private String emp_name;
    private String emp_bnum;
    private String emp_dnum;
    private String emp_position;

}
