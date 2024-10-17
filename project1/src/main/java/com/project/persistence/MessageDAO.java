package com.project.persistence;

import com.project.domain.MessageVO;

public interface MessageDAO {

	public int validate_room(MessageVO vo);
	public int insert_participant_1on1(MessageVO vo);
	public int insert_message(MessageVO vo);
	
}
