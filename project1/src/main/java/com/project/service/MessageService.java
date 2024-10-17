package com.project.service;

import java.util.List;

import com.project.domain.MemberVO;
import com.project.domain.MessageVO;

public interface MessageService {
	
	public List<MessageVO> openChatRoom(MessageVO vo);

}
