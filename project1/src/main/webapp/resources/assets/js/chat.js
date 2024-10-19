$(document).ready(function () {
	
	getMembers();
	chatRoomList();
	$('.messenger_body_chat.list').css('display', 'block');
	
	$(document).on('click', '#to_chat_list', function (e) {
		console.log('to_chat_list');
		chatRoomList();
	    $('.messenger_body_chat.room').css('display', 'none');
	    $('.messenger_body_chat.list').css('display', 'block');
	});
	
	$(document).on('click', '#to_chat_room', function (e) {
		console.log('to_chat_room : room_id = ',+$(this).data('room_id'));
		getMessages($(this).data('room_id'),null)
	    $('.messenger_body_chat.list').css('display', 'none');
	    $('.messenger_body_chat.room').css('display', 'flex');
	});
	
	$(document).on('click', '#to_personal_room', function (e) {
		console.log('to_personal_room');
		getMessages(null,$(this).data('receiver_emp_id'));
	    $('.messenger_body_chat.list').css('display', 'none');
	    $('.messenger_body_chat.room').css('display', 'flex');
	});
	
	$('#msg_content').keydown(function(e) {
	    if (e.key === 'Enter') {
	        e.preventDefault(); // 기본 엔터키 동작 방지
	        $('#message_send_form').submit(); // 폼 제출
	    }
	});
	
	$('#message_send_form').submit(function(e) {
        e.preventDefault();  

        $.ajax({
            url: '/member/sendMessage',
            type: 'POST',
            data: {
                room_id: $('#hidden_room_id').val(),
                personal_receiver_emp_id: $('#hidden_personal_receiver_emp_id').val(),
                personal_receiver_emp_name: $('#hidden_personal_receiver_emp_name').val(),
                msg_content: $('#msg_content').val()
            },
            success: function(data) {
            	console.log('send message!');
            	console.log(data);
            	getMessages(data,null);
            	$('#msg_content').val('');
            	
            },
            error: function(error) {
                console.error('Error sending message:', error);
            }
        });
    });
	
	$('#messenger_search').blur(function() {
	    if( $('#messenger_search').val().trim() === '' ){
	        $('#messenger_search').val(''); // 인풋 필드에서 공백 제거
	        $('.messenger_body_menu').children('.messenger_search_result').remove(); // 검색 결과 제거
	    }
	});
	
	$('#room_search').blur(function() {
	    if( $('#room_search').val().trim() === '' ){
	        $('#room_search').val(''); // 인풋 필드에서 공백 제거
	        $('.messenger_body_chat.list').children('.room_search_result').remove(); // 검색 결과 제거
	    }
	});
});
	
