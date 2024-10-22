package com.project.service;

import java.util.List;

import com.project.domain.MemberVO;
import com.project.domain.SettingVO;

public interface MemberService {
	
	public MemberVO memberLogin(MemberVO vo);
	
	public MemberVO memberInfo(String userid);
	
	public List<MemberVO> memberSearch(String keyword);
	
	public List<MemberVO> getTeammate(String emp_id);
	
	public List<SettingVO> searchTools(String keyword);
}
