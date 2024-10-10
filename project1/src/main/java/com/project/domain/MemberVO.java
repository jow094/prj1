package com.project.domain;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *  VO (Value Object) : 데이터 저장 객체 (값을 저장하는 동작 이외의 동작O)
 *  DTO (Data Transfer Object) : 데이터 전송 객체  (값을 저장하는 동작 이외의 동작X)
 *  
 *  
 * tbl_member 테이블정보를 저장하는 객체  
 */
//@Data  set/get메서드 자동생성
//@Setter
//@Getter
//@NoArgsConstructor
//@AllArgsConstructor
//@ToString

@Data
public class MemberVO {
	
//	private String Uid;
	//private String uId; //getUId() (x)
	//private String userId; //getUserId() (o)
	
	private String id;
	private String cid;
	private String pw;
	private String profile;
	private String username;
	private Date birth;
	private String gender;
	private String tel;
	private String email;
	private String addr;
	private String dnum;
	private String position;
	private String job_id;
	private int status;
	private int bnum;
	private int work_type;
	private String salary;
	private String account_num;
	private String bank_name;
	private String account_name;
	private Date start_date;
	private Date break_date;
	private Date restart_date;
	private Date quit_date;
	private String power;
	private int level;
	
	

}
