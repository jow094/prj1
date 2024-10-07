package com.project.service;

import java.util.List;

import com.project.domain.MemberVO;
import com.project.domain.WorkflowVO;

public interface WorkflowService {
	
	public List<WorkflowVO> showWorkflowList(String userid);
	public MemberVO showWorkflow(String wf_code);

}
