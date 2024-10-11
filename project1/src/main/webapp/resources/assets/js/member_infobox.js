$(document).ready(function () {
	$('#get_employee_info').on('show.bs.modal', function (e) {
	    var emp_id = $(this).data('emp_id');
	    
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

});