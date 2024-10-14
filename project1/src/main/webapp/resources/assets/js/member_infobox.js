$(document).ready(function () {
	
	let preventClose = false;
	
	$('#get_employee_info').on('show.bs.modal', function (e) {
		
		console.log('preventClose=true');
		preventClose = true;
		
		
	    var button = $(e.relatedTarget);
	    var emp_id = button.data('emp_id');
	    
	    $.ajax({
	        url: '/member/memberInfoModal',
	        type: 'GET',
	        data: {emp_id: emp_id},
	        success: function (emp) {
	            console.log('AJAX success for emp_id :', emp_id);
	            console.log('taken data:', emp);
	            
	            $('#emp_name').text(emp.emp_name);
				$('#emp_dnum').text(emp.emp_dnum);
				$('#emp_bnum').text(emp.emp_bnum);
				$('#emp_position').text(emp.emp_position);
				$('#emp_tel').text(emp.emp_tel);
				$('#emp_email').text(emp.emp_email);
	        },
	        error: function(xhr, status, error) {
	            console.error('AJAX fail:', status, error);
	            console.log('xhr:', xhr);
	        }
	    });
	});
	
	$('.modal').on('hide.bs.modal', function (e) {
		const modalId = $(this).attr('id'); // 현재 모달의 id를 가져옴
	    console.log(modalId, 'modal prevent event');
	    console.log('preventClose :',preventClose);
	    
	    if (preventClose && modalId !== 'get_employee_info') {
	    	console.log(modalId, 'modal prevent event run');
	        e.preventDefault(); // 현재 모달 닫기 방지
	    }
	});
	
	$('#get_employee_info').on('hidden.bs.modal', function () {
	    preventClose = false;
	});
	

});