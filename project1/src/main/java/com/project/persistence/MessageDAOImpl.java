package com.project.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int check_personal_chat(String sender_emp_id, String receiver_emp_id) {
		/*
		 * logger.debug("msgDAO : "+ vo.getSender().getEmp_id() + " 회원과 " +
		 * vo.getReceiver().getEmp_id() + " 회원 간 기존 1대1 채팅방 존재여부를 확인합니다.");
		 */
		
		Map<String, String> people = new HashMap<String, String>();
	    people.put("sender_emp_id", sender_emp_id);
	    people.put("receiver_emp_id", receiver_emp_id);

	    Integer result = sqlSession.selectOne(NAMESPACE + ".findRoom", people);
	    
		if (result == null) {
			result = 0;
			logger.debug("msgDAO : "+sender_emp_id+" 와  "+receiver_emp_id+ " 두 이용자의 기존 채팅방이 없습니다. "+ result +"를 반환합니다.");
		}
		
		logger.debug("msgDAO : 검증 결과 room_id = " +result);
			
		if(result>0) {
			logger.debug("msgDAO : "+sender_emp_id+" 와 "+receiver_emp_id+ "두 이용자의 기존 채팅방이 있습니다. 해당 방 id를 반환합니다.");
		}
			
		return result;
	}

	@Override
	public void insert_participant(MessageVO vo) {
		sqlSession.insert(NAMESPACE + ".insertParticipant",vo);
	}

	@Override
	public int insert_message(MessageVO vo) {
		return sqlSession.insert(NAMESPACE + ".sendMessage",vo);
	}

	@Override
	public List<MessageVO> join_messages(Integer room_id) {
		logger.debug("msgDAO : "+ room_id +" 번 채팅방의 메세지를 가져옵니다.");
		List<MessageVO> result = sqlSession.selectList(NAMESPACE + ".getMessages",room_id);
		logger.debug("msgDAO : "+ room_id +" 번 채팅방에  "+ result.size() +"개의 메세지가 있습니다.");
		return result;
	}

	@Override
	public int insert_msg_room(MessageVO vo) {
		sqlSession.selectList(NAMESPACE + ".insertMsgRoom",vo);
		logger.debug("msgDAO : 채팅방을 생성했습니다. 참가자 id :"+vo.getPersonal_sender_emp_id()+", "+vo.getPersonal_receiver_emp_id());
		return sqlSession.selectOne(NAMESPACE + ".selectLastRoomId");
	}

	@Override
	public List<MessageVO> select_rooms(String emp_id) {
		return sqlSession.selectList(NAMESPACE + ".selectChatList",emp_id);
	}
	
}
