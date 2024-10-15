package com.project.web;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.MemberVO;
import com.project.persistence.MemberDAO;
import com.project.service.MemberService;

//@RequestMapping(value = "/member/*")
// => 특정 동작의 형태를 구분 (~.me, ~.bo,~.do)

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	// 객체 주입
	//@Inject
	//private MemberDAO mdao;
	
	@Inject
	private MemberService mService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 로그인 처리 -입력
		// http://localhost:8088/member/login
		@RequestMapping(value = "/login",method = RequestMethod.GET)
		public String loginMemberGet(MemberVO vo) {
			logger.debug(" /member/login -> loginMemberGET()실행 ");
			logger.debug(" 연결된 뷰페이지(jsp) 출력");
			
			return "/member/loginForm";
		}
	
	// 로그인 처리 -처리(post)
		// http://localhost:8088/member/login
		
		@RequestMapping(value = "/login",method = RequestMethod.POST)
		public String loginMemberPost(MemberVO vo,HttpSession session) {
	  //public String loginMemberPost(@RequestParam("userid") String userid, @ModelAttribute("userpw") String userpw {
			logger.debug(" /member/login(post) -> loginMemberPOST()실행 ");

			// 전달정보(파라메터) 저장
			logger.debug(" vo :"+vo);
			
			// MemberDAO 객체 생성 => 객체 주입
			MemberVO resultVO = mService.memberLogin(vo);
			
			if(resultVO == null){
				logger.debug(" 로그인 실패, 다시 로그인 페이지로 이동 ");
				return "redirect:/member/login";
			}
			
			//사용자의 아이디 정보를 세션 영역에 저장
			session.setAttribute("userid", resultVO.getEmp_id());
	
			logger.debug(" 로그인 성공, 메인페이지로 이동 ");
			
			return "redirect:/member/main";
		}
	
		// 로그아웃 - GET(정보입력,조회,출력)/POST(처리:insert,update,delete/form태그로 정보 보낼때/db에 영향을 줄때)
		@RequestMapping(value = "/logout",method = RequestMethod.GET)
		public String logoutMemberGET(HttpSession session) {
			logger.debug(" /member/logout -> logoutMemberGET() 실행");
			
			// 로그아웃 처리 => 세션정보 초기화
			session.invalidate();
			logger.debug(" 로그아웃, 사용자 정보 삭제");
			
			// 페이지 이동
			return "redirect:/member/main";
		}
		
		@RequestMapping(value = "/memberInfoModal",method = RequestMethod.GET)
		@ResponseBody
		public MemberVO memberInfoModal(String emp_id) {
			logger.debug("/member/memberInfoModal -> memberInfoModal() 실행");
			logger.debug(" 조회 대상 아이디 : "+emp_id);
			
			MemberVO resultVO = mService.memberInfo(emp_id);
			logger.debug(" 조회 결과 : "+resultVO);
			
			return resultVO;
		}
		
		@RequestMapping(value = "/search",method = RequestMethod.GET)
		@ResponseBody
		public List<MemberVO> searchToMember(String keyword) {
			logger.debug(" /member/search -> searchToMember("+keyword+"); 실행");
			
			List<MemberVO> memberList = mService.memberSearch(keyword);
			return memberList;
		}
		
		
}
