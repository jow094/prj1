$(document).ready(function () {
	
	checkAlarm();
	setInterval(checkAlarm, 10000);
	
	function checkAlarm() {
		$.ajax({
	        url: '/project/checkAlarm',
			type: 'GET',
	        success: function(data) {
	        	console.log('checked Alarm : ', data);
	        	
	        	if(data.smallAlarm>0){
	        		$('#alarm_workflow').addClass('shake');
	        		$('#alarm_workflow_badge').text(data.smallAlarm);
	        		$('#alarm_workflow_badge').addClass('twinkle');
	        		$('#unread_workflow_main').html(`<a href="/project/workflow">${data.smallAlarm} 개의 받은 승인요청이 있습니다.</a>`);
	        		$('#unread_workflow_main_badge').addClass('twinkle_inner');
	        	}else{
	        		$('#alarm_workflow').removeClass('shake');
	        		$('#alarm_workflow').removeClass('twinkle');
	        		$('#unread_workflow_main').text('승인하지 않은 요청이 없습니다.');
	        	} 
	        	
	        	if(data.messageAlarmCount>0){
	        		$('#alarm_message').addClass('shake');
	        		$('#alarm_message_badge').text(data.messageAlarmCount);
	        		$('#alarm_message_badge').addClass('twinkle');
	        		$('#unread_message_main').text(`${data.messageAlarmCount} 개의 읽지 않은 메세지가 있습니다.`);
	        		$('#unread_message_main_badge').addClass('twinkle_inner');
	        	}else{
	        		$('#alarm_message').removeClass('shake');
	        		$('#alarm_message').removeClass('twinkle');
	        		$('#unread_message_main').text('읽지 않은 메세지가 없습니다.');
	        	} 
	        	
	            if (data.receivedWorkflowList.length != 0) {
	            	for (const workflowVO of data.receivedWorkflowList) {
	            		WorkflowAlarm(workflowVO,'received_alarm');
	            	}
	            }
	            if (data.sentWorkflowList.length != 0) {
	            	for (const workflowVO of data.receivedWorkflowList) {
	            		WorkflowAlarm(data,'sent_alarm');
	            	}
	            }
	            if (data.realtimeAlarm_messageList.length != 0) {
            		MessageAlarm(data.realtimeAlarm_messageList);
	            }
	        },
	        error: function(err) {
	            console.error('Error fetching data:', err);
	        }
	    });
	}
	
	function showWorkflowAlarm(workflowVO,which) {
		console.log(which+' shown');
		console.log(workflowVO);
		const alarmBox = document.getElementById(which);
		
		$('#realtimeAlarm_date').text(getDate(workflowVO.wf_last_result_date));
		$('#realtimeAlarm_sender_profile').text(workflowVO.sender_profile);
		$('#realtimeAlarm_sender_dnum').text(workflowVO.sender_dnum);
		$('#realtimeAlarm_sender_bnum').text(workflowVO.sender_bnum);
		$('#realtimeAlarm_sender_name').text(workflowVO.sender_name);
		$('#realtimeAlarm_sender_position').text(workflowVO.sender_position);
		$('#realtimeAlarm_wf_type').text(workflowVO.wf_type);
		$('#realtimeAlarm_wf_progress').text(workflowVO.wf_progress);
		$('#realtimeAlarm_wf_title').text(workflowVO.wf_title);
		$('#realtimeAlarm_wf_result_1st').text(workflowVO.wf_result_1st);
		$('#realtimeAlarm_wf_result_2nd').text(workflowVO.wf_result_2nd);
		$('#realtimeAlarm_wf_result_3rd').text(workflowVO.wf_result_3rd);
		$('#workflow_info').attr('data-wf_code', workflowVO.wf_code);
		
		// 알림 박스를 보이도록 설정
		alarmBox.style.display = 'flex';
		alarmBox.style.animation = 'fadeIn 1s forwards, focus 0.5s infinite'; // 페이드인 효과
		
		setTimeout(() => {
			alarmBox.style.animation = 'fadeOut 1s forwards'; // 페이드아웃 효과
			
			setTimeout(() => {
				alarmBox.style.display = 'none';
			}, 1000);
			
		}, 10000);
	}
	
	function MessageAlarm(realtimeAlarm_messageList) {
		
		/*$('#realtimeAlarm_date').text(getDate(workflowVO.wf_last_result_date));
		$('#realtimeAlarm_sender_profile').text(workflowVO.sender_profile);
		$('#realtimeAlarm_sender_dnum').text(workflowVO.sender_dnum);
		$('#realtimeAlarm_sender_bnum').text(workflowVO.sender_bnum);
		$('#realtimeAlarm_sender_name').text(workflowVO.sender_name);
		$('#realtimeAlarm_sender_position').text(workflowVO.sender_position);
		$('#realtimeAlarm_wf_type').text(workflowVO.wf_type);
		$('#realtimeAlarm_wf_progress').text(workflowVO.wf_progress);
		$('#realtimeAlarm_wf_title').text(workflowVO.wf_title);
		$('#realtimeAlarm_wf_result_1st').text(workflowVO.wf_result_1st);
		$('#realtimeAlarm_wf_result_2nd').text(workflowVO.wf_result_2nd);
		$('#realtimeAlarm_wf_result_3rd').text(workflowVO.wf_result_3rd);
		$('#workflow_info').attr('data-wf_code', workflowVO.wf_code);*/
		
		$('#message_alarm').css('display', 'flex');
		$('#message_alarm').css('animation', 'fadeIn 1s forwards, focus 0.5s infinite');
		setTimeout(() => {
			$('#message_alarm').css('animation', 'fadeOut 1s forwards');
			
			setTimeout(() => {
				$('#message_alarm').css('display', 'none');
			}, 5000);
			
		}, 5000);
	}
	
});
