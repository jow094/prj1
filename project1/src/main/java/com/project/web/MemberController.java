package com.project.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	// http://localhost:8088/web/test
	// http://localhost:8088/web/member/test (x)
	// http://localhost:8088/member/test (o)
	//	@RequestMapping(value = "/test",method = RequestMethod.GET)
	//	public void test() {
	//		logger.debug("test()실행");
	//	}
	
	
	// 회원가입 - 정보입력
	// http://localhost:8088/member/join
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public void joinMemberGet() {
		logger.debug(" /join -> joinMemberGet() 실행 ");
		logger.debug(" 연결된 뷰(JSP)를 보여주기 ");
		// 페이지 이동(X) => 스프링이 자동으로 연결
		logger.debug(" /views/member/join.jsp 뷰페이지 연결 ");
	}
	
	// 회원가입 - 정보처리
	// http://localhost:8088/member/join
	//@RequestMapping(value = "/joinMemberAction",method = RequestMethod.POST)
	@RequestMapping(value = "/join",method = RequestMethod.POST)
	public String joinMemberPost(MemberVO vo) {
		logger.debug(" /member/join -> joinMemberPost()실행 ");
		// 한글 인코딩처리 => web.xml 필터로 처리
		
		// 전달정보(파라메터) 저장
		logger.debug(" vo :"+vo);
		
		// DB 객체 생성 - 회원가입
		// MemberDAO 객체 생성 => 객체 주입
		// mdao.insertMember(vo)를 컨트롤러에서 직접 호출하지 않는다.
		mService.memberJoin(vo);
		logger.debug(" 회원가입 성공 ");
		logger.debug(" 로그인 페이지로 이동 : /member/login");
		
		return "redirect:/member/login";
	}
	
	
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
			session.setAttribute("userid", resultVO.getUserid());
	
			logger.debug(" 로그인 성공, 메인페이지로 이동 ");
			
			return "redirect:/member/main";
		}
	
		
		// 메인페이지 - GET
		// http://localhost:8088/member/main
		@RequestMapping(value = "/main",method = RequestMethod.GET)
		public void mainMemberGET() {
			logger.debug(" /member/main -> mainMemberGET()실행 ");
			logger.debug(" 연결된 뷰페이지 (views/member/main.jsp)로 이동 ");
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
		
		// 회원정보 조회 - GET
		
		@RequestMapping(value = "/info",method = RequestMethod.GET)
		public void infoMemberGET(HttpSession session, Model model) {
			logger.debug("/member/info -> infoMemberGET() 실행");

			// 서비스 -> DAO : 특정 아이디를 기준으로 회원 정보 조회
			String userid = (String)session.getAttribute("userid");
			logger.debug(" 조회 대상 아이디 : "+userid);
			MemberVO resultVO = mService.memberInfo(userid);
			logger.debug(" vo : "+resultVO);
			
			// 서비스에서 가져온 데이터를 연결된 뷰페이지에 전달해서 출력
			// model.addAttribute(resultVO); 이렇게 이름없이 전달하면 MemberVO 타입이니까 memberVO 라는 이름으로 전달됨
			model.addAttribute("resultVO",resultVO);
			logger.debug(" 연결된 뷰 페이지 이동");
			
		}
		
		// 회원정보 수정 - 입력 (GET)
		
		@RequestMapping(value = "/update",method = RequestMethod.GET)
		public String updateMemberGET(HttpSession session,Model model) {
			logger.debug(" /member/update -> updateMemberGET(); 실행");
			logger.debug(" DB에서 기존의 회원정보 가져오기" );
			// 서비스 -> DAO : 회원정보 가져오기
			
			String userid = (String)session.getAttribute("userid");
			logger.debug(" 조회 대상 아이디 : "+userid);
			MemberVO resultVO = mService.memberInfo(userid);
			logger.debug(" vo : "+resultVO);
			
			// 서비스에서 가져온 데이터를 연결된 뷰페이지에 전달해서 출력
			model.addAttribute("resultVO",resultVO);
			
			logger.debug(" 연결된 뷰 페이지 출력(/views/member/update.jsp) ");
			
			return "/member/update";
		}
		
		// 회원정보 수정 - 처리 (POST)
		@RequestMapping(value = "/update",method = RequestMethod.POST)
		public String updateMemberPOST(MemberVO uvo) {
			logger.debug(" /member/update -> updateMemberPOST(); 실행");
			logger.debug(" 입력받은 비밀번호를 확인 후, 입력받은 정보를 DB에 업데이트 하기" );
			logger.debug(" 전달받은 정보를 매개변수로 vo에 저장하였음." );
			logger.debug(" vo : "+uvo );
			
			logger.debug(" 연결된 뷰 페이지 출력(/views/member/main) ");
			
			int result = mService.memberUpdate(uvo);
			
			if(result == 0) {
				return "redirect:/member/update";
			}
			
			return "redirect:/member/main";
		}
		
		// 회원정보 삭제 - 입력 (GET)
		
				@RequestMapping(value = "/delete",method = RequestMethod.GET)
				public String deleteMemberGET(HttpSession session,String id) {
					logger.debug(" /member/update -> updateMemberGET(); 실행");
					
					String userid = (String)session.getAttribute("userid");
					logger.debug(" 삭제 대상 아이디 : "+userid);
					
					// 서비스에서 가져온 데이터를 연결된 뷰페이지에 전달해서 출력
					logger.debug(" 연결된 뷰 페이지 출력(/views/member/delete.jsp) ");
					
					return "/member/delete";
				}
		
		// 회원정보 삭제 - 처리 (POST)
				@RequestMapping(value = "/delete",method = RequestMethod.POST)
				public String deleteMemberPOST(HttpSession session,MemberVO vo) {
					logger.debug(" /member/delete -> deleteMemberPOST(); 실행");
					
					int result = mService.memberDelete(vo);
					
					if(result == 0) {
						return "redirect:/member/delete";
					}
					
					session.invalidate();
					return "redirect:/member/main";
				}
		
		// 회원목록 조회 (GET)
		
			@RequestMapping(value = "/list",method = RequestMethod.GET)
			public void listMemberGET(Model model) {
				logger.debug(" /member/list -> listMemberGET(); 실행");
				
				//서비스 -> DAO : 회원 목록 정보 가져오기
				List<MemberVO> memberList = mService.memberList();
				//연결된 view 페이지로 전달해서 출력
				model.addAttribute("memberList",memberList);
				
				
			}
		
		
}
