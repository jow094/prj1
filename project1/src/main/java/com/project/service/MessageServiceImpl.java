package com.project.service;

import java.util.List;

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

	@Override
	public List<MessageVO> openChatRoom(MessageVO vo) {
		logger.debug("msgDAO : "+msgdao);
		logger.debug("msgServiceImpl : openChatRoom ("+vo+"실행");
		
		vo.setRoom_id(msgdao.check_msg_room(vo));
		try {
			msgdao.insert_participant(vo);
		    // 추가 동작
		} catch (Exception e) {
			logger.debug("기존의 참가자입니다.");
		}
		
		return msgdao.join_messages(vo);
	}
	
}
