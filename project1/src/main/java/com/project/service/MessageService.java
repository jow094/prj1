package com.project.service;

import java.util.List;

import com.project.domain.MemberVO;
import com.project.domain.MessageVO;

public interface MessageService {
	
	public List<MessageVO> openChatRoom(Integer room_id);
	public List<MessageVO> openPersonalChat(String sender_emp_id, String receiver_emp_id);
	public int createChatRoom(MessageVO vo);
	public void enterRoom(MessageVO vo);
	public void sendMessage(MessageVO vo);
	public List<MessageVO> getChatRoomList(String emp_id);
	
}
