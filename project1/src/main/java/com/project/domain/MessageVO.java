package com.project.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class MessageVO {
	private int msg_id;
	private Timestamp msg_date;
	private String msg_reader;
	private String msg_content;
	
	private int room_id;
	private String room_name;
	private String room_role;
	private Timestamp room_created_date;
	private Timestamp room_last_message_date;
	private Timestamp room_join_date;
	
	private MemberVO sender;
	private MemberVO receiver;
	private List<MemberVO> receivers;
}
