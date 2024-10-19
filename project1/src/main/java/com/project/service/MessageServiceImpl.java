package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.MemberVO;
import com.project.domain.MessageVO;
import com.project.persistence.MemberDAO;
import com.project.persistence.MessageDAO;

// @Service : 서비스영역 (비지니스 로직 영역)에서의 동작을 구현하도록 설정
// 			  root-context.xml에 빈(MemberService)으로 등록

/*
 * 비지니스 영역, Action 페이지, pro.jsp 동작을 처리하는 공간
 *   => 컨트롤러와 DAO를 연결하는 다리 역할을 함  / 완충영역
 *   => 고객사마다 유연한 대처가 가능
 * 
 */

@Service
public class MessageServiceImpl implements MessageService{

	private static final Logger logger = LoggerFactory.getLogger(MessageServiceImpl.class);
	
	// MemberDAO 객체 주입
	@Autowired
	private MessageDAO msgdao;
	
	@Inject
	private MemberDAO mdao;
	
	@Override
	public List<MessageVO> openPersonalChat(String sender_emp_id, String receiver_emp_id) {
		logger.debug("msgServiceImpl : openPersnalChat ("+sender_emp_id+", "+receiver_emp_id+") 실행");
		
		return msgdao.join_messages(sender_emp_id,msgdao.check_personal_chat(sender_emp_id, receiver_emp_id));
	}

	@Override
	public List<MessageVO> openChatRoom(String msg_reader,Integer room_id) {
		logger.debug("msgServiceImpl : openChatRoom ("+msg_reader+","+room_id+")실행");
		
		return msgdao.join_messages(msg_reader, room_id);
	}
	
	@Override
	public int createChatRoom(MessageVO vo) {
		logger.debug("msgServiceImpl : createChatRoom 실행");
		return msgdao.insert_msg_room(vo);
	}
	
	@Override
	public void enterRoom(MessageVO vo) {
		logger.debug("msgServiceImpl : enterRoom 실행");
		msgdao.insert_participant(vo);
		logger.debug("msgServiceImpl : "+vo.getRoom_id()+"번 채팅방에 "+vo.getEnter_emp_id()+"사용자가 입장하였습니다.");
	}
	
	@Override
	public void sendMessage(MessageVO vo) {
		logger.debug("msgServiceImpl : sendMessage 실행");
		msgdao.insert_message(vo);
		msgdao.update_room_info(vo);
	}

	@Override
	public List<MessageVO> getChatRoomList(String emp_id) {
		return msgdao.select_rooms(emp_id);
	}

	@Override
	public List<MessageVO> searchRoom(String emp_id, String keyword) {
			
		return msgdao.search_into_rooms(emp_id,keyword);
	}
}
