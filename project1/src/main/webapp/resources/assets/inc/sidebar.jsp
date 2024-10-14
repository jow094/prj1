<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/inc/get_employee_info.jsp" %>
<%@ include file="/resources/assets/inc/realtime_alarm.jsp" %>
<%@ include file="/resources/assets/inc/workflow_modal.jsp" %>
      <!-- Sidebar -->
      <div class="sidebar" data-background-color="dark">
        <!-- Start logo -->
        <div class="sidebar-logo">
          <div class="logo-header" data-background-color="dark">
            <a href="index.html" class="logo">
              <img
                src="${pageContext.request.contextPath }/resources/assets/img/kaiadmin/logo_light.svg"
                alt="navbar brand"
                class="navbar-brand"
                height="20"
              />
            </a>
            <div class="nav-toggle">
              <button class="btn btn-toggle toggle-sidebar">
                <i class="gg-menu-right"></i>
              </button>
              <button class="btn btn-toggle sidenav-toggler">
                <i class="gg-menu-left"></i>
              </button>
            </div>
            <button class="topbar-toggler more">
              <i class="gg-more-vertical-alt"></i>
            </button>
          </div>
        </div>
        <!-- End Logo -->
        <div class="sidebar-wrapper scrollbar scrollbar-inner">
          <div class="sidebar-content">
            <ul class="nav nav-secondary">
              <li class="nav-item active">
                <a href="../project/main">
                  <i class="fas fa-home"></i>
                  <p>Main</p>
                  <span class="caret"></span>
                </a>
                <!-- <div class="collapse" id="dashboard"> 
                  <ul class="nav nav-collapse">
                    <li>
                      <a href="../project/main">
                        <span class="sub-item">Dashboard 1</span>
                      </a>
                    </li>
                  </ul>
                </div> Main 하위버튼--> 
              </li>
              
              <li class="nav-item">
		          <a href="../project/workflow">
		          	<span class="sub-item">WORK FLOW</span>
		          </a>
              </li>
              
              <!-- Components start -->
              <li class="nav-section">
                <span class="sidebar-mini-icon">
                  <i class="fa fa-ellipsis-h"></i>
                </span>
                <h4 class="text-section">Components</h4>
              </li>
              <!-- Components end-->
              
              <!-- Menu start -->
              <li class="nav-item">
                <a data-bs-toggle="collapse" href="#base"> <!-- href="" 를 여는 a태그 -->
                  <i class="fas fa-layer-group"></i> <!-- icon -->
                  <p>Title</p>
                  <span class="caret"></span>
                </a>
                <div class="collapse" id="base"> <!-- href="" 를 여는 a태그의 타겟 -->
                  <ul class="nav nav-collapse">
                    <li>
                      <a href="components/avatars.html">
                        <span class="sub-item">small_title</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </li>
              <!-- Menu start -->
            </ul>
          </div>
	          <button id="sent" class="showAlarmButton">보낸 요청 알람 보기</button>
	          <button id="received" class="showAlarmButton">받은 요청 알람 보기</button>
	          <button id="smallAlarmButton">알림 스택 쌓기</button>
        </div>
      </div>
      <!-- End Sidebar -->
