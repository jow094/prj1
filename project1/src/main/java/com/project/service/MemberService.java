package com.project.service;

import java.util.List;

import com.project.domain.MemberVO;

public interface MemberService {
	
	// 사용자의 처리 로직을 구현
	
	// 회원가입 동작
	public void memberJoin(MemberVO vo);
	
	// 로그인 동작
	public MemberVO memberLogin(MemberVO vo);
	
	// 회원정보 조회
	public MemberVO memberInfo(String userid);
	
	// 회원정보 수정
	public int memberUpdate(MemberVO uvo);
	
	// 회원정보 삭제
	public int memberDelete(MemberVO uvo);
	
	// 회원정보 목록
	public List<MemberVO> memberList();

}
