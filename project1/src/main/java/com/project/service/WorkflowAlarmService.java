package com.project.service;

import java.util.List;

import com.project.domain.MemberVO;
import com.project.domain.WorkflowAlarmVO;
import com.project.domain.WorkflowVO;

public interface WorkflowAlarmService {
	
	public List<WorkflowAlarmVO> checkWorkflow(String emp_id);
	public int checkAlarmedWorkflow(String wf_code);

}
