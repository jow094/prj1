package com.project.service;

import java.util.List;

import com.project.domain.MemberVO;
import com.project.domain.WorkflowVO;

public interface WorkflowService {
	
	public List<WorkflowVO> showSentWorkflowList(String userid,String status);
	public List<WorkflowVO> showReceivedWorkflowList(String userid,String status);
	public WorkflowVO showWorkflow(String wf_code);
	public int responseWorkflow(WorkflowVO vo);

}
