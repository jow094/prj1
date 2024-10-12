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
import com.project.domain.WorkflowAlarmVO;
import com.project.domain.WorkflowVO;
import com.project.persistence.MemberDAO;
import com.project.service.MemberService;
import com.project.service.WorkflowAlarmService;
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
	private MemberService mService;
	
	@Inject
	private WorkflowService wService;

	@Inject
	private WorkflowAlarmService waService;

	
	
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
			
			String emp_id = (String)session.getAttribute("emp_id");
			logger.debug(" workflow 조회 대상 아이디 : "+emp_id);
			
			List<WorkflowVO> sentWorkflowList = wService.showSentWorkflowList(emp_id,"1");
			List<WorkflowVO> receivedWorkflowList = wService.showReceivedWorkflowList(emp_id,"1");
			
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
			
			String emp_id = (String)session.getAttribute("emp_id");
			logger.debug(" workflow 조회 대상 아이디 : "+emp_id);
			
			List<WorkflowVO> sentWorkflowList = wService.showSentWorkflowList(emp_id,"0");
			List<WorkflowVO> receivedWorkflowList = wService.showReceivedWorkflowList(emp_id,"0");
			
			// 서비스에서 가져온 데이터를 연결된 뷰페이지에 전달해서 출력
			// model.addAttribute(resultVO); 이렇게 이름없이 전달하면 MemberVO 타입이니까 memberVO 라는 이름으로 전달됨
			model.addAttribute("sentWorkflowList",sentWorkflowList);
			model.addAttribute("receivedWorkflowList",receivedWorkflowList);
		}
		
		// http://localhost:8088/project/readWorkflow
		@RequestMapping(value = "/readWorkflow",method = RequestMethod.GET)
		@ResponseBody
		public Map<String, Object> readWorkflow(@RequestParam("wf_code") String wfCode, HttpSession session) {
			logger.debug(" /project/readWorkflow -> readWorkflow()실행 ");
			
			logger.debug(" 조회 대상 wf_code : "+wfCode);
			
			String emp_id = (String)session.getAttribute("emp_id");
			WorkflowVO workflowVO = wService.showWorkflow(wfCode);
			MemberVO senderVO = mService.memberInfo(workflowVO.getWf_sender());
			MemberVO receiverVO = mService.memberInfo(workflowVO.getWf_receiver());
			MemberVO receiver_1st_VO = mService.memberInfo(workflowVO.getWf_receiver_1st());
			MemberVO receiver_2nd_VO = mService.memberInfo(workflowVO.getWf_receiver_2nd());
			MemberVO receiver_3rd_VO = mService.memberInfo(workflowVO.getWf_receiver_3rd());
			
			Map<String, Object> resultMap = new HashMap<String,Object>();
			
			resultMap.put("login_id",emp_id);
			resultMap.put("workflowVO",workflowVO);
			resultMap.put("senderVO",senderVO);
			resultMap.put("receiverVO",receiverVO);
			resultMap.put("receiver_1st_VO",receiver_1st_VO);
			resultMap.put("receiver_2nd_VO",receiver_2nd_VO);
			resultMap.put("receiver_3rd_VO",receiver_3rd_VO);
			
			// 서비스에서 가져온 데이터를 연결된 뷰페이지에 전달해서 출력
			// model.addAttribute(resultVO); 이렇게 이름없이 전달하면 MemberVO 타입이니까 memberVO 라는 이름으로 전달됨
			logger.debug(" ajax로 보낼 리턴값 : "+resultMap);
			return resultMap;
		}
		
		// workflow 응답하기 - POST
		// http://localhost:8088/project/wfresponse
		@RequestMapping(value = "/wfresponse",method = RequestMethod.POST)
		public String responseWorkflow(WorkflowVO uvo) {
			logger.debug(" /project/responseWorkflow -> responseWorkflow()실행 ");
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
		
		// http://localhost:8088/project/login
		@RequestMapping(value = "/login",method = RequestMethod.GET)
		public String loginGet(MemberVO vo) {
			logger.debug(" /project/login(GET) -> loginGET()실행 ");
			logger.debug(" /project/loginForm.jsp");
			
			return "/project/loginForm";
		}
		
		@RequestMapping(value = "/login",method = RequestMethod.POST)
		public String loginPOST(MemberVO vo,HttpSession session) {
			logger.debug(" /project/login(GET) -> loginGET()실행 ");
			logger.debug(" /project/loginForm.jsp");
			MemberVO resultVO = mService.memberLogin(vo);
			
			if(resultVO == null) {
			return "/project/loginForm";
				}
			
			session.removeAttribute("emp_id");
			session.setAttribute("emp_id", resultVO.getEmp_id());
			
			return "/project/main";
		}
			
		// http://localhost:8088/project/checkAlarm
		@RequestMapping(value = "/checkAlarm",method = RequestMethod.GET)
		@ResponseBody
		public Map<String, Object> checkAlarm(HttpSession session) {
			
			String emp_id = (String)session.getAttribute("emp_id");
			logger.debug(" checkAlarm for "+ emp_id);
			
			List<WorkflowAlarmVO> alarmList = waService.checkWorkflow(emp_id);
			
			logger.debug(" checked Alarm : "+ alarmList.size() + "개");
			
			Map<String, Object> resultMap = new HashMap<String,Object>();
			resultMap.put("count", alarmList.size());
			
			for (int i = 0; i < alarmList.size(); i++) {
			    WorkflowAlarmVO alarm = alarmList.get(i);
			    waService.checkAlarmedWorkflow(alarm.getWf_code());
			    resultMap.put("alarm_" + i, alarm);
			}
			
			logger.debug(" ajax로 보낼 리턴값 : "+resultMap);
			return resultMap;
		}
		
		// http://localhost:8088/project/checkUnread
		@RequestMapping(value = "/checkUnread",method = RequestMethod.GET)
		@ResponseBody
		public Map<String, Object> checkUnread(HttpSession session) {
			
			String emp_id = (String)session.getAttribute("emp_id");
			logger.debug(" checkUnread for "+ emp_id);
			
			List<WorkflowVO> sentWorkflowList = wService.showSentWorkflowList(emp_id,"1");
			List<WorkflowVO> receivedWorkflowList = wService.showReceivedWorkflowList(emp_id,"1");
			
			Map<String, Object> resultMap = new HashMap<String,Object>();
			resultMap.put("sentWorkflowList", sentWorkflowList);
			resultMap.put("receivedWorkflowList", receivedWorkflowList);
			
			logger.debug(" ajax로 보낼 리턴값 : " + resultMap);
			return resultMap;
		}

}
