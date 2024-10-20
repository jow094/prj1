package com.project.service;

import java.util.List;

import com.project.domain.MemberVO;
import com.project.domain.MessageVO;

public interface MessageService {
	
	public List<MessageVO> openChatRoom(String msg_reader, Integer room_id);
	public List<MessageVO> openPersonalChat(String sender_emp_id, String receiver_emp_id);
	public int createChatRoom(MessageVO vo);
	public int createPartyRoom(MessageVO vo);
	public void enterRoom(MessageVO vo);
	public void exitRoom(MessageVO vo);
	public void changeRoomName(MessageVO vo);
	public void cutRoomName(MessageVO vo);
	public void sendMessage(MessageVO vo);
	public List<MessageVO> getChatRoomList(String emp_id, String emp_name);
	public List<MessageVO> searchRoom(String emp_id, String keyword);
	public List<MessageVO> getMessageUnreadAlarm(String emp_id);
	public List<MessageVO> getMessageRealtimeAlarm(String emp_id);
	public void systemMessage(MessageVO vo);
	public int countParticipant(int room_id);
	public MessageVO checkRoomInfo(int room_id);
}
