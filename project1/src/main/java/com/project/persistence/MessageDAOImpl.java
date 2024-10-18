package com.project.persistence;

import java.util.List;

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
	public int check_msg_room(MessageVO vo) {
		logger.debug("msgDAO : "+ vo.getSender().getEmp_id() + " 회원과 " + vo.getReceiver().getEmp_id() + " 회원 간 기존 1대1 채팅방 존재여부를 확인합니다.");
		
		Integer result = sqlSession.selectOne(NAMESPACE + ".findRoom", vo);
		if (result == null) {
		    result = 0;  //
		}
		
		logger.debug("msgDAO : 검증 결과 room_id = " +result);
			
			if(result>0) {
				logger.debug("msgDAO : 두 이용자의 기존 채팅방이 있습니다. 해당 방 id를 반환합니다.");
				return result;
			}
			
			if(sqlSession.insert(NAMESPACE + ".createRoom",vo)==1) {
				result = sqlSession.selectOne(NAMESPACE + ".selectLastRoomId");
				logger.debug("msgDAO : 두 이용자의 기존 채팅방이 없어 새롭게 생성하였습니다. room_id:" +result);
			}
			
		return result;
	}

	@Override
	public int insert_participant(MessageVO vo) {
		logger.debug("msgDAO :" + vo.getReceiver().getEmp_id() + "회원이 " + vo.getRoom_id() + "채팅방에 입장하였습니다.");
		return sqlSession.insert(NAMESPACE + ".insertRoom_participant_1for1",vo);
	}

	@Override
	public int insert_message(MessageVO vo) {
		logger.debug("msgDAO : "+ vo.getRoom_id()+" 채팅방에 새로운 메세지가 입력되었습니다." + vo.getSender().getEmp_id());
		return sqlSession.insert(NAMESPACE + ".sendMessage",vo);
	}

	@Override
	public List<MessageVO> join_messages(MessageVO vo) {
		List<MessageVO> result = sqlSession.selectList(NAMESPACE + ".getMessages");
		
		logger.debug("msgDAO : "+ vo.getRoom_id()+" 채팅방에  "+ result.size() +"개의 메세지가 있습니다.");
		return result;
	}
	
	

}
