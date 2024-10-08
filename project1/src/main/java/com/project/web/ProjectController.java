package com.project.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.MemberVO;
import com.project.domain.WorkflowVO;
import com.project.persistence.MemberDAO;
import com.project.service.MemberService;
import com.project.service.WorkflowService;

//@RequestMapping(value = "/member/*")
// => 특정 동작의 형태를 구분 (~.me, ~.bo,~.do)

@Controller
@RequestMapping(value = "/project/*")
public class ProjectController {
	
	// 객체 주입
	//@Inject
	//private MemberDAO mdao;
	
	@Inject
	private WorkflowService wService;

	@Inject
	private MemberService mService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	// http://localhost:8088/web/test
	// http://localhost:8088/web/member/test (x)
	// http://localhost:8088/member/test (o)
	//	@RequestMapping(value = "/test",method = RequestMethod.GET)
	//	public void test() {
	//		logger.debug("test()실행");
	//	}
	
		// 메인페이지 - GET
		// http://localhost:8088/project/main
		@RequestMapping(value = "/main",method = RequestMethod.GET)
		public void mainGET() {
			logger.debug(" /project/main -> mainGET()실행 ");
			logger.debug(" 연결된 뷰페이지 (views/project/main.jsp)로 이동 ");
		}
	
		// http://localhost:8088/project/workflow
		@RequestMapping(value = "/workflow",method = RequestMethod.GET)
		public void workflowGET(HttpSession session, Model model) {
			logger.debug(" /project/workflow -> workflowGET()실행 ");
			logger.debug(" 연결된 뷰페이지 (views/project/workflow.jsp)로 이동 ");
			
			String userid = (String)session.getAttribute("userid");
			logger.debug(" workflow 조회 대상 아이디 : "+userid);
			
			List<WorkflowVO> sentWorkflowList = wService.showSentWorkflowList(userid,"1");
			List<WorkflowVO> receivedWorkflowList = wService.showReceivedWorkflowList(userid,"1");
			
			// 서비스에서 가져온 데이터를 연결된 뷰페이지에 전달해서 출력
			// model.addAttribute(resultVO); 이렇게 이름없이 전달하면 MemberVO 타입이니까 memberVO 라는 이름으로 전달됨
			model.addAttribute("sentWorkflowList",sentWorkflowList);
			model.addAttribute("receivedWorkflowList",receivedWorkflowList);
		}
		
		// http://localhost:8088/project/workoff
		@RequestMapping(value = "/workoff",method = RequestMethod.GET)
		public void workoffGET(HttpSession session, Model model) {
			logger.debug(" /project/workoff -> workoffGET()실행 ");
			logger.debug(" 연결된 뷰페이지 (views/project/workoff.jsp)로 이동 ");
			
			String userid = (String)session.getAttribute("userid");
			logger.debug(" workflow 조회 대상 아이디 : "+userid);
			
			List<WorkflowVO> sentWorkflowList = wService.showSentWorkflowList(userid,"0");
			List<WorkflowVO> receivedWorkflowList = wService.showReceivedWorkflowList(userid,"0");
			
			// 서비스에서 가져온 데이터를 연결된 뷰페이지에 전달해서 출력
			// model.addAttribute(resultVO); 이렇게 이름없이 전달하면 MemberVO 타입이니까 memberVO 라는 이름으로 전달됨
			model.addAttribute("sentWorkflowList",sentWorkflowList);
			model.addAttribute("receivedWorkflowList",receivedWorkflowList);
		}
		
		// http://localhost:8088/project/wfread
		@RequestMapping(value = "/wfread",method = RequestMethod.GET)
		@ResponseBody
		public Map<String, Object> wfReadGET(@RequestParam("wf_code") String wfCode) {
			logger.debug(" /project/wfread -> wfReadGET()실행 ");
			
			logger.debug(" 조회 대상 wf_code : "+wfCode);
			
			
			WorkflowVO resultWVO = wService.showWorkflow(wfCode);
			MemberVO senderMVO = mService.memberInfo(resultWVO.getWf_sender());
			MemberVO receiverMVO = mService.memberInfo(resultWVO.getWf_receiver());
			MemberVO receiverMVO1 = mService.memberInfo(resultWVO.getWf_receiver_1st());
			MemberVO receiverMVO2 = mService.memberInfo(resultWVO.getWf_receiver_2nd());
			MemberVO receiverMVO3 = mService.memberInfo(resultWVO.getWf_receiver_3rd());
			
			Map<String, Object> resultMap = new HashMap<String,Object>();
			
			resultMap.put("resultWVO",resultWVO);
			resultMap.put("senderMVO",senderMVO);
			resultMap.put("receiverMVO",receiverMVO);
			resultMap.put("receiverMVO1",receiverMVO1);
			resultMap.put("receiverMVO2",receiverMVO2);
			resultMap.put("receiverMVO3",receiverMVO3);
			
			// 서비스에서 가져온 데이터를 연결된 뷰페이지에 전달해서 출력
			// model.addAttribute(resultVO); 이렇게 이름없이 전달하면 MemberVO 타입이니까 memberVO 라는 이름으로 전달됨
			logger.debug(" ajax로 보낼 리턴값 : "+resultMap);
			return resultMap;
		}
		
		// workflow 응답하기 - POST
		// http://localhost:8088/project/wfresponse
		@RequestMapping(value = "/wfresponse",method = RequestMethod.POST)
		public String wfResponsePOST(WorkflowVO uvo) {
			logger.debug(" /project/wfresponse -> wfResponseGET()실행 ");
			logger.debug("전달받은 uvo.wf_code :"+ uvo.getWf_code());
			logger.debug(" uvo.wf_result : "+uvo.getWf_result());
			logger.debug(" uvo.wf_comment : "+uvo.getWf_comment());
			
			WorkflowVO responseVO = wService.showWorkflow(uvo.getWf_code());
			responseVO.setWf_result(uvo.getWf_result());
			responseVO.setWf_comment(uvo.getWf_comment());
			
			logger.debug(" 업로드 할 responseVO : "+ responseVO.toString());
			wService.responseWorkflow(responseVO);
			
			return "redirect:/project/workoff";
		}
		
		
		// 로그인 처리 -입력
				// http://localhost:8088/project/login
				@RequestMapping(value = "/login",method = RequestMethod.GET)
				public String loginGet(MemberVO vo) {
					logger.debug(" /project/login(GET) -> loginGET()실행 ");
					logger.debug(" /project/loginForm.jsp");
					
					return "/project/loginForm";
				}
			
		// 로그인 처리 -처리(post)
				// http://localhost:8088/project/login
			
		@RequestMapping(value = "/login",method = RequestMethod.POST)
		public String loginPost(MemberVO vo,HttpSession session, Model model) {
	    //public String loginMemberPost(@RequestParam("userid") String userid, @ModelAttribute("userpw") String userpw {
			logger.debug(" /project/login(POST) -> loginPOST()실행 ");

			// 전달정보(파라메터) 저장
			logger.debug(" vo :"+vo);
		
		 MemberVO resultVO = mService.memberLogin(vo);
		
		 if(resultVO == null){ logger.debug(" 로그인 실패, 다시 로그인 페이지로 이동 "); 
		 return "redirect:/project/login"; }
		 
		 
		  //사용자의 아이디 정보를 세션 영역에 저장 
		 
		 session.setAttribute("userid",resultVO.getEmp_id());
		 
		 logger.debug(" 로그인 성공, 메인페이지로 이동 ");
		 
			return "redirect:/project/main";
		}
	
}
