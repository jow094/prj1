package com.project.service;

import java.util.List;

import com.project.domain.MemberVO;

public interface MemberService {
	
	public MemberVO memberLogin(MemberVO vo);
	
	public MemberVO memberInfo(String userid);
	
	public List<MemberVO> memberSearch(String keyword);

}
