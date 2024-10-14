$(document).ready(function () {
	
	const getDate = (stringDate) => {
	    if (!stringDate) return '';
	    const date = new Date(stringDate);
	    return String(date.getFullYear()).slice(-2) + '.' +
		       String(date.getMonth() + 1).padStart(2, '0') + '.' +
		       String(date.getDate()).padStart(2, '0') + '   ' +
		       String(date.getHours()).padStart(2, '0') + ':' +
		       String(date.getMinutes()).padStart(2, '0');
	};
	
	function checkAlarm() {
		$.ajax({
	        url: '/project/checkAlarm',
			type: 'GET',
	        success: function(data) {
	        	if(data.receivedWorkflowList.length>0 || data.sentWorkflowList.length>0){
	        		console.log('checked Alarm : ', data);
	        	}
	            if (data.receivedWorkflowList.length != 0) {
	            	for (const workflowVO of data.receivedWorkflowList) {
	            		showAlert(workflowVO,'received_alarm');
	            	}
	            }
	            if (data.sentWorkflowList.length != 0) {
	            	for (const workflowVO of data.receivedWorkflowList) {
	            		showAlert(data,'sent_alarm');
	            	}
	            }
	            $('#smallAlarm').text(data.smallAlarm);
	        },
	        error: function(err) {
	            console.error('Error fetching data:', err);
	        }
	    });
	}
	
	function showAlert(workflowVO,which) {
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
		alarmBox.style.animation = 'fadeIn 1s forwards'; // 페이드인 효과
		
		
		setTimeout(() => {
			alarmBox.style.animation = 'fadeOut 1s forwards'; // 페이드아웃 효과
			
			setTimeout(() => {
				alarmBox.style.display = 'none';
			}, 1000);
			
		}, 10000);
	}
	
	setInterval(checkAlarm, 10000);
});