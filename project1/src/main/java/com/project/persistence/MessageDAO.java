package com.project.persistence;

import java.util.List;

import com.project.domain.MessageVO;

public interface MessageDAO {

	public int check_personal_chat(String sender_emp_id, String receiver_emp_id);
	public void insert_participant(MessageVO vo);
	public int insert_message(MessageVO vo);
	public List<MessageVO> join_messages(Integer room_id);
	public int insert_msg_room(MessageVO vo);
	public List<MessageVO> select_rooms(String emp_id);
}
