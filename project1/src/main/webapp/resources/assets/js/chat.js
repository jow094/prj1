$(document).ready(function () {
	
	getMembers();
	
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
	
function getMessages(room_id) {
	$.ajax({
		url: '/member/getMessages',
		type: 'GET',
		data: {room_id : room_id},
		success: function (data) {
			console.log(data);
			
	    	$('.messenger_body_chat room').append(`
	    			<div style="display:flex; flex:0.1; width:100%; border:1px solid;">
						<div id ="to_chat_list" style="display:flex; flex:0.1; border:1px solid; justify-content: center; align-items: center;">
							<button>
								<i class="fa-solid fa-arrow-left"></i>
							</button>
						</div>
						<div id="${data.room_name}" style="display:flex; flex:0.6; width:100%; border:1px solid; padding-left:10px; justify-content: flex-start; align-items: center;">
						</div>
					</div>
	    	`);
	    	
		    for (const msg of data.messageList) {
		    	if(msg.sender.emp_id===data.emp_id){
		    		$('.messenger_body_chat room').append(
	    				`<div class="msg_box" style="display:flex; width:370px; border:1px solid; padding-bottom: 3px; margin-left:auto;">
							<div style="height:100%; width:10px; border:1px solid; display:flex; justify-content: flex-end; align-items: flex-end; margin-left:auto;">
							<span id="s_msg_unread_count">1</span>
						    </div>
							<div class="msg_contents" style="display:flex; flex-direction:column; float:right; min-width:150px; max-width:360px; padding:3px;  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4); border-radius:3px; background-color:rgba(0,0,150,0.2)">
						       	<div id="s_msg_content" style="min-height:30px;">
								${msg.msg_content}
								</div>	    
								<div id="s_msg_create_date" style="height:20px; text-align:right;">
								${msg.msg_create_date}
								</div>	  
						    </div>
						</div>`
		    				);
	    			}else{
	    				$('.messenger_body_chat room').append(
		    			`<div class="r_msg_box" style="display:flex; width:370px; border:1px solid; padding-bottom: 3px;">
								<a data-emp_code="" class="member_info">
									<div id="r_msg_sender_img" style="border:1px solid; width:50px; height:50px; margin-top:10px;">
									${msg.sender.emp_profile}
									</div>
								</a>
								<div style="width:400px; border:1px solid; display:flex; flex-direction:column;">
									<div style="display:flex; height:30px; border:1px solid;">
										<div id="r_msg_sender_position" style="border:1px solid; padiing:0 5px;">
										${msg.sender.emp_position}
										</div>
										<div id="r_msg_sender_name" style="border:1px solid;">
										${msg.sender.emp_name}
										</div>
									</div>
									<div class="msg_box" style="display:flex; overflow:auto; ">
									    <div class="msg_contents" style="display:flex; flex-direction:column; float:left; min-width:150px; max-width:360px; padding:3px;  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4); border-radius:3px; background-color:rgba(150,200,250,0.3)">
									       	<div id="r_msg_content" style="min-height:30px;">
											${msg.msg_content}
											</div>	    
											<div id="r_msg_create_date" style="height:20px; text-align:right;">
											${msg.msg_create_date}
											</div>	  
									    </div>
									    <div style="height:100%; width:10px; border:1px solid; display:flex; justify-content: flex-end; align-items: flex-end;">
									    <span id="r_msg_unread_count">1</span>
									    </div>
									</div>
								</div>
							</div>`	
	    				);
	    			}
		    	}/* for문 종료*/
		    $('#hidden_room_id').val(data.room_id);
		    
			},/* success문 종료*/
			error: function (xhr, status, error) {
				if (status !== 'abort') {
					console.error('AJAX 요청 실패:', status, error);
					console.log('xhr:', xhr);
				}
			}
	}); // ajax end}	
}
