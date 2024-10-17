$(document).ready(function () {
	
	$(document).on('click', '#to_chat_list', function (e) {
		console.log('to_chat_list');
	    $('.messenger_body_chat.room').css('display', 'none');
	    $('.messenger_body_chat.list').css('display', 'block');
	});
	
	
	$(document).on('click', '#to_chat_room', function (e) {
		console.log('to_chat_room');
	    $('.messenger_body_chat.list').css('display', 'none');
	    $('.messenger_body_chat.room').css('display', 'flex');
	});
	
	$(document).on('click', '#to_personal_room', function (e) {
		console.log('to_chat_room');
		getMessages($(this).data('emp_id'));
	    $('.messenger_body_chat.list').css('display', 'none');
	    $('.messenger_body_chat.room').css('display', 'flex');
	});
	
	getMembers();
	
});
	
	
	
function getMembers() {
    console.log('getMembers.');
    
    $.ajax({
		url: '/member/getTeam',
		type: 'GET',
		success: function (data) {
			console.log(data);
			
			for (const memberVO of data) {
		    	$('.messenger_body_menu').append(`
					<div style="display:flex;">
						<div class="member_info" data-emp_id="${memberVO.emp_id}" style="flex:0.3; display:flex; justify-content: center;  align-items: center;">
						${memberVO.emp_profile}
						</div>
						<div class="member_info" data-emp_id="${memberVO.emp_id}" style="flex:0.5; display:flex; flex-direction: column;">
							<div style="display:flex; flex:0.4;">
								<div style="flex:0.4; height:auto; display:flex; justify-content: center;  align-items: center;">
								${memberVO.emp_position}
								</div>
								<div style="flex:0.6; height:auto; display:flex; justify-content: center;  align-items: center;">
								${memberVO.emp_name}
								</div>
							</div>
							<div style="flex:0.3; display:flex; padding-left:20px; justify-content: flex-start;  align-items: center;">
							${memberVO.emp_bnum}
							</div>
							<div style="display:flex; flex:0.3;">
								<div style="flex:0.5; height:auto; display:flex; justify-content: center;  align-items: center;">
								${memberVO.emp_dnum}
								</div>
								<div style="flex:0.5; height:auto; display:flex; justify-content: center;  align-items: center;">
								${memberVO.emp_job}
								</div>
							</div>
						</div>
						<div style="flex:0.2; display:flex; flex-direction:column; justify-content: center;  align-items: center;">
							<div>상태</div>
							<div id="to_personal_room" data-emp_id="${memberVO.emp_id}">메세지</div>
						</div>
					</div>
		    	`);
			}
			
		},
		error: function (xhr, status, error) {
			if (status !== 'abort') {
				console.error('AJAX 요청 실패:', status, error);
				console.log('xhr:', xhr);
			}
		}
	}); // ajax end}	
}	
	
function getMessages(emp_id) {
	$.ajax({
		url: '/member/getMessage',
		type: 'GET',
		data: {msg_emp_id : emp_id},
		success: function (data) {
			console.log(data);
			
			for (const msg of data) {
		    	$('.messenger_body_menu').append(`
		    	`);
			}
			
		},
		error: function (xhr, status, error) {
			if (status !== 'abort') {
				console.error('AJAX 요청 실패:', status, error);
				console.log('xhr:', xhr);
			}
		}
	}); // ajax end}	
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
