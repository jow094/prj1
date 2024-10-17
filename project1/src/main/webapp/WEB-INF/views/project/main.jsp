<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
  <head>

  
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="UTF-8">
    <title>INIT - HOME</title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link
      rel="icon"
      href="${pageContext.request.contextPath }/resources/assets/img/project/favicon_black.png"
      style="border-radius: 50%;"
      type="image/x-icon"
    />

    <!-- Fonts and icons -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["${pageContext.request.contextPath }/resources/assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/kaiadmin.min.css" />
    
    <!--   Core JS Files   -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/core/jquery-3.7.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/js/core/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/js/core/bootstrap.min.js"></script>

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/demo.css" />
    
   	<script src="${pageContext.request.contextPath }/resources/assets/js/calender.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
  </head>
  <body>
    <div class="wrapper">
      <%@ include file="/resources/assets/inc/sidebar.jsp" %> <!-- sidebar -->
      <div class="main-panel">
        <div class="main-header">
          <%@ include file="/resources/assets/inc/logo_header.jsp" %> <!-- Logo Header -->
          <%@ include file="/resources/assets/inc/navbar.jsp" %> <!-- Navbar -->
        </div>
        <div class="container">
          <div class="page-inner" style="background-color : rgba(250,250,250,0.7);  height: 90vh; display:flex; flex-direction:column; justify-content: space-between; align-content: flex-end;">
<!------------------------------------------------------------------------------------------------------------------>
<!-- header start -->
<div class="header-box" style="display:flex; width: 100%; flex:0.1; box-sizing: border-box;">
	<div class="page-header" style="flex:0.4;">
	  <h3 class="fw-bold mb-3">HOME</h3>
	  <ul class="breadcrumbs mb-3">
	    <li class="nav-home">
	      <a href="#">
	        <i class="icon-home"></i>
	      </a>
	    </li>
	    <li class="separator">
	      <i class="icon-arrow-right"></i>
	    </li>
	    <li class="nav-item">
	      <a href="#">Something</a>
	    </li>
	    <li class="separator">
	      <i class="icon-arrow-right"></i>
	    </li>
	    <li class="nav-item">
	      <a href="#">something</a>
	    </li>
	  </ul>
	</div>
	<div style="display: flex; flex:0.6; justify-content: flex-end;">
		<div class="card-box button">
			<div class="card">
				<div class="card-body">
					<div>+</div>
				</div>
			</div>
		</div>
		<div class="card-box button">
			<div class="card">
				<div class="card-body">
					<div>+</div>
				</div>
			</div>
		</div>
		<div class="card-box button">
			<div class="card">
				<div class="card-body">
					<div>+</div>
				</div>
			</div>
		</div>
		<div class="card-box button">
			<div class="card">
				<div class="card-body">
					<div>+</div>
				</div>
			</div>
		</div>
		<div>
			<button style="background: transparent; border: none; padding: 0; cursor: pointer; outline: none;">
				<i style="color: rgba(0,0,0,0.5); font-size: 24px;" class="fa-solid fa-gear"></i>
			</button>
		</div>
	</div>
</div>
<!-- header end -->
<!-- contents start -->
<div class="contents-box" style="display:flex; flex-direction:column; justify-content: space-between; width: 100%; box-sizing: border-box; flex:0.9;">
	
	<!-- 중단 -->
	<div style="flex:0.3; display: flex; justify-content: space-between; align-content: center; margin-top: 10px;">
		<div style="flex:0.3;">
			<div id="main-notify-box" style="width:100%; height:100%; display:flex; flex-direction:column;">
				<div class="main-box-title">
					<div class="run">
					공지사항
					</div>
				</div>
				<div class="main-box-body" style="display:flex; flex-direction:column;">
					<div></div>
					<div></div>
				</div>
			</div>		
		</div>
		<div style="flex:0.3;">
			<div id="main-board-box" style="width:100%; height:100%; display:flex; flex-direction:column;">
				<div class="main-box-title">
					<div>교육 일정</div>
					<div>우수 사원</div>
				</div>
				<div class="main-box-body" style="display:flex; flex-direction:column;">
					<div></div>
					<div></div>
				</div>
			</div>	
		</div>
		<div style="flex:0.25;">
			<div id="main-info-box" style="width:100%; height:130%; display:flex; flex-direction:column;">
				<div style="width:100%; background-color: gray; height:100%;">
				</div>
			</div>	
		</div>
	</div>
	<!-- 중단 -->
	<!-- 최하단 -->
	<div style="flex:0.7; display: flex; justify-content: space-between; margin-top: 10px;">
		
		<div class="col-md-4" style="display:flex; flex-direction:column; justify-content: flex-end;  align-content: flex-end;">
			<div class="card-box md">
				<div class="card">
					<div class="card-header">
					<h4 class="card-title">MESSENGER</h4>
					</div>	
					<div class="card-body">
						<div class="messenger_body">
							<!-- 메뉴 -->
							<div class="messenger_body_menu">
								<!-- persons -->
								<div style="display:flex;">
									<div style="flex:0.3; display:flex; justify-content: center;  align-items: center;">
									이미지
									</div>
									<div style="flex:0.5; display:flex; flex-direction: column;">
										<div style="display:flex; flex:0.4;">
											<div style="flex:0.4; height:auto; display:flex; justify-content: center;  align-items: center;">
											사원
											</div>
											<div style="flex:0.6; height:auto; display:flex; justify-content: center;  align-items: center;">
											조우영
											</div>
										</div>
										<div style="flex:0.3; display:flex; padding-left:20px; justify-content: flex-start;  align-items: center;">
										부산지사
										</div>
										<div style="display:flex; flex:0.3;">
											<div style="flex:0.5; height:auto; display:flex; justify-content: center;  align-items: center;">
											개발부
											</div>
											<div style="flex:0.5; height:auto; display:flex; justify-content: center;  align-items: center;">
											ㅇㅇㅇ
											</div>
										</div>
									</div>
									<div style="flex:0.2; display:flex; flex-direction:column; justify-content: center;  align-items: center;">
										<div>상태</div>
										<div>메세지</div>
									</div>
								</div>
								<!-- persons -->
							</div>
							<!-- 메뉴 -->
							
							
							<!-- <div class="messenger_body_chat list">
								<div style="display:flex; justify-content: center; align-items: center;">
									<div style="flex:2; display:flex; justify-content: center; align-items: center;">
									이미지
									</div>
									<div style="flex:6; display:flex; flex-direction:column; justify-content: center; align-items: center;">
										<div style="flex:3; display:flex; width:100%; justify-content: flex-start; align-items: center; padding-left:10px;">
											<div style="flex:0.1; height:100%; display:flex; justify-content: center; align-items: center;">
											사원
											</div>
											<div style="flex:0.3; height:100%; display:flex; justify-content: center; align-items: center;">
											조우영
											</div>
											<div style="flex:0.6; height:100%; display:flex; justify-content: flex-end; align-items: center;">
											수신시각
											</div>
										</div>
										<div style="flex:7; display:flex; width:100%; justify-content: center; align-items: center;">
										내용
										</div>
									</div>
									<div style="flex:1; display:flex; justify-content: center; align-items: center;">
									갯수
									</div>
								</div>
							</div> -->
							
							<!-- 채팅방-->
							<div class="messenger_body_chat onchat">
								<!-- 채팅방 상단 -->
								<div style="display:flex; flex:0.1; width:100%; border:1px solid;">
									<div style="display:flex; flex:0.1; border:1px solid; justify-content: center; align-items: center;">
									뒤로가기
									</div>
									<div style="display:flex; flex:0.9; flex-direction:column">
										<div id="msg_target_position" style="display:flex; flex:0.4; width:100%; border:1px solid; padding-left:10px; justify-content: flex-start; align-items: center;">
										사원
										</div>
										<div id="msg_target_name" style="display:flex; flex:0.6; width:100%; border:1px solid; padding-left:10px; justify-content: flex-start; align-items: center;">
										조우영
										</div>
									</div>
								</div>
								<!-- 채팅방 상단 -->
								
								<!-- 채팅방 안쪽 -->
								<div style="display:flex; flex-direction:column; flex:0.7; width:100%; border:1px solid; padding:0 10px; overflow-y: auto;"> 
									<!-- 받은 메세지 -->
									<div class="r_msg_box" style="display:flex; width:370px; border:1px solid; padding-bottom: 3px;">
										<div id="r_msg_sender_img" style="border:1px solid; width:50px; height:50px; margin-top:10px;">
										이미지
										</div>
										<div style="width:400px; border:1px solid; display:flex; flex-direction:column;">
											<div style="display:flex; height:30px; border:1px solid;">
												<div id="r_msg_sender_position" style="border:1px solid; padiing:0 5px;">
												사원
												</div>
												<div id="r_msg_sender_name" style="border:1px solid;">
												조우영
												</div>
											</div>
											<div class="msg_box" style="display:flex; overflow:auto; ">
											    <div class="msg_contents" style="display:flex; flex-direction:column; float:left; min-width:150px; max-width:360px; padding:3px;  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4); border-radius:3px; background-color:rgba(150,200,250,0.3)">
											       	<div id="r_msg_content" style="min-height:30px;">
													받은 메세지
													</div>	    
													<div id="r_msg_create_date" style="height:20px; text-align:right;">
													10.17 18:00
													</div>	  
											    </div>
											    <div style="height:100%; width:10px; border:1px solid; display:flex; justify-content: flex-end; align-items: flex-end;">
											    <span id="r_msg_unread_count">1</span>
											    </div>
											</div>
										</div>
									</div>
									<!-- 받은 메세지 -->
									
									<!-- 보낸 메세지 -->
									<div class="msg_box" style="display:flex; width:370px; border:1px solid; padding-bottom: 3px; margin-left:auto;">
										<div style="height:100%; width:10px; border:1px solid; display:flex; justify-content: flex-end; align-items: flex-end; margin-left:auto;">
										<span id="s_msg_unread_count">1</span>
									    </div>
										<div class="msg_contents" style="display:flex; flex-direction:column; float:right; min-width:150px; max-width:360px; padding:3px;  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4); border-radius:3px; background-color:rgba(0,0,150,0.2)">
									       	<div id="s_msg_content" style="min-height:30px;">
											보낸 메세지
											</div>	    
											<div id="s_msg_create_date" style="height:20px; text-align:right;">
											10.17 18:00
											</div>	  
									    </div>
									</div>
									<!-- 보낸 메세지 -->
								</div>
								<!-- 채팅방 안쪽 -->
								
								<!-- 채팅방 입력란 -->
								<div class="input_chat" style="display:flex; flex:0.2; width:100%; border:1px solid;"> 
									<form action="/project/sendMessage" method="POST" style="display:flex; width:100%; height:100%;">
										<div id="msg_textarea" style="flex:0.9; height:100%;">
											<textarea style="width:100%; height:100%; resize: none;"></textarea>
										</div>
										<div id="msg_submit" style="display:flex; flex:0.1; height:100%; justify-content: center; align-items: center;">
											<button type="submit" style="width:100%; height:100%; background: transparent; border: none; padding: 0; cursor: pointer; outline: none;">
												<i style="background:transparent;" class="fa-solid fa-paper-plane"></i>
											</button>
										</div>
									</form>
								</div>
								<!-- 채팅방 입력란 -->
							</div>
							<!-- 채팅방 -->
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>		
		
		<div class="col-md-4" style="display:flex; flex-direction:column; justify-content: flex-end;  align-content: flex-end;">
			<div class="card-box md">
				<div class="card">
					<div class="card-header">
					<h4 class="card-title">WORKFLOWS</h4>
					</div>	
					<div class="card-body">
                    <div class="workflow_table" style="height:600px; overflow-y: auto;">
                      <table class="display table table-striped table-hover multi-filter-select">
                        <thead style="position: sticky; top: 0; z-index: 10;">
                          <tr>
                            <th style="width: 3%;">NUM</th>
                            <th style="width: 3%;">TYPE</th>
                            <th style="width: 50%;">TITLE</th>
                            <th style="width: 18%;">RECEIVER</th>
                            <th style="width: 3%;">STATUS</th>
                            <th style="width: 23%;">DATE</th>
                          </tr>
                        </thead>
                        <tfoot>
                        </tfoot>
                        <tbody class="workflow_modal">
                          <c:forEach var="workflow" items="${receivedWorkflowList}">
					        <tr>
					            <td style="text-align: center;">
					            	<a data-wf_code="${workflow.wf_code}" id="workflow_info">
					            		${workflow.wf_code}
					            	</a>
					            </td>
					            <td style="text-align: center;">
						            <a data-wf_code="${workflow.wf_code}" id="workflow_info">
						            	${workflow.wf_type}
						            </a>
						        </td>
					            <td>
						            <a data-wf_code="${workflow.wf_code}" id="workflow_info">
			                        	${workflow.wf_title}
			                        </a>
		                        </td>
					            <td style="text-align: center;">
						            <a data-wf_code="${workflow.wf_code}" id="workflow_info">
						            	${workflow.receiver_name}
						            </a>
					            </td>
					            <td style="text-align: center;">
					            	<a data-wf_code="${workflow.wf_code}" id="workflow_info">
					            		${workflow.wf_status}
					            	</a>
					            </td>
					            <td style="text-align: center;">
					            	<a data-wf_code="${workflow.wf_code}" id="workflow_info">
					           			<fmt:formatDate value="${workflow.wf_create_date}" pattern="yy.MM.dd HH:mm" />
					           		</a>
					           	</td>
					        </tr>
					      </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
				</div>
			</div>
		</div>
		
		<div class="col-md-3" style="display:flex; flex-direction:column; justify-content: flex-end;  align-content: flex-end;">
			<div class="card-box" style="height:600px;">
				<div class="card" style="width:96%; height:96%; margin:0px;">
					<div class="card-header">
					<h4 class="card-title">CALENDER</h4>
					</div>	
					<!-- calender start -->
						<%@ include file="/resources/assets/inc/calendar.jsp" %>
					<!-- calender end -->
				</div>
			</div>
		</div>
	</div>
	<!-- 최하단 -->
	
	
	
</div>
<!-- contents end -->
<!------------------------------------------------------------------------------------------------------------------>
          </div>
          <!-- page-inner -->
        </div>
		<!-- container -->
        <%@ include file="/resources/assets/inc/footer.jsp" %>
      </div>
      <!-- main-panel -->
    </div>
    <!-- main-wrapper -->
    
	<!-- jQuery Scrollbar -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	
	<!-- Chart JS -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/plugin/chart.js/chart.min.js"></script>
	
	<!-- jQuery Sparkline -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>
	
	<!-- Chart Circle -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/plugin/chart-circle/circles.min.js"></script>
	
	<!-- Datatables -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/plugin/datatables/datatables.min.js"></script>
	
	<!-- Bootstrap Notify -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
	
	<!-- jQuery Vector Maps -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/js/plugin/jsvectormap/world.js"></script>
	
	<!-- Sweet Alert -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>
	
	<!-- Kaiadmin JS -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/kaiadmin.min.js"></script>
	
	<c:if test="${logined == true}">
	  	<%@ include file="/resources/assets/inc/login_alarm_modal.jsp" %>
	</c:if>
		
	
	</body>
</html>
