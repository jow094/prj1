package com.project.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.project.domain.MemberVO;
import com.project.domain.SettingVO;

/**
 *	tbl_memeber 테이블의 데이터를 활용하는 동작을 정의 
 *
 */
public interface MemberDAO {

	// 로그인
	public MemberVO checkMember(MemberVO vo);
	
	// 사용자 정보조회
	public MemberVO getMember(String userid);
	
	// 사용자 정보 목록조회
	public List<MemberVO> getMemberList(String keyword);
	
	public List<MemberVO> getTeamList(String emp_id);
	
	public List<SettingVO> getToolList(String emp_id);
}
