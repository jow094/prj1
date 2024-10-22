$(document).ready(function () {

	$(document).on('click', '#extend_user_setting', function (e) {
		extendUserSetting();
	});
	
    $(document).on('click', function (e) {
        if (!$(e.target).closest('#user_setting').length 
        		&& !$(e.target).closest('#extend_user_setting').length 
        		&& $('#user_setting').css('display') === 'flex')
        {
        	closeUserSetting();
        }
    });

    $(document).on('keydown', function (e) {
        if (e.key === "Escape" && $('#user_setting').css('display') === 'flex') {
    		closeUserSetting();
        }
    });
    
    $(document).on('click', '#update_setting', function (e) {
    	runUserSetting();
    });
});

function extendUserSetting() {
	console.log('user_setting form extended!');
	document.getElementById("user_setting").style.animation = 'dropDown 0.5s forwards'; // 페이드인 효과
	document.getElementById("user_setting").style.display = 'flex';
	$('#setting_search_result').empty();
}

function closeUserSetting() {
	console.log('user_setting form closed!');
	document.getElementById("user_setting").style.animation = 'dropUp 0.5s forwards'; // 페이드인 효과
	setTimeout(function() {
		document.getElementById("user_setting").style.display = 'none';
		$('#setting_search_result').empty();
    }, 500); // 애니메이션 시간과 동일하게 설정
}







let prev_setting_search;

function setting_search(input) {
	const keyword = input.replace(/\s+/g, '');
	$('#setting_search_result').empty();

	if (keyword.length >= 2 && /^[a-zA-Z가-힣0-9]+$/.test(keyword)) {
			if (prev_setting_search) {
				prev_setting_search.abort();
				}
				prev_setting_search = 
					$.ajax({
					url: '/member/search',
					type: 'GET',
					data: { keyword: keyword },
					success: function (data) {
						console.log('correct value input. start search, result:', data);
						if (data.length === 0) {
							$('#setting_search_result').append(`
					    			<div style="display:flex; height:25px; width:83%; flex-shrink: 0; border-bottom:1px solid rgba(0,0,0,0.1); margin-left:50px;"> 
										"${keyword}" 로 검색한 결과값이 없습니다.
									</div>
						    `);
							}else{
								showResult(data);
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

function showResult(data) {
    let count = 0;
    for (const result of data) {
    	$('#setting_search_result').append(`
    			<div style="display:flex; height:25px; width:83%; flex-shrink: 0; border-bottom:1px solid rgba(0,0,0,0.1); margin-left:50px;"> 
						${result}
				</div>
	    `);
    }
}