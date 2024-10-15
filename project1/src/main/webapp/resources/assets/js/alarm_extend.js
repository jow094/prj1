$(document).ready(function () {
	$(document).on('click', '#extend_workflowAlarm', function (e) {
		if ($('#extended_navbar').css('display') === 'none') {
            extendNavbar();
        }
	});
		
	$(document).on('click', function (e) {
        if (!$(e.target).closest('#extended_navbar').length 
        		&& !$(e.target).closest('.modal').length
        		&& !$(e.target).closest('#extend_workflowAlarm').length
        		&& $('#extended_navbar').css('display') === 'block') 
        {
        	closeNavbar();
        }
    });

    $(document).on('keydown', function (e) {
        if (e.key === "Escape") {
        	closeNavbar();
        	
        }
    });	
});/* doc rdy end*/
	
function extendNavbar() {
	console.log('Navbar extended!');
	document.getElementById("extended_navbar").style.animation = 'dropDown 0.5s forwards';
	document.getElementById("extended_navbar").style.display = 'block';
	showAlarmedWorkflow();
}

function closeNavbar() {
    console.log('Navbar closed.');
    document.getElementById("extended_navbar").style.animation = 'dropUp 0.5s forwards';
    setTimeout(function() {
        document.getElementById("extended_navbar").style.display = 'none';
        $('#extended_navbar').empty();
    }, 500);
}

function showAlarmedWorkflow() {
	$.ajax({
		url: '/project/smallAlarm_workflow',
		type: 'GET',
		success: function (data) {
			console.log(data);
			if (data.length === 0) {
				$('#extended_navbar').append(`<p>Here is no alarm for workflow.</p>`); 
			}else{
				appendWorkflow(data);
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

const getDate = (stringDate) => {
    if (!stringDate) return '';
    const date = new Date(stringDate);
    return String(date.getFullYear()).slice(-2) + '.' +
	       String(date.getMonth() + 1).padStart(2, '0') + '.' +
	       String(date.getDate()).padStart(2, '0') + '_' +
	       String(date.getHours()).padStart(2, '0') + ':' +
	       String(date.getMinutes()).padStart(2, '0');
};

function appendWorkflow(workflowList) {
	$('#extended_navbar').append(`<p>Here are ${workflowList.length} unverified workflows.</p>`); 
	
	let count = 0;
    for (const workflowVO of workflowList) {
    	 $('#extended_navbar').append(`
            		<div style="display: flex; width:100%; height:100px; border-bottom:1px solid rgba(0,0,0,0.1);">
                		<a data-emp_id="${workflowVO.wf_sender}"  class="member_info">
                    		<div style="display: flex; flex:0.4; align-items: center; justify-content: center; border-right: 1px solid rgba(0,0,0,0.1); margin:15px 0px 15px 0px; ">
                    			<div style="display: flex; flex-direction:column; flex:0.4; align-items: center; justify-content: center;">
                    				<div style="flex:0.2; font-weight: bold width:100%;" >sender</div>
					        		<div style="flex:0.8; width:100%;">
						        		<img src="${workflowVO.sender_profile}"
						        		style=" width: 40px; height: 40px; border-radius: 50%;">
					        		</div>
					        	</div>
                    			<div style="display: flex; flex:0.6; flex-direction:column;">
                    				<div style="display: flex; width:100%; flex:0.4; font-weight: bold; align-items: center; justify-content: center;">
                    					${workflowVO.sender_name}
                    				</div>
                    				<div style="display: flex; width:100%; flex:0.2; align-items: center; justify-content: center;" >
                    					${workflowVO.sender_bnum}
                    				</div>
                    				<div style="display: flex; width:100%; flex:0.2; align-items: center; justify-content: center;">
                    					${workflowVO.sender_dnum}
                    				</div>
                    				<div style="display: flex; width:100%; flex:0.2; align-items: center; justify-content: center;" >
                    					${workflowVO.sender_position}
                    				</div>
                    			</div>
                    		</div>
                		</a>
                		<a data-wf_code="${workflowVO.wf_code}" id="workflow_info">
                    		<div style="display: flex; flex:0.6; flex-direction:column;">
	                    		<div style="display: flex; flex:0.5; width:100%;">
	                    			<div style="flex:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">
	                    				<div style="flex:0.5; font-weight: bold">type</div>
                    					<div style="flex:0.5;">${workflowVO.wf_type}</div>
	                    			</div>
	                    			<div style="flex:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">
	                    				<div style="flex:0.5; font-weight: bold">progress</div>
                    					<div style="flex:0.5;">${workflowVO.wf_progress}</div>
	                    			</div>
	                    			<div style="flex:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">
	                    				<div style="flex:0.5; font-weight: bold">date</div>
                    					<div style="flex:0.5;">${getDate(workflowVO.wf_progress === '1' ? workflowVO.wf_create_date : workflowVO.wf_last_result_date)}</div>
	                    			</div>
	                    		</div>
	                    		<div 
	                    		style="display: flex; flex:0.5; width:100%; align-items: center; justify-content: left; margin-left:30px; 
	                    		white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width:245px;">
	                    			${workflowVO.wf_title}
	                    		</div>
	                    	</div>
                    	</a>
                	</div>
            		`); 
    	 count ++;
    	 if (count >= 5) {
    	     break;
    	 }
    }
    if(workflowList.length > 5){
    	$('#extended_navbar').append(`
    			<a href="/project/workflow">
        			<div 
	        			id="notify" 
	        			style="
	        			display: flex; height:60px; border-bottom:1px solid rgba(0,0,0,0.1); align-items: center; justify-content: center;"
        			>
        				there is more `+(workflowList.length-5)+` received workflow to notify for you.
        			</div>
    			</a>
    	`); 
    }
}
