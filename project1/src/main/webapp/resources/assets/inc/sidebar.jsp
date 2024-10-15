<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/assets/inc/get_employee_info.jsp" %>
<%@ include file="/resources/assets/inc/realtime_alarm.jsp" %>
<%@ include file="/resources/assets/inc/workflow_modal.jsp" %>
      <!-- Sidebar -->
      <div class="sidebar" data-background-color="dark">
        <!-- Start logo -->
        <div class="sidebar-logo" >
          <div class="logo-header" style="background-color: rgba(0,0,0,0.8)">
            <a href="/project/main" class="logo">
              <img
                src=""
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
        <div class="sidebar-wrapper scrollbar scrollbar-inner" style="background-color: rgba(0,0,0,0.8)">
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
        </div>
      </div>
      <!-- End Sidebar -->
