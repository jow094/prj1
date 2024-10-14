<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/realtime_alarm.css" />
<script src="${pageContext.request.contextPath }/resources/assets/js/realtime_alarm.js"></script>

<!-- received alarm start -->
<div id="received_alarm" class="realtime_alarm">
		<div class="alarm_inner_box">
			<div style="display:flex; flex-direction: column; width:100%; height:100%;">
		  		<div style="display:flex; flex-direction: column; flex:0.4; border-bottom: 1px solid rgba(0,0,0,0.9); padding-bottom: 10px;">
		  			<div style="display:flex; flex:1; justify-content: flex-end; align-items: flex-start;">
		  				${data.receivedWorkflowList.wf_last_result_date}
		  			</div>
		  			<div style="display:flex; flex:1; justify-content: flex-start; align-items: center; text-align: left;">
		  				새로운 승인 요청이 있습니다!
		  			</div>
		  		</div>
		  		<div style="display:flex; flex:0.6; padding-top: 10px;">
		  			<div style="display: flex; align-items: center; justify-content: center; flex:3;">
		  				<img src=""
						style="width: 40px; height: 40px; border-radius: 50%;">
		  			</div>
		  			<div style="display:flex; flex-direction: column; flex:7;">
		  				<div style="display:flex; flex:3; align-items: center;">
		  					<div style="flex:1; text-align: center; display:flex;">
		  						<div style="flex:0.4; font-weight: bold;">유형</div>
		  						<div style="flex:0.6">${data.receivedWorkflowList.wf_type}</div>
		  					</div>
		  					<div style="flex:1; text-align: center; display:flex;">
		  						<div style="flex:0.4; font-weight: bold;">상태</div>
		  						<div style="flex:0.6">${data.receivedWorkflowList.wf_progress}</div>
		  					</div>
		  				</div>
		  				<div style="display: flex; align-items: center; flex:7; ">${data.receivedWorkflowList.wf_title}</div>
		  			</div>
		  		</div>
		  	</div>
	  	</div>
</div>
<!-- received alarm end-->
<!-- sent alarm start -->
<div id="sent_alarm" class="realtime_alarm">
		<div class="alarm_inner_box">
			<div style="display:flex; flex-direction: column; width:100%; height:100%;">
				<div style="display:flex; flex-direction: column; flex:0.4; border-bottom: 1px solid rgba(0,0,0,0.9); padding-bottom: 10px;">
					<div id="date" style="display:flex; flex:1; justify-content: flex-end; align-items: flex-start;">
						${data.sentWorkflowList.wf_last_result_date}
					</div>
					<div style="display:flex; flex:1; justify-content: flex-start; align-items: center; text-align: left;">
						발송하신 요청에 대한 새로운 응답이 있습니다!
					</div>
				</div>
				<div style="display:flex; flex:0.6; padding-top: 10px;">
					<div style="display:flex; flex-direction: column; flex:5;">
						<div style="display:flex; flex:3; align-items: center;">
							<div style="flex:1; text-align: center; display:flex;">
								<div style="flex:0.4; font-weight: bold;">유형</div>
								<div id="type"style="flex:0.6">${data.sentWorkflowList.wf_type}</div>
							</div>
							<div style="flex:1; text-align: center; display:flex;">
								<div style="flex:0.4; font-weight: bold;">상태</div>
								<div id="progress" style="flex:0.6">${data.sentWorkflowList.wf_progress}</div>
							</div>
						</div>
						<div id="title" style="display: flex; align-items: center; flex:7; ">${data.sentWorkflowList.wf_title}</div>
					</div>
					<div id="results" style="display: flex; justify-content: center; flex:5; flex-direction: column;">
						<div style="display: flex; flex:1;">
							<div style="flex:0.6; font-weight: bold; text-align: center;">1차 승인결과 :</div>
							<div style="flex:0.4; text-align: center;">${data.sentWorkflowList.wf_result_1st}</div>
						</div>
						<div style="display: flex; flex:1;">
							<div style="flex:0.6; font-weight: bold; text-align: center;">2차 승인결과 :</div>
							<div style="flex:0.4; text-align: center;">${data.sentWorkflowList.wf_result_2nd}</div>
						</div>
						<div style="display: flex; flex:1;">
							<div style="flex:0.6; font-weight: bold; text-align: center;">3차 승인결과 :</div>
							<div style="flex:0.4; text-align: center;">${data.sentWorkflowList.wf_result_3rd}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
	<!-- sent alarm end-->