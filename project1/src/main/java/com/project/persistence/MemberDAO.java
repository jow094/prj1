package com.project.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.project.domain.MemberVO;

/**
 *	tbl_memeber 테이블의 데이터를 활용하는 동작을 정의 
 *
 */
public interface MemberDAO {

	// 디비서버 시간조회
	//@Select("select now()")
	public String getTime();
	
	// 회원가입
	public void insertMember(MemberVO vo);
	
	// 로그인
	public MemberVO checkMember(MemberVO vo);
	public MemberVO checkMember(String userid,String userpw);
	
	// 사용자 정보조회
	public MemberVO getMember(String userid);
	
	// 사용자 정보수정
	public int updateMember(MemberVO uvo);
	
	// 사용자 정보삭제
	public Integer deleteMember(MemberVO dvo);
	
	// 사용자 정보 목록조회
	public List<MemberVO> getMemberList();
	
	
	
	
	
}