function getMembers() {
    
    $.ajax({
		url: '/member/getTeam',
		type: 'GET',
		success: function (data) {
			console.log('getMembers :'+data);
			$('.messenger_body_menu').children(':not(.messenger_search)').remove();
			$('.messenger_body_menu').append(`
					<div style="width:100%, height:5px;">
					팀원 (${data.length})
					</div>
			`);
			for (const memberVO of data) {
		    	$('.messenger_body_menu').append(`
					<div class="person" style="display:flex;">
						<div class="member_info" data-emp_id="${memberVO.emp_id}" style="flex:0.3; display:flex; justify-content: center;  align-items: center;">
							<div style="flex:2; display:flex; justify-content: center; align-items: center;">
							<i class="fa-solid fa-star" style="font-size:20px; color:rgba(0,0,0,0.1);"></i>
							</div>
							<div style="flex:8; display:flex; justify-content: center; align-items: center;">
							${memberVO.emp_progile}
							</div>
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
							<div id="to_personal_room" data-receiver_emp_id="${memberVO.emp_id}">메세지</div>
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
	
function getMessages(room_id,receiver_emp_id) {
	$.ajax({
		url: '/member/getMessages',
		type: 'GET',
		data: {room_id : room_id,
			receiver_emp_id : receiver_emp_id},
		success: function (data) {
			console.log('getMessages :'+data);
			$('.chat_content').empty();
	    	/////////////////////////////////여기에 가지고 온 메세지리스트 있으면 밑에 실행하고 없으면 입력란만 새로 파주는 로직 추가 -> 서브밋 하면 방 생성, 입장정보 양쪽에서 추가, 메세지 인설트
		    if(data.messageList.length==0){
				$('#hidden_room_id').val(0);
				$('.chat_room_name').text(data.personal_receiver_memberVO.emp_name);
				$('#hidden_personal_receiver_emp_id').val(data.personal_receiver_memberVO.emp_id);
				$('#hidden_personal_receiver_emp_name').val(data.personal_receiver_memberVO.emp_name);
		    }else{
			for (const msg of data.messageList) {
				console.log('msgList : ',msg);
		    	if(msg.msg_sender.emp_id == data.emp_id){
		    		$('.chat_content').append(
	    				`<div class="msg_box" style="display:flex; width:370px; border:1px solid; padding-bottom: 3px; margin-left:auto;">
							<div style="height:100%; width:10px; border:1px solid; display:flex; justify-content: flex-end; align-items: flex-end; margin-left:auto;">
								<span id="s_msg_unread_count">
									 ${msg.msg_unread_count > 0 ? msg.msg_unread_count : ''}
								</span>
						    </div>
							<div class="msg_contents" style="display:flex; flex-direction:column; float:right; min-width:150px; max-width:360px; padding:3px;  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4); border-radius:3px; background-color:rgba(0,0,150,0.2)">
						       	<div id="s_msg_content" style="min-height:30px;">
								${msg.msg_content}
								</div>	    
								<div id="s_msg_create_date" style="height:20px; text-align:right;">
								${getMsgDate(msg.msg_date)}
								</div>	  
						    </div>
						</div>`
		    				);
	    			}else{
	    				$('.chat_content').append(
		    			`<div class="r_msg_box" style="display:flex; width:370px; border:1px solid; padding-bottom: 3px;">
								<a data-emp_code="" class="member_info">
									<div id="r_msg_sender_img" style="border:1px solid; width:50px; height:50px; margin-top:10px;">
									${msg.msg_sender.emp_profile}
									</div>
								</a>
								<div style="width:400px; border:1px solid; display:flex; flex-direction:column;">
									<div style="display:flex; height:30px; border:1px solid;">
										<div id="r_msg_sender_position" style="border:1px solid; padiing:0 5px;">
										${msg.msg_sender.emp_position}
										</div>
										<div id="r_msg_sender_name" style="border:1px solid;">
										${msg.msg_sender.emp_name}
										</div>
									</div>
									<div class="msg_box" style="display:flex; overflow:auto; ">
									    <div class="msg_contents" style="display:flex; flex-direction:column; float:left; min-width:150px; max-width:360px; padding:3px;  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4); border-radius:3px; background-color:rgba(150,200,250,0.3)">
									       	<div id="r_msg_content" style="min-height:30px;">
											${msg.msg_content}
											</div>	    
											<div id="r_msg_create_date" style="height:20px; text-align:right;">
											${getMsgDate(msg.msg_date)}
											</div>	  
									    </div>
									    <div style="height:100%; width:10px; border:1px solid; display:flex; justify-content: flex-end; align-items: flex-end;">
									    <span id="r_msg_unread_count">
									    	 ${msg.msg_unread_count > 0 ? msg.msg_unread_count : ''}
									    </span>
									    </div>
									</div>
								</div>
							</div>`	
	    				);
	    			}
		    	}/* for문 종료*/
				$('#hidden_room_id').val(data.messageList[0].room_id);
				$('.chat_room_name').text(data.messageList[0].room_name);
		    }/* if else문 종료*/
		    
		    $('.chat_content').scrollTop($('.chat_content')[0].scrollHeight);
			},/* success문 종료*/
			error: function (xhr, status, error) {
				if (status !== 'abort') {
					console.error('AJAX 요청 실패:', status, error);
					console.log('xhr:', xhr);
				}
			}
	}); // ajax end}	
}

function chatRoomList() {
	$.ajax({
		url: '/member/getChatRoomList',
		type: 'GET',
		success: function (data) {
			console.log('load chat list :'+data);
			$('.messenger_body_chat.list').children(':not(.messenger_room_search)').remove();
			for (const rooms of data) {
				console.log(rooms);
				$('.messenger_body_chat.list').append(`
					<a data-room_id="${rooms.room_id}" id="to_chat_room">
						<div class="room" style="display:flex; justify-content: center; align-items: center;">
							<div style="flex:2; display:flex; justify-content: center; align-items: center;">
								<div style="flex:2; display:flex; justify-content: center; align-items: center;">
								<i class="fa-solid fa-thumbtack" style="font-size:20px; color:rgba(0,0,0,0.1);"></i>
								</div>
								<div style="flex:8; display:flex; justify-content: center; align-items: center;">
								${rooms.room_thumbnail}
								</div>
							</div>
							<div style="flex:6; display:flex; flex-direction:column; justify-content: center; align-items: center;">
								<div style="flex:3; display:flex; width:100%; justify-content: flex-start; align-items: center;">
									<div style="width:100%; height:100%; display:flex; justify-content: flex-start; align-items: center;">
									${rooms.room_name}
									</div>
								</div>
								<div style="flex:3; display:flex; width:100%; justify-content: flex-start; align-items: center;">
									<div style="flex:0.2; height:100%; display:flex; justify-content: center; align-items: center;">
									${rooms.room_last_sender_position}
									</div>
									<div style="flex:0.5; height:100%; display:flex; justify-content: flex-start; align-items: center;">
									${rooms.room_last_sender_name}
									</div>
									<div style="flex:0.3; height:100%; display:flex; justify-content: flex-end; align-items: center;">
									${getMsgDate(rooms.room_last_message_date)}
									</div>
								</div>
								<div style="flex:4; display:flex; width:100%; justify-content: flex-start; align-items: center; padding-left:10px;">
								${rooms.room_last_message}
								</div>
							</div>
							<div style="flex:1; display:flex; justify-content: center; align-items: center;">
							${rooms.room_alarm_count}
							</div>
						</div>
					</a>`
				);
			}
		},
		error: function (xhr, status, error) {
			if (status !== 'abort') {
				console.error('AJAX 요청 실패:', status, error);
				console.log('xhr:', xhr);
			}
		}
	});
}

const getMsgDate = (stringDate) => {
    if (!stringDate) return '';
    const date = new Date(stringDate);
    return String(date.getMonth() + 1).padStart(2, '0') + '.' +
	       String(date.getDate()).padStart(2, '0') + ' ' +
	       String(date.getHours()).padStart(2, '0') + ':' +
	       String(date.getMinutes()).padStart(2, '0');
};

let prev_messenger_search;
function messenger_search(input) {
	const keyword = input.replace(/\s+/g, '');

	if (keyword.length >= 2 && /^[a-zA-Z가-힣0-9]+$/.test(keyword)) {
		if (prev_messenger_search) {
			prev_messenger_search.abort();
			}
		prev_messenger_search = 
			$.ajax({
			url: '/member/search',
			type: 'GET',
			data: { keyword: keyword },
			success: function (data) {
				console.log('correct value input. start messenger_search, result:', data);
				$('.messenger_body_menu').children('.msg_search_result').remove();
				$('.messenger_body_menu').children('.msg_search_person').remove();
				$('.messenger_search').after(`
						<div class="messenger_search_result" style="width:100%, height:5px;">
							'${keyword}' 검색 결과 (${data.length})
						</div>
				`);
				for (const memberVO of data) {
					$('.msg_search_result').after(`
						<div class="msg_search_person" style="display:flex;">
						<div class="member_info" data-emp_id="${memberVO.emp_id}" style="flex:0.3; display:flex; justify-content: center;  align-items: center;">
							<div style="flex:2; display:flex; justify-content: center; align-items: center;">
							<i class="fa-solid fa-star" style="font-size:20px; color:rgba(0,0,0,0.1);"></i>
							</div>
							<div style="flex:8; display:flex; justify-content: center; align-items: center;">
							${memberVO.emp_progile}
							</div>
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
							<div id="to_personal_room" data-receiver_emp_id="${memberVO.emp_id}">메세지</div>
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
		}); // ajax end
	}
}

let prev_room_search;
function room_search(input) {
	const keyword = input.replace(/\s+/g, '');

	if (keyword.length >= 2 && /^[a-zA-Z가-힣0-9]+$/.test(keyword)) {
		if (prev_room_search) {
			prev_room_search.abort();
			}
		prev_room_search = 
			$.ajax({
			url: '/member/msgSearch',
			type: 'GET',
			data: { keyword: keyword },
			success: function (data) {
				console.log('correct value input. start room_search, result:', data);
				$('.room_search_result').remove();
				$('.messenger_room_search').after(`
						<div class="room_search_result" style="width:100%, height:5px;">
							'${keyword}' 검색 결과 (${data.length})
						</div>
				`);
				for (const memberVO of data) {
					$('room_search_result').after(`
					asdasd
					
					`);
				}
			},
			error: function (xhr, status, error) {
				if (status !== 'abort') {
					console.error('AJAX 요청 실패:', status, error);
					console.log('xhr:', xhr);
				}
			}
		}); // ajax end
	}
}
