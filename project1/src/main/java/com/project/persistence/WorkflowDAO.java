package com.project.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.project.domain.MemberVO;
import com.project.domain.WorkflowVO;

/**
 *	tbl_memeber 테이블의 데이터를 활용하는 동작을 정의 
 *
 */
public interface WorkflowDAO {

	public WorkflowVO getWorkflow();
	
	public List<WorkflowVO> getWorkflowList(String userid);
	
}
