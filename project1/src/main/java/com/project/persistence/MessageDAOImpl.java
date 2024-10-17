package com.project.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.project.domain.MessageVO;
import com.project.domain.WorkflowVO;
import com.project.service.WorkflowServiceImpl;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Inject
	private SqlSession sqlSession; // 자동으로 연결,자원해제,SQL실행,mybatis...
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.project.mapper.MessageMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(WorkflowServiceImpl.class);

	@Override
	public int validate_room(MessageVO vo) {
		int result = sqlSession.selectOne(NAMESPACE + ".findRoom",vo);
			
			if(result>0) {
				logger.debug("msDAO : 두 이용자의 기존 채팅방이 있습니다. 해당 방 id를 반환합니다.");
				return result;
			}
			
			if(sqlSession.insert(NAMESPACE + ".insertRoom",vo)==1) {
				result = sqlSession.selectOne(NAMESPACE + ".selectLastRoomId");
				logger.debug("msDAO : 두 이용자의 기존 채팅방이 없어 새롭게 생성하였습니다. room_id:" +result);
			}
			
		return result;
	}

	@Override
	public int insert_participant_1on1(MessageVO vo) {
		logger.debug("msDAO : 1대1 채팅방이 생성되었습니다." + vo.getSender().getEmp_id() + "," + vo.getReceiver().getEmp_id());
		return sqlSession.insert(NAMESPACE + ".intoRoom_1for1",vo);
	}

	@Override
	public int insert_message(MessageVO vo) {
		logger.debug("msDAO : "+ vo.getRoom_id()+" 채팅방에 새로운 메세지가 입력되었습니다." + vo.getSender().getEmp_id());
		return sqlSession.insert(NAMESPACE + ".sendMessage",vo);
	}
	
	

}
