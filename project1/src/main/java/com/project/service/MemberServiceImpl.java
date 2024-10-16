package com.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.MemberVO;
import com.project.persistence.MemberDAO;

// @Service : 서비스영역 (비지니스 로직 영역)에서의 동작을 구현하도록 설정
// 			  root-context.xml에 빈(MemberService)으로 등록


/*
 * 비지니스 영역, Action 페이지, pro.jsp 동작을 처리하는 공간
 *   => 컨트롤러와 DAO를 연결하는 다리 역할을 함  / 완충영역
 *   => 고객사마다 유연한 대처가 가능
 * 
 */


@Service
public class MemberServiceImpl implements MemberService{

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	// MemberDAO 객체 주입
	@Autowired
	private MemberDAO mdao;
	
	@Override
	public MemberVO memberLogin(MemberVO vo) {
		return mdao.checkMember(vo);
	}
	
	@Override
	public MemberVO memberInfo(String userid) {
		logger.debug(" memberInfo(String userid) 실행)");

		return mdao.getMember(userid);
	};
	
	@Override
	public List<MemberVO> memberSearch(String keyword) {
		logger.debug(" memberSearch(String keyword) 실행)");
		return mdao.getMemberList(keyword);
	}

	@Override
	public List<MemberVO> getTeammate(String emp_id) {
		return mdao.getTeamList(emp_id);
	};
	
}
