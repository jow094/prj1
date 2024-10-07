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
	public void memberJoin(MemberVO vo) {
		logger.debug("컨트롤러 -> 서비스");
		logger.debug("회원가입 메서드 memberJoin(MemberVO vo) 실행");
		
		logger.debug("서비스 -> DAO");
		mdao.insertMember(vo);
		logger.debug("DAO -> 서비스");
		logger.debug("서비스 -> 컨트롤러");
	}
	
	@Override
	public MemberVO memberLogin(MemberVO vo) {
		logger.debug("컨트롤러 -> 서비스");
		logger.debug("로그인 메서드 memberLogin(MemberVO vo) 실행");
		logger.debug("서비스 -> DAO");
		logger.debug("DAO -> 서비스");
		logger.debug("서비스 -> 컨트롤러");
		
		return mdao.checkMember(vo);
	}
	
	@Override
	public MemberVO memberInfo(String userid) {
		logger.debug(" memberInfo(String userid) 실행)");
		//DAO에 있는 회원정보 조회 메서드 호출 결과 리턴

		return mdao.getMember(userid);
	};
	
	@Override
	public int memberUpdate(MemberVO uvo) {
		logger.debug(" memberUpdate(MemberVO uvo) 실행)");
		
		return mdao.updateMember(uvo);
	};
	
	@Override
	public int memberDelete(MemberVO vo) {
		logger.debug(" memberDelete(MemberVO vo) 실행)");
		
		return mdao.deleteMember(vo);
	};
	
	@Override
	public List<MemberVO> memberList() {
		logger.debug(" memberList() 실행)");
		
		return mdao.getMemberList();
	};
	
}
