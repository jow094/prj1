$(document).ready(function () {
	
	const getDate = (stringDate) => {
	    if (!stringDate) return '';
	    const date = new Date(stringDate);
	    return String(date.getFullYear()).slice(-2) + '.' +
		       String(date.getMonth() + 1).padStart(2, '0') + '.' +
		       String(date.getDate()).padStart(2, '0') + '_' +
		       String(date.getHours()).padStart(2, '0') + ':' +
		       String(date.getMinutes()).padStart(2, '0');
	};
	
	console.log('checkUnread ready');
	
	/* ajax start*/
	$.ajax({
	url: '/project/checkUnread',
	type: 'GET',
	success: function(data) {
		
		/* success start*/
		console.log('checkUnread run :',data);
		console.log('checkUnread run :',data.sentWorkflowList);
		console.log('checkUnread run :',data.receivedWorkflow_count);
		$('#welcome').text("welcome, dear " + data.emp_id);
		
		const sWorkflow = data.sentWorkflowList;
		
	    /*if(data.receivedWorkflow_count == 0 && sWorkflow.length == 0){
	    	$('.card-body').append(`
	    			<div 
	    			id="notify" 
	    			style="
	    			height:60px; width:100%; border-bottom:1px solid rgba(0,0,0,0.1); display: flex; align-items: center; justify-content: center; padding:10px;"
	    			>
            			there is no workflow to notify for you.
                	</div>
                	`);
	    }else{
		    if(data.receivedWorkflow_count > 0){
		    	$('#received_workflows').append(`
		    			<p>RECEIVED WORKFLOWS</p>
		    	`); 
		        for (let i = 0; i < 3; i++) {
		        	while (data['receivedWorkflow_' + i]) {
		                var workflow = data['receivedWorkflow_' + i];
		                var wf_sender = data['workflow_sender_' + i];
			            $('#received_workflows').append(`
			            		<div style="display: flex; height:100px; border-bottom:1px solid rgba(0,0,0,0.1);">
		                    		<div style="display: flex; flex:0.4; align-items: center; justify-content: center; border-right: 1px solid rgba(0,0,0,0.1); margin-bottom:15px; ">
		                    			<div style="display: flex; flex-direction:column; flex:0.4; align-items: center; justify-content: center;">
		                    				<div style="flex:0.2; font-weight: bold">sender</div>
							        		<div style="flex:0.8;">
								        		<img src="${wf_sender.emp_profile}"
								        		style=" width: 40px; height: 40px; border-radius: 50%;">
							        		</div>
							        	</div>
		                    			<div style="display: flex; flex:0.6; flex-direction:column;">
		                    				<div style="display: flex; flex:0.4; font-weight: bold; align-items: center; justify-content: center;">
		                    					${wf_sender.emp_name}
		                    				</div>
		                    				<div style="display: flex; flex:0.2; align-items: center; justify-content: center;" >
		                    					${wf_sender.emp_bnum}
		                    				</div>
		                    				<div style="display: flex; flex:0.2; align-items: center; justify-content: center;">
		                    					${wf_sender.emp_dnum}
		                    				</div>
		                    				<div style="display: flex; flex:0.2; align-items: center; justify-content: center;" >
		                    					${wf_sender.emp_position}
		                    				</div>
		                    			</div>
		                    		</div>
		                    		<div style="display: flex; flex:0.6; flex-direction:column;">
			                    		<div style="display: flex; flex:0.5;">
			                    			<div style="flex:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">
			                    				<div style="flex:0.5; font-weight: bold">type</div>
		                    					<div style="flex:0.5;">${workflow.wf_type}</div>
			                    			</div>
			                    			<div style="flex:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">
			                    				<div style="flex:0.5; font-weight: bold">progress</div>
		                    					<div style="flex:0.5;">${workflow.wf_progress}</div>
			                    			</div>
			                    			<div style="flex:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">
			                    				<div style="flex:0.5; font-weight: bold">date</div>
		                    					<div style="flex:0.5;">${getDate(workflow.wf_progress === '1' ? workflow.wf_create_date : workflow.wf_result_date)}</div>
			                    			</div>
			                    		</div>
			                    		<div 
			                    		style="display: flex; flex:0.5; align-items: center; justify-content: left; margin-left:30px; 
			                    		white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width:245px;">
			                    			${workflow.wf_title}
			                    		</div>
			                    	</div>
		                    	</div>
			            		`); 
	        		}
	            }
		        if(data.receivedWorkflow_count > 3){
		        	$('#received_workflows').append(`
		        			
		        			<div 
		        			id="notify" 
		        			style="
		        			display: flex; height:60px; border-bottom:1px solid rgba(0,0,0,0.1); align-items: center; justify-content: center;"
		        			>
		        			there is more `+(data.receivedWorkflow_count-3)+` received workflow to notify for you.
		        			</div>
		        	`); 
		        }
	        }
	        if(sWorkflow.length > 0){
		    	$('#sent_workflows').append(`
		    			<p>COMPLETED WORKFLOWS</p>
		    	`); 
		        for (let i = 0; i < 3; i++) {
		        	if(sWorkflow[i] != null){
			            const workflow = sWorkflow[i]; 
			            $('#sent_workflows').append(`
			            		<div style="display: flex; height:100px; border-bottom:1px solid rgba(0,0,0,0.1);">
		                    		<div style="display: flex; flex:0.4; align-items: center; justify-content: center; border-right: 1px solid rgba(0,0,0,0.1); margin-bottom:15px; ">
		                    			<div style="display: flex; flex-direction:column; flex:0.4; align-items: center; justify-content: center;">
		                    				<div style="flex:0.2; font-weight: bold">receiver</div>
							        		<div style="flex:0.8;">
								        		<img src=""
								        		style=" width: 40px; height: 40px; border-radius: 50%;">
							        		</div>
							        	</div>
		                    			<div style="display: flex; flex:0.6; flex-direction:column;">
		                    				<div style="display: flex; flex:0.4; font-weight: bold; align-items: center; justify-content: center;">
		                    					name
		                    				</div>
		                    				<div style="display: flex; flex:0.2; align-items: center; justify-content: center;" >
		                    					bnum
		                    				</div>
		                    				<div style="display: flex; flex:0.2; align-items: center; justify-content: center;">
		                    					dnum
		                    				</div>
		                    				<div style="display: flex; flex:0.2; align-items: center; justify-content: center;" >
		                    					position
		                    				</div>
		                    			</div>
		                    		</div>
		                    		<div style="display: flex; flex:0.6;">
		                    			<div style="flex:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">
		                    				<div style="flex:0.4; font-weight: bold">1st_result</div>
	                    					<div style="flex:0.3;">${workflow.wf_result_1st}</div>
	                    					<div style="flex:0.3;">${workflow.wf_receiver_1st}</div>
		                    			</div>
		                    			<div style="flex:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">
		                    				<div style="flex:0.4; font-weight: bold">2nd_result</div>
	                    					<div style="flex:0.3;">${workflow.wf_result_2nd}</div>
	                    					<div style="flex:0.3;">${workflow.wf_receiver_2nd}</div>
		                    			</div>
		                    			<div style="flex:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">
		                    				<div style="flex:0.4; font-weight: bold">3rd_result</div>
	                    					<div style="flex:0.3;">${workflow.wf_result_3rd}</div>
	                    					<div style="flex:0.3;">${workflow.wf_receiver_3rd}</div>
		                    			</div>
			                    	</div>
		                    	</div>
			            		`); 
			        	}
			        }
		        if(sWorkflow.length > 3){
		        	$('#sent_workflows').append(`
		        			<div 
		        			id="notify" 
		        			style="
		        			display: flex; height:60px; border-bottom:1px solid rgba(0,0,0,0.1); align-items: center; justify-content: center;"
		        			>
		        			there is more `+(sWorkflow.length-3)+` copleted workflow that you sent.
		        			</div>
		        	`); 
		        }
	        }
	    }*/
        $('#unread_workflow_modal').modal('show');
        
		},error: function(xhr, status, error) {
			console.error('AJAX 요청 실패:', status, error);
			console.log('xhr:', xhr);
		} 
	});
	/* ajax end*/
	
});