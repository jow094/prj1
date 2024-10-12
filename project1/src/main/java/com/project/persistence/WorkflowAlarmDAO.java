package com.project.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.project.domain.WorkflowAlarmVO;

public interface WorkflowAlarmDAO {

	public List<WorkflowAlarmVO> getWorkflowAlarmList(String emp_id);
	public int updateWorkflowAlarmToken(String wf_code);
}
