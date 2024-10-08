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
import com.project.domain.WorkflowVO;
import com.project.service.WorkflowServiceImpl;

/**
 *	 MemberDAO 동작을 수행 
 *
 */
// @Repository  : 스프링이 해당클래스를 DAO객체 (Bean)로 인식
//                root-context.xml파일에서 해당객체를 사용하도록 설정

@Repository
public class WorkflowDAOImpl implements WorkflowDAO {

	@Inject
	private SqlSession sqlSession; // 자동으로 연결,자원해제,SQL실행,mybatis...
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.project.mapper.WorkflowMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(WorkflowServiceImpl.class);

	@Override
	public WorkflowVO getWorkflow(String wf_code) {
		WorkflowVO result = sqlSession.selectOne(NAMESPACE + ".getWorkflow",wf_code);
		logger.debug(" 실행 결과 : "+result);
		
		return result;
	}

	@Override
	public List<WorkflowVO> getSentWorkflowList(String userid,String status) {
		logger.debug(" WorkflowDAOImpl : getSentWorkflowList("+userid+","+status+") 실행");
		
		WorkflowVO vo = new WorkflowVO();
		
		vo.setWf_sender(userid);
		vo.setWf_status(status);
		
		List<WorkflowVO>result = sqlSession.selectList(NAMESPACE + ".getSentWorkflowList",vo);
		logger.debug(" 실행 결과 (개수): "+result.size());
		
		return result;
	}
	
	@Override
	public List<WorkflowVO> getReceivedWorkflowList(String userid,String status) {
		logger.debug(" WorkflowDAOImpl : getReceivedWorkflowList("+userid+","+status+") 실행");
		
		WorkflowVO vo = new WorkflowVO();
		
		vo.setWf_getter(userid);
		vo.setWf_status(status);
		
		List<WorkflowVO>result = sqlSession.selectList(NAMESPACE + ".getReceivedWorkflowList",vo);
		logger.debug(" 실행 결과 (개수): "+result.size());
		
		return result;
	}

	@Override
	public int updateWorkflow(WorkflowVO vo) {
		logger.debug(" WorkflowDAOImpl : updateWorkflow("+vo+") 실행");
		return sqlSession.update(NAMESPACE + ".responseWorkflow", vo);
	}
	
	
	
	
}