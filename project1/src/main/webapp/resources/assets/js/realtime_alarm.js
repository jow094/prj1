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
	            if (data.stackWorkflowList.length !=0) {
	            	console.log(data.stackWorkflowList);
	            	stackAlarm(data.stackWorkflowList, data.alarmStack);
	            }
	        },
	        error: function(err) {
	            console.error('Error fetching data:', err);
	        }
	    });
	}
	
	function updateAlarmStack(alarmStack) {
	    return $.ajax({
	        url: '/project/updateSession', // 세션에 alarmStack 업데이트하는 URL
	        type: 'POST',
	        data: JSON.stringify(alarmStack),
	        success: function (response) {
	            console.log("Updated alarmStack:", alarmStack);
	        },
	        error: function (err) {
	            console.error("Failed to update alarmStack in session", err);
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
	
	function stackAlarm(stackWorkflowList, alarmStack) {
		for (const workflowVO of stackWorkflowList) {
			$('#small_alarm_section').append(
		    		`
						<div class="small_alarm_container">
							<div class="small_alarm_inner_box">
								${workflowVO}
							</div>
						</div>
		    		`
		    );
		    
		    setTimeout(() => {
	            $('.small_alarm_container:last').addClass('show'); // show 클래스를 추가하여 애니메이션 시작
	        }, 10);
		    alarmStack.push(workflowVO.wf_code);
		}
		updateAlarmStack(alarmStack);
	}
	
	setInterval(checkAlarm, 10000);
    
	document.getElementById('received').addEventListener('click', function() {
	    showAlert('data','received_alarm');
	});
	
	document.getElementById('sent').addEventListener('click', function() {
	    showAlert('data','sent_alarm');
	});
	
	document.getElementById('smallAlarmButton').addEventListener('click', function() {
	    $('#small_alarm_section').append(
	    		`
					<div class="small_alarm_container">
						<div class="small_alarm_inner_box">
						</div>
					</div>
	    		`
	    );
	    
	    setTimeout(() => {
            $('.small_alarm_container:last').addClass('show'); // show 클래스를 추가하여 애니메이션 시작
        }, 10);
	});
});