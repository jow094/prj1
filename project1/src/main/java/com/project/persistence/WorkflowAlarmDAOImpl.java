package com.project.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.project.domain.MemberVO;
import com.project.domain.WorkflowAlarmVO;
import com.project.domain.WorkflowVO;
import com.project.service.WorkflowServiceImpl;

/**
 *	 MemberDAO 동작을 수행 
 *
 */
// @Repository  : 스프링이 해당클래스를 DAO객체 (Bean)로 인식
//                root-context.xml파일에서 해당객체를 사용하도록 설정

@Repository
public class WorkflowAlarmDAOImpl implements WorkflowAlarmDAO {

	@Inject
	private SqlSession sqlSession; // 자동으로 연결,자원해제,SQL실행,mybatis...
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.project.mapper.WorkflowMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(WorkflowServiceImpl.class);
	
	public List<WorkflowAlarmVO> getWorkflowAlarmList(String emp_id) {
		return sqlSession.selectList(NAMESPACE + ".getWorkflowAlarmList",emp_id);
	}

	@Override
	public int updateWorkflowAlarmToken(String wf_code) {
		return sqlSession.update(NAMESPACE + ".WorkflowAlarmCheck",wf_code);
	}
	
}