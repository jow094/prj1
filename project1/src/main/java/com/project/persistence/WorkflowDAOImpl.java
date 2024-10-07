package com.project.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.project.domain.MemberVO;
import com.project.domain.WorkflowVO;

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

	@Override
	public WorkflowVO getWorkflow() {
		
		
		return null;
	}

	@Override
	public List<WorkflowVO> getWorkflowList(String userid) {
		System.out.println(" WorkflowDAOImpl : getWorkflowList("+userid+") 실행");
		
		
		
		List<WorkflowVO>result = sqlSession.selectList(NAMESPACE + ".getWorkflowList",userid);
		System.out.println(" 실행 결과 (개수): "+result.size());
		
		return result;
	}
	
	
	
	
}