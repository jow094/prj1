$(document).ready(function () {
	
	const getDate = (stringDate) => {
	    if (!stringDate) return '';
	    const date = new Date(stringDate);
	    return String(date.getFullYear()).slice(-2) + '.' +
		       String(date.getMonth() + 1).padStart(2, '0') + '.' +
		       String(date.getDate()).padStart(2, '0') + ' / ' +
		       String(date.getHours()).padStart(2, '0') + ':' +
		       String(date.getMinutes()).padStart(2, '0');
	};
	
	var workflowVO;
	var senderVO;
	var receiverVO;
	var receiver_1st_VO;
	var receiver_2nd_VO;
	var receiver_3rd_VO;
	
	$('#responsive_workflow_modal').on('show.bs.modal', function (e) {

		var button = $(e.relatedTarget);
	    var wf_code = button.data('wf_code');

	    console.log('AJAX requested for wf_code :', wf_code); // wf_code 값 출력
		
		$.ajax({
			url: '/project/readWorkflow',
			type: 'GET',
			data: {wf_code: wf_code},
			success: function (data) {
				console.log('AJAX success for wf_code :', wf_code);
				console.log('taken data:', data);
				
				workflowVO = data.workflowVO;
				senderVO = data.senderVO;
		    	receiverVO = data.receiverVO;
		    	receiver_1st_VO = data.receiver_1st_VO;
		    	receiver_2nd_VO = data.receiver_2nd_VO;
		    	receiver_3rd_VO = data.receiver_3rd_VO;
				
				/* value to next page start */
				$('#wf_code_hidden').val(wf_code);
				/* value to next page end */
				
				/* set text in page start */
					
				/* set workflow basic info start*/
				$('#wf_code').text(workflowVO.wf_code);
				$('#wf_type').text(workflowVO.wf_type);
				$('#wf_title').text(workflowVO.wf_title);
				$('#wf_file').text(workflowVO.wf_file);
				$('#wf_progress').text(workflowVO.wf_progress);
				$('#wf_level').text(workflowVO.wf_level);
				$('#wf_create_date').text(getDate(workflowVO.wf_create_date));
				$('#wf_content').text(workflowVO.wf_content);
				$('#wf_sender_emp_name').text(senderVO.emp_name);
				$('#wf_sender_emp_dnum').text(senderVO.emp_dnum);
				$('#wf_sender_emp_position').text(senderVO.emp_position);
				$('#wf_receiver_emp_name').text(receiverVO.emp_name);
				$('#wf_receiver_emp_dnum').text(receiverVO.emp_dnum);
				$('#wf_receiver_emp_position').text(receiverVO.emp_position);
				$('#wf_receiver_1st_emp_name').text(receiver_1st_VO.emp_name);
				$('#wf_receiver_1st_emp_dnum').text(receiver_1st_VO.emp_dnum);
				$('#wf_receiver_1st_emp_position').text(receiver_1st_VO.emp_position);
				/* set workflow basic info end*/
				
				/* set other receiver start */
				
				if (receiver_2nd_VO != null) {
					$('#receivers').append(`
						<div class="form-group" id="getReceiver_2nd" style="height:100px; display: flex; flex-direction:column; ">
		                	<div style="flex:0.2;">
		                		SECOND RECEIVER
		                	</div>
		                	<a href="#">
		                   	<div style="flex:0.8; display: flex; color: rgba(0, 0, 0, 0.7);">
		                   		<div style="display: flex; flex:0.2; align-items: center; justify-content: center;">
		                   			<img src=""
							        	style="width: 40px; height: 40px; border-radius: 50%;">
		                   		</div>
		                   		<div style="flex:0.4; display: flex; flex-direction:column;">
		                   			<div style="flex:0.4; font-weight: bold; color: black;" id="wf_receiver_2nd_emp_name">
		                   			</div>
		                   			<div style="flex:0.3;" id="wf_receiver_2nd_emp_dnum">
			                    		</div>
			                    		<div style="flex:0.3;" id="wf_receiver_2nd_emp_position">
			                    		</div>
		                   		</div>
		                   		<div style="flex:0.4; display: flex; flex-direction:column; align-items: center; justify-content: center;">
		                   			<div style="flex:0.7; display: flex; align-items: center; justify-content: center;" id="wf_result_2nd">
		                   			</div>
		                   			<div style="flex:0.3; display: flex; align-items: center; justify-content: center;" id="wf_result_date_2nd">
		                   			</div>
		                   		</div>
		                    	</div>
		                    </a>
		                </div>
                    `);
				}
				
				if (receiver_3rd_VO != null) {
					$('#receivers').append(`
						<div class="form-group" id="getReceiver_3rd" style="height:100px; display: flex; flex-direction:column; ">
		                	<div style="flex:0.2;">
		                		THIRD RECEIVER
		                	</div>
		                	<a href="#">
		                   	<div style="flex:0.8; display: flex; color: rgba(0, 0, 0, 0.7);">
		                   		<div style="display: flex; flex:0.2; align-items: center; justify-content: center;">
		                   			<img src=""
							        	style="width: 40px; height: 40px; border-radius: 50%;">
		                   		</div>
		                   		<div style="flex:0.4; display: flex; flex-direction:column;">
		                   			<div style="flex:0.4; font-weight: bold; color: black;" id="wf_receiver_3rd_emp_name">
		                   			</div>
		                   			<div style="flex:0.3;" id="wf_receiver_3rd_emp_dnum">
			                    		</div>
			                    		<div style="flex:0.3;" id="wf_receiver_3rd_emp_position">
			                    		</div>
		                   		</div>
		                   		<div style="flex:0.4; display: flex; flex-direction:column; align-items: center; justify-content: center;">
		                   			<div style="flex:0.7; display: flex; align-items: center; justify-content: center;" id="wf_result_3rd">
		                   			</div>
		                   			<div style="flex:0.3; display: flex; align-items: center; justify-content: center;" id="wf_result_date_3rd">
		                   			</div>
		                   		</div>
		                    	</div>
		                    </a>
		                </div>
                    `);
				}
				
				$('#wf_receiver_2nd_emp_name').text(receiver_2nd_VO.emp_name);
				$('#wf_receiver_2nd_emp_dnum').text(receiver_2nd_VO.emp_dnum);
				$('#wf_receiver_2nd_emp_position').text(receiver_2nd_VO.emp_position);
				
				$('#wf_receiver_3rd_emp_name').text(receiver_3rd_VO.emp_name);
				$('#wf_receiver_3rd_emp_dnum').text(receiver_3rd_VO.emp_dnum);
				$('#wf_receiver_3rd_emp_position').text(receiver_3rd_VO.emp_position);
				/* set other receiver end */
				
				/* set result start */
				$('#wf_result_1st').text(workflowVO.wf_result_1st);
				$('#wf_result_date_1st').text(getDate(workflowVO.wf_result_date_1st));
				$('#wf_result_2nd').text(workflowVO.wf_result_2nd);
				$('#wf_result_date_2nd').text(getDate(workflowVO.wf_result_date_2nd));
				$('#wf_result_3rd').text(workflowVO.wf_result_3rd);
	            $('#wf_result_date_3rd').text(getDate(workflowVO.wf_result_date_3rd));
				/* set result end */
				
	            /* set comment start */
	            function appendComment(receiverVO, comment, result_date) {
	                if (comment != null) {
	                    $('#commentSection').append(`
	                        <a href="#">
	                            <div style="width: 100%; height: auto; flex-grow: 1; display: flex;">
	                                <div style="width: 5%; display: flex; align-items: center; justify-content: center; padding-right:40px;">
	                                    <img src="${reveiverVO.emp_file}" alt="img" style="width: 40px; height: 40px; border-radius: 50%;">
	                                </div>
	                                <div style="width: 95%; height: auto; display: flex; flex-direction: column; padding: 5px;">
	                                    <div class="getReceiver" style="flex: 0.3; font-weight: bold; color: black;">
	                                        ${receiverVO.emp_name}
	                                    </div>
	                                    <div style="flex: 0.7; display: flex;">
	                                        <div style="flex: 0.9; max-width: 90%; overflow-wrap: break-word; color: rgba(0, 0, 0, 0.7);">
	                                            ${comment}
	                                        </div>
	                                        <div style="flex: 0.1; color: rgba(0, 0, 0, 0.5); display: flex; align-items: flex-end; justify-content: flex-end;">
	                                            ${getDate(result_date)}
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </a>
	                    `);
	                } else {
	                    console.log('No comment available');
	                }
	            }
	            
	            appendComment(receiver_1st_VO, workflowVO.wf_comment_1st, workflowVO.wf_result_date_1st);
		        appendComment(receiver_2nd_VO, workflowVO.wf_comment_2nd, workflowVO.wf_result_date_2nd);
		        appendComment(receiver_3rd_VO, workflowVO.wf_comment_3rd, workflowVO.wf_result_date_3rd);
		        /* set comment end */
				
			},
			error: function(xhr, status, error) {
				console.error('AJAX 요청 실패:', status, error);
				console.log('xhr:', xhr);
			}
		});
	});
	
	$('#responsive_workflow_modal').on('click', '#getSender', function() {
	    $('#get_employee_info').data('emp_id', workflowVO.wf_sender).modal('show');
	});

	$('#responsive_workflow_modal').on('click', '#getReceiver', function() {
		$('#get_employee_info').data('emp_id', workflowVO.wf_receiver).modal('show');
	});

	$('#responsive_workflow_modal').on('click', '#getReceiver_1st', function() {
	    $('#get_employee_info').data('emp_id', workflowVO.wf_receiver_1st).modal('show');
	});

	$('#responsive_workflow_modal').on('click', '#getReceiver_2nd', function() {
	    $('#get_employee_info').data('emp_id', workflowVO.wf_receiver_2nd).modal('show');
	});

	$('#responsive_workflow_modal').on('click', '#getReceiver_3rd', function() {
	    $('#get_employee_info').data('emp_id', workflowVO.wf_receiver_3rd).modal('show');
	});
	
	$('#responsive_workflow_modal').on('hidden.bs.modal', function (e) {
	    console.log('responsive_workflow_modal is closed.');

	    if (!$('#responsive_workflow_modal').hasClass('show')) {
	        $('#commentSection').empty();
	        $('#getReceiver_2nd').empty();
	        $('#getReceiver_3rd').empty();
	    }
	});
	
});
