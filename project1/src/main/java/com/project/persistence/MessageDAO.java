package com.project.persistence;

import java.util.List;

import com.project.domain.MessageVO;

public interface MessageDAO {

	public int check_msg_room(MessageVO vo);
	public int insert_participant(MessageVO vo);
	public int insert_message(MessageVO vo);
	public List<MessageVO> join_messages(MessageVO vo);
}
