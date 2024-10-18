package com.project.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class MessageVO {
	private int msg_id;
	private Timestamp msg_date;
	private String msg_reader;
	private int msg_unread_count;
	private String msg_content;
	
	private int room_id;
	private String room_name;
	private String room_admin;
	private Timestamp room_created_date;
	private String room_last_message;
	private Timestamp room_last_message_date;
	private Timestamp room_join_date;
	
	private String enter_emp_id;
	private String personal_sender_emp_id;
	private String personal_sender_emp_name;
	private String personal_receiver_emp_id;
	private String personal_receiver_emp_name;
	private MemberVO msg_sender;
	private List<MemberVO> room_people;
}
