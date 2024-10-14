$(document).ready(function () {
	
	function checkAlarm() {
		$.ajax({
	        url: '/project/checkAlarm',
			type: 'GET',
	        success: function(data) {
	        	console.log('checked Alarm : ', data);
	            if (data.receivedWorkflowList.length != 0) {
	            	for (const workflowVO of data.receivedWorkflowList) {
	            		showAlert(data,'received_alarm');
	            	}
	            }
	            if (data.sentWorkflowList.length != 0) {
	            	for (const workflowVO of data.receivedWorkflowList) {
	            		showAlert(data,'sent_alarm');
	            	}
	            }
	        },
	        error: function(err) {
	            console.error('Error fetching data:', err);
	        }
	    });
	}
	
	function showAlert(data,which) {
		console.log(which+' shown');
		const alarmBox = document.getElementById(which);
		
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
    
	document.getElementById('received').addEventListener('click', function() {
	    showAlert('data','received_alarm');
	});
	
	document.getElementById('sent').addEventListener('click', function() {
	    showAlert('data','sent_alarm');
	});
    
});