$(document).ready(function () {
	
	function checkUnread() {
		$.ajax({
	        url: '/project/checkUnread',
			type: 'GET',
	        success: function(data) {
	        	console.log('unread Alarm : ', data);
	            if (data != null) {
	                showAlarm(data);
	            }
	        },
	        error: function(err) {
	            console.error('Error fetching data:', err);
	        }
	    });
	}
	
	function checkAlarm() {
		$.ajax({
	        url: '/project/checkAlarm',
			type: 'GET',
	        success: function(data) {
	        	console.log('checked Alarm : ', data);
	            if (data.count != 0) { // 특정 조건 체크
	                showAlarm(data); // 알림 표시 함수 호출
	            }
	        },
	        error: function(err) {
	            console.error('Error fetching data:', err);
	        }
	    });
	}
	
	function showAlarm(data) {
		console.log('data for show : ', data);
	    /* const alarm = $('<div class="notification"></div>').text(data);
	    $('#notificationArea').append(notification);
	    notification.fadeIn().delay(3000).fadeOut(); // 서서히 나타나고 사라짐
	    */	
	}
	
	checkUnread();
	setInterval(checkAlarm, 10000);
});