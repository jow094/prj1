<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link
      rel="icon"
      href="${pageContext.request.contextPath }/resources/assets/img/kaiadmin/favicon.ico"
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
        },
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/demo.css" />
  </head>
  <body>
    <div class="wrapper">
      <%@ include file="/resources/assets/inc/sidebar.jsp" %> <!-- sidebar -->
      <div class="main-panel">
        <div class="main-header">
          <%@ include file="/resources/assets/inc/logo_header.jsp" %> <!-- Logo Header -->
          <%@ include file="/resources/assets/inc/navbar.jsp" %> <!-- Navbar Header -->
        </div>
        <div class="container">
          <div class="page-inner">
<!------------------------------------------------------------------------------------------------------------------>
            <!-- workflow_header start -->
            <div class="page-header">
              <h3 class="fw-bold mb-3">WORK FLOW</h3>
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
                  <a href="#">WORK FLOW</a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="#">On working</a>
                </li>
              </ul>
            </div>
            <!-- workflow_header end -->
            
            <!-- workflow_header_2 start -->
             <div class="page-header">
              <h4 class="card-title">On working &nbsp; </h4> 
              <h3> &nbsp; / &nbsp; </h3> 
              <h5><a href="/project/workoff">&nbsp; Off working</a></h5>
            </div>
            <!-- workflow_header_2 end -->
            
            <!-- workflow_sent start -->
			<div class="row">
              <div class="col-md-6">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title">SENT</h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table
                        id="multi-filter-select-workflow-sent"
                        class="display table table-striped table-hover"
                      >
                        <thead>
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
                          <tr>
                            <th>NUM</th>
                            <th>TYPE</th>
                            <th>TITLE</th>
                            <th>RECEIVER</th>
                            <th>STATUS</th>
                            <th>DATE</th>
                          </tr>
                        </tfoot>
                        <tbody>
                          <c:forEach var="workflow" items="${sentWorkflowList}">
					        <tr>
					            <td style="text-align: center;">
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
					            		${workflow.wf_code}
					            	</a>
					            </td>
					            <td style="text-align: center;">
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
						            	${workflow.wf_type}
						            </a>
						        </td>
					            <td>
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
			                        	${workflow.wf_title}
			                        </a>
		                        </td>
					            <td style="text-align: center;">
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
						            	${workflow.wf_receiver}
						            </a>
					            </td>
					            <td style="text-align: center;">
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
					            		${workflow.wf_status}
					            	</a>
					            </td>
					            <td style="text-align: center;">
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
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
            <!-- workflow_sent end -->
            <!-- workflow_received start -->
              <div class="col-md-6">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title">RECEIVED</h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table
                        id="multi-filter-select-workflow-received"
                        class="display table table-striped table-hover"
                      >
                        <thead>
                          <tr>
                            <th style="width: 3%;">NUM</th>
                            <th style="width: 3%;">TYPE</th>
                            <th style="width: 50%;">TITLE</th>
                            <th style="width: 18%;">SENDER</th>
                            <th style="width: 3%;">STATUS</th>
                            <th style="width: 23%;">DATE</th>
                          </tr>
                        </thead>
                        <tfoot>
                          <tr>
                            <th>NUM</th>
                            <th>TYPE</th>
                            <th>TITLE</th>
                            <th>SENDER</th>
                            <th>STATUS</th>
                            <th>DATE</th>
                          </tr>
                        </tfoot>
                        <tbody>
                          <c:forEach var="workflow" items="${receivedWorkflowList}">
					        <tr>
					           <td style="text-align: center;">
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
					            		${workflow.wf_code}
					            	</a>
					            </td>
					            <td style="text-align: center;">
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
						            	${workflow.wf_type}
						            </a>
						        </td>
					            <td>
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
			                        	${workflow.wf_title}
			                        </a>
		                        </td>
					            <td style="text-align: center;">
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
						            	${workflow.wf_sender}
						            </a>
					            </td>
					            <td style="text-align: center;">
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
					            		${workflow.wf_status}
					            	</a>
					            </td>
					            <td style="text-align: center;">
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfread">
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
            <!-- workflow_received end -->
            
            <!-- workflow modal start-->
		    <div class="modal fade" id="wfread" tabindex="1" aria-labelledby="wfDetail" aria-hidden="true">
				<div class="modal-dialog modal-xl">
					<!-- modal content start -->
					<div class="modal-content" style="background-color: rgba(0,0,0,0.3);">
						<!-- modal body start -->
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<div class="card" style="margin:0;">
										<div class="card-header" style="display:flex;" >
											<div class="card-title" style="flex:99;">READ WORKFLOW</div>
											<div style="flex:1;">
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
										</div>
										<!-- card body start -->
										<div class="card-body">
											<form action="/project/wfresponse" method="POST">
												<div class="row">
													<div class="col-md-6 col-lg-2" style="border-bottom: 1px solid rgba(0,0,0,0.1);">
														<div class="form-group">
											                <label class="control-label"> NUM </label>
											                <p id="wf_code" class="form-control-static"></p>
											                <input type="hidden" id="wf_code_hidden" name="wf_code"/>
									                    </div>
								                    </div>
								                    <div class="col-md-6 col-lg-2" style="border-bottom: 1px solid rgba(0,0,0,0.1);">
														<div class="form-group">
											                <label class="control-label"> TYPE </label>
											                <p id="wf_type" class="form-control-static"></p>
									                    </div>
								                    </div>
								                    <div class="col-md-6 col-lg-2" style="border-bottom: 1px solid rgba(0,0,0,0.1);">
														<div class="form-group">
											                <label class="control-label"> PROGRESS </label>
											                <p id="wf_progress" class="form-control-static"></p>
									                    </div>
								                    </div>
								                    <div class="col-md-6 col-lg-2" style="border-bottom: 1px solid rgba(0,0,0,0.1);">
														<div class="form-group">
											                <label class="control-label"> DATE </label>
											                <p id="wf_create_date" class="form-control-static"></p>
									                    </div>
								                    </div>
								                     <div class="col-md-6 col-lg-2" style="border-bottom: 1px solid rgba(0,0,0,0.1);">
														<div class="form-group getSender" >
											                <label class="control-label"> SENDER </label>
											                <a href="#">
												                <div class="form-group" style="height:80px; display: flex;">
											                    	<div style="display: flex; ">
											                    		<div style="display: flex; flex:0.3; align-items: center; justify-content: center;">
											                    			<img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
																        	alt="img1" 
																        	style="width: 40px; height: 40px; border-radius: 50%;">
											                    		</div>
											                    		<div style="flex:0.7; display: flex; flex-direction:column; margin-left:10px;">
											                    			<div style="flex:0.3; font-weight: bold; color: black;" id="wf_sender_emp_name">
											                    			</div>
											                    			<div style="flex:0.3; color: rgba(0, 0, 0, 0.7);" id="wf_sender_emp_dnum">
												                    		</div>
												                    		<div style="flex:0.3; color: rgba(0, 0, 0, 0.7);" id="wf_sender_emp_position">
												                    		</div>
											                    		</div>
											                     	</div>
											                    </div>
										                    </a>
									                    </div>
								                    </div>
								                    <div class="col-md-6 col-lg-2" style="border-bottom: 1px solid rgba(0,0,0,0.1);">
														<div class="form-group">
											                <label class="control-label"> RECEIVER </label>
											                <a href="#">
											            		<div class="form-group getReceiver" style="height:80px; display: flex;">
											                    	<div style="display: flex; ">
											                    		<div style="display: flex; flex:0.3; align-items: center; justify-content: center;">
											                    			<img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
																        	alt="img1" 
																        	style="width: 40px; height: 40px; border-radius: 50%;">
											                    		</div>
											                    		<div style="flex:0.7; display: flex; flex-direction:column; margin-left:10px;">
											                    			<div style="flex:0.3; font-weight: bold; color: black;" id="wf_receiver_emp_name">
											                    			</div>
											                    			<div style="flex:0.3; color: rgba(0, 0, 0, 0.7);" id="wf_receiver_emp_dnum">
												                    		</div>
												                    		<div style="flex:0.3; color: rgba(0, 0, 0, 0.7);" id="wf_receiver_emp_position">
												                    		</div>
											                    		</div>
											                     	</div>
											                    </div>
											            	</a>
									                    </div>
								                    </div>
												</div>
												<div class="row">
													 <div class="col-md-6 col-lg-8">
														<div class="form-group">
											                <label class="control-label"> TITLE </label>
											                <p id="wf_title" class="form-control-static"></p>
									                    </div>
									                    <div class="form-group">
									                        <div class="input-group" style="height: 400px;">
										                        <span 
											                        class="input-group-text" 
											                        style="writing-mode: vertical-lr; text-orientation: upright;">
										                       		CONTENT
										                        </span>
										                        <textarea
										                        id="wf_content"
										                        class="form-control"
										                        aria-label="With textarea"
										                        readonly
										                        style= "background-color: white !important;">
										                        </textarea>
									                         </div>
								                        </div>
									                    <div class="form-group">
											                <label class="control-label"> FILE </label>
											                <p id="wf_file" class="form-control-static"></p>
									                    </div>
								                    </div>
								                    <div class="col-md-6 col-lg-4" >
								                    	<!-- 1차승인자 start -->
									                     <div class="form-group getReceiver_1st" style="height:100px; display: flex; display: flex; flex-direction:column;">
									                     	<div style="flex:0.2;">
									                     		FIRST RECEIVER
									                     	</div>
									                     	<a href="#">
										                    	<div style="flex:0.8; display: flex; color: rgba(0, 0, 0, 0.7);">
										                    		<div style="display: flex; flex:0.2; align-items: center; justify-content: center;">
										                    			<img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
															        	alt="img1" 
															        	style="width: 40px; height: 40px; border-radius: 50%;">
										                    		</div>
										                    		<div style="flex:0.4; display: flex; flex-direction:column;">
										                    			<div style="flex:0.4; font-weight: bold; color: black;" id="wf_receiver_1st_emp_name">
										                    			</div>
										                    			<div style="flex:0.3;" id="wf_receiver_1st_emp_dnum">
											                    		</div>
											                    		<div style="flex:0.3;" id="wf_receiver_1st_emp_position">
											                    		</div>
										                    		</div>
										                    		<div style="flex:0.4; display: flex; flex-direction:column; align-items: center; justify-content: center;">
										                    			<div style="flex:0.7; display: flex; align-items: center; justify-content: center;" id="wf_result_1st">
										                    			</div>
										                    			<div style="flex:0.3; display: flex; align-items: center; justify-content: center;" id="wf_result_date_1st">
										                    			</div>
										                    		</div>
										                     	</div>
										                     </a>
									                     </div>
									                     <!-- 1차승인자 end -->
									                     <!-- 2차승인자 start -->
									                     <div class="form-group getReceiver_2nd" style="height:100px; display: flex; display: flex; flex-direction:column;">
									                     	<div style="flex:0.2;">
									                     		SECOND RECEIVER
									                     	</div>
									                     	<a href="#">
										                    	<div style="flex:0.8; display: flex; color: rgba(0, 0, 0, 0.7);">
										                    		<div style="display: flex; flex:0.2; align-items: center; justify-content: center;">
										                    			<img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
															        	alt="img1" 
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
										                    			<div style="flex:0.7; display: flex; align-items: center; justify-content: center;">
											                    			<p id="wf_result_2nd"></p>
										                    			</div>
										                    			<div style="flex:0.3; display: flex; align-items: center; justify-content: center;">
											                    			<p id="wf_result_date_2nd"></p>
										                    			</div>
										                    		</div>
										                     	</div>
										                     </a>
									                     </div>
									                     <!-- 2차승인자 end -->
									                     <!-- 3차승인자 start -->
									                     <div class="form-group getReceiver_3rd" style="height:100px; display: flex; display: flex; flex-direction:column;">
									                     	<div style="flex:0.2;">
									                     		THIRD RECEIVER
									                     	</div>
									                     	<a href="#">
										                    	<div style="flex:0.8; display: flex; color: rgba(0, 0, 0, 0.7);">
										                    		<div style="display: flex; flex:0.2; align-items: center; justify-content: center;">
										                    			<img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
															        	alt="img1" 
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
										                    			<div style="flex:0.7; display: flex; align-items: center; justify-content: center;">
											                    			<p id="wf_result_3rd"></p>
										                    			</div>
										                    			<div style="flex:0.3; display: flex; align-items: center; justify-content: center;">
											                    			<p id="wf_result_date_3rd"></p>
										                    			</div>
										                    		</div>
										                     	</div>
										                     </a>
									                     </div>
									                     <!-- 3차승인자 end -->
									                     <div class="form-group">
									                         <label for="comment">Comment</label>
									                         <textarea class="form-control" id="wf_comment" rows="5" name="wf_comment"></textarea>
								                         </div>
								                         <div class="form-group">
															 <label class="form-label">RESULT</label>
															 <div class="selectgroup w-100">
															 	<label class="selectgroup-item">
																	<input
																	   type="radio"
																	   name="wf_result"
																	   value="1"
																	   class="selectgroup-input"
																	 />
																	<span class="selectgroup-button selectgroup-button-icon">
										                         		<i class="fas fa-check"></i>
																	</span>
																</label>
																<label class="selectgroup-item">
																	<input
																	   type="radio"
																	   name="wf_result"
																	   value="0"
																	   class="selectgroup-input"
																	 />
																	<span class="selectgroup-button selectgroup-button-icon">
																		<i class="fas fa-ban"></i>
																	</span>
																</label>
																<label class="selectgroup-item">
																	<input
																	   type="radio"
																	   name="wf_result"
																	   value="2"
																	   class="selectgroup-input"
																	 />
																	<span class="selectgroup-button selectgroup-button-icon">
																		<i class="fas fa-redo"></i>
																	</span>
																</label>
															 </div>
														 </div>
														 
														 <div class="form-group">
									                         <div class="input-group">
										                         <button
										                         class="btn btn-black btn-border"
										                         type="submit"
										                         style="width:100%;"
										                         >
										                         SUBMIT
										                         </button>
									                         </div>
								                         </div>
														 
								                    </div>
												</div>
											</form>
										</div>
										<!-- card-body end -->
										<div class="card-action" id="commentSection">
										</div>
								   </div>
								   <!-- card end -->
								</div> 
							</div> 
						</div>
					</div>
					<!-- modal content end -->
				</div>
			</div>
            <!-- workflow modal end-->
            
            <!-- getMember modal start -->
		    <div class="modal fade" id="getMember" tabindex="2" aria-labelledby="memberDetail" aria-hidden="true" style="background-color: rgba(0,0,0,0.5);">
				<div class="modal-dialog modal-md" >
					<!-- modal content start -->
					<div class="modal-content" style="background-color: rgba(0,0,0,0.3);">
						<!-- modal body start -->
						<div class="modal-body">
							<div class="card" style="margin:0px; display:flex; flex-direction: column;">
								<div style="display:flex; background-color: rgba(0,0,0,0.1); flex:1; justify-content: flex-end; padding:10px;">
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<!-- card body start -->
								<div class="card-body" style="background-color: rgba(0,0,0,0.1); flex:99">
									<form action="" method="POST">
										<div class="form-group" style= "display: flex; height: 400px; flex-direction:column;">
											<div style="display: flex; flex:0.5;">
					                    		<div style="display: flex; flex:0.5; align-items: center; justify-content: center;">
					                    			<img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
										        	alt="img1" 
										        	style="width: 100px; height: 100px; border-radius: 50%;">
					                    		</div>
					                    		<div style="flex:0.5; display: flex; flex-direction:column;">
					                    			<div style="flex:0.2; font-weight: bold; color: black;" id="emp_name">
					                    				<input type="hidden" id="emp_id" name="emp_id"/>
					                    			</div>
					                    			<div style="flex:0.8; color: rgba(0, 0, 0, 0.7);">
					                    				<p id="emp_dnum"></p>
					                    				<p id="emp_bnum"></p>
					                    				<p id="emp_position"></p>
					                    				<p id="emp_tel"></p>
					                    				<p id="emp_email"></p>
						                    		</div>
					                    		</div>
					                    	</div>
					                    	<div style="display: flex; flex:0.5; border-top:1px solid rgba(0,0,0,0.1);">
					                    	</div>
						                </div>
						            </form>
						        </div>
								<!-- card-body end -->
						     </div>
						     <!-- card end -->
						</div> 
						<!-- modal body end -->
					</div>
					<!-- modal content end -->
				</div>
			</div>
			<!-- getMember modal end -->
                               
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
    
    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/core/bootstrap.min.js"></script>

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

    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/setting-demo.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/demo.js"></script>
    <script>
    $(document).ready(function () {
    	
    	var wf_data;
    	
	    $("#multi-filter-select-workflow-sent").DataTable({
			pageLength: 5,
			initComplete: function () {
				this.api()
				.columns()
				.every(function () {
					var column = this;
					var select = $('<select class="form-select"><option value=""></option></select>')
					.appendTo($(column.footer()).empty())
					.on("change", function () {
						var val = $.fn.dataTable.util.escapeRegex($(this).val().trim());
						column.search(val ? "^\\s*" + val + "\\s*$" : "", true, false).draw();
					});
		
					column
					.data()
					.unique()
					.sort()
					.each(function (d, j) {
						var textMatch = d.match(/>([^<]+)</); 
						var text = textMatch ? textMatch[1].trim() : '';
			
						if (text) {
							select.append('<option value="' + text + '">' + text + '</option>');
						}
					});
				});
			},
		});
	    
	    $("#multi-filter-select-workflow-received").DataTable({
			pageLength: 5,
			initComplete: function () {
				this.api()
				.columns()
				.every(function () {
					var column = this;
					var select = $('<select class="form-select"><option value=""></option></select>')
					.appendTo($(column.footer()).empty())
					.on("change", function () {
						var val = $.fn.dataTable.util.escapeRegex($(this).val().trim());
						column.search(val ? "^\\s*" + val + "\\s*$" : "", true, false).draw();
					});
		
					column
					.data()
					.unique()
					.sort()
					.each(function (d, j) {
						var textMatch = d.match(/>([^<]+)</); 
						var text = textMatch ? textMatch[1].trim() : '';
			
						if (text) {
							select.append('<option value="' + text + '">' + text + '</option>');
						}
					});
				});
			},
		});

		$('#wfread').on('show.bs.modal', function (e) {
			 	
			var button = $(e.relatedTarget);
			var wfCode = button.data('wfcode');
			
			$.ajax({
				url: '/project/wfread',
				type: 'GET',
				data: {wf_code: wfCode},
				success: function (data) {
					console.log('AJAX success, wf_code :', wfCode);
					console.log('taken data:', data);
					
					wf_data = data.resultWVO;
					
					const getDate = (stringDate) => {
					    if (!stringDate) return '';
					    const date = new Date(stringDate);
					    return String(date.getFullYear()).slice(-2) + '.' +
					        String(date.getMonth() + 1).padStart(2, '0') + '.' +
					        String(date.getDate()).padStart(2, '0') + ' / ' +
					        String(date.getHours()).padStart(2, '0') + ':' +
					        String(date.getMinutes()).padStart(2, '0');
					};
					
					/* val start */
					$('#wf_code_hidden').val(data.resultWVO.wf_code);
					console.log('wf_code for hidden : ', data.resultWVO.wf_code);
					/* val end */
					
					/* wf_info start */
					$('#wf_code').text(data.resultWVO.wf_code);
					$('#wf_type').text(data.resultWVO.wf_type);
					$('#wf_title').text(data.resultWVO.wf_title);
					$('#wf_file').text(data.resultWVO.wf_file);
					$('#wf_progress').text(data.resultWVO.wf_progress);
					$('#wf_level').text(data.resultWVO.wf_level);
					$('#wf_create_date').text(getDate(data.resultWVO.wf_create_date));
					$('#wf_content').text(data.resultWVO.wf_content);
					
					$('#wf_sender_emp_name').text(data.senderMVO.emp_name);
					$('#wf_sender_emp_dnum').text(data.senderMVO.emp_dnum);
					$('#wf_sender_emp_position').text(data.senderMVO.emp_position);
					
					$('#wf_receiver_emp_name').text(data.receiverMVO.emp_name);
					$('#wf_receiver_emp_dnum').text(data.receiverMVO.emp_dnum);
					$('#wf_receiver_emp_position').text(data.receiverMVO.emp_position);
					
					$('#wf_receiver_1st_emp_name').text(data.receiverMVO1.emp_name);
					$('#wf_receiver_1st_emp_dnum').text(data.receiverMVO1.emp_dnum);
					$('#wf_receiver_1st_emp_position').text(data.receiverMVO1.emp_position);
					/* wf_info end */
					
					/* wf_other receiver start */
					$('#wf_receiver_2nd_emp_name').text(data.receiverMVO2.emp_name);
					$('#wf_receiver_2nd_emp_dnum').text(data.receiverMVO2.emp_dnum);
					$('#wf_receiver_2nd_emp_position').text(data.receiverMVO2.emp_position);
					
					$('#wf_receiver_3rd_emp_name').text(data.receiverMVO3.emp_name);
					$('#wf_receiver_3rd_emp_dnum').text(data.receiverMVO3.emp_dnum);
					$('#wf_receiver_3rd_emp_position').text(data.receiverMVO3.emp_position);
					/* wf_other receiver end */
					
					/* wf_result text start */
					$('#wf_result_1st').text(data.resultWVO.wf_result_1st);
					$('#wf_result_2nd').text(data.resultWVO.wf_result_2nd);
					$('#wf_result_3rd').text(data.resultWVO.wf_result_3rd);
		            $('#wf_result_date_1st').text(getDate(data.resultWVO.wf_result_date_1st));
		            $('#wf_result_date_2nd').text(getDate(data.resultWVO.wf_result_date_2nd));
		            $('#wf_result_date_3rd').text(getDate(data.resultWVO.wf_result_date_3rd));
					/* wf_result text end */
					
					/* comment start */
					/* comment 1 start */
					if (data.resultWVO.wf_comment_1st != null) {
						$('#commentSection').append(`
							<a href="#">
								<div style="width: 100%; height: auto; flex-grow: 1; display: flex;">
								    <div style="width: 5%; display: flex; align-items: center; justify-content: center; padding-right:40px;">
								        <img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
								        	 alt="img1" 
								        	 style="width: 40px; height: 40px; border-radius: 50%;">
								    </div>
								    <div style="width: 95%; height: auto; display: flex; flex-direction: column; padding: 5px;">
								        <div class="getReceiver_1st" style="flex: 0.3; font-weight: bold; color: black;" id="comment_wf_receiver_1st_emp_name" >
								        </div>
								        <div style="flex: 0.7; display: flex;">
								            <div style="flex: 0.9; max-width: 90%; overflow-wrap: break-word; color: rgba(0, 0, 0, 0.7);" id="comment_wf_comment_1st">
								            </div>
								            <div style="flex: 0.1; color: rgba(0, 0, 0, 0.5); display: flex; align-items: flex-end; justify-content: flex-end;" id="comment_wf_result_date_1st">
								            </div>
								        </div>
								    </div>
								</div>
			                </a>
			            `);
					$('#comment_wf_receiver_1st_emp_name').text(data.receiverMVO1.emp_name);
					$('#comment_wf_comment_1st').text(data.resultWVO.wf_comment_1st);
					$('#comment_wf_result_date_1st').text(getDate(data.resultWVO.wf_result_date_1st));
			    	} else {
			    				console.log('No comment_1st available');
			    			}
					/* comment 1 end */
					/* comment 2 start */
					if (data.resultWVO.wf_comment_2nd != null) {
						$('#commentSection').append(`
							<a href="#">
								<div style="width: 100%; height: auto; flex-grow: 1; display: flex;">
								    <div style="width: 5%; display: flex; align-items: center; justify-content: center; padding-right:40px;">
								        <img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
								        	 alt="img1" 
								        	 style="width: 40px; height: 40px; border-radius: 50%;">
								    </div>
								    <div style="width: 95%; height: auto; display: flex; flex-direction: column; padding: 5px;">
								        <div class="getReceiver_2nd" style="flex: 0.3; font-weight: bold; color: black;" id="comment_wf_receiver_2nd_emp_name">
								        </div>
								        <div style="flex: 0.7; display: flex;">
								            <div style="flex: 0.9; max-width: 90%; overflow-wrap: break-word; color: rgba(0, 0, 0, 0.7);" id="comment_wf_comment_2nd">
								            </div>
								            <div style="flex: 0.1; color: rgba(0, 0, 0, 0.5); display: flex; align-items: flex-end; justify-content: flex-end;" id="comment_wf_result_date_2nd">
								            </div>
								        </div>
								    </div>
								</div>
			                </a>
			            `);
					$('#comment_wf_receiver_2nd_emp_name').text(data.receiverMVO2.emp_name);
					$('#comment_wf_comment_2nd').text(data.resultWVO.wf_comment_2nd);
					$('#comment_wf_result_date_2nd').text(getDate(data.resultWVO.wf_result_date_2nd));
			    	} else {
			    				console.log('No comment_2nd available');
			    			}
					/* comment 2 end */
					/* comment 3 start */
					if (data.resultWVO.wf_comment_3rd != null) {
						$('#commentSection').append(`
							<a href="#">
								<div style="width: 100%; height: auto; flex-grow: 1; display: flex;">
								    <div style="width: 5%; display: flex; align-items: center; justify-content: center; padding-right:40px;">
								        <img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
								        	 alt="img1" 
								        	 style="width: 40px; height: 40px; border-radius: 50%;">
								    </div>
								    <div style="width: 95%; height: auto; display: flex; flex-direction: column; padding: 5px;">
								        <div class="getReceiver_3rd" style="flex: 0.3; font-weight: bold; color: black;" id="comment_wf_receiver_3rd_emp_name">
								        </div>
								        <div style="flex: 0.7; display: flex;">
								            <div style="flex: 0.9; max-width: 90%; overflow-wrap: break-word; color: rgba(0, 0, 0, 0.7);" id="comment_wf_comment_3rd">
								            </div>
								            <div style="flex: 0.1; color: rgba(0, 0, 0, 0.5); display: flex; align-items: flex-end; justify-content: flex-end;" id="comment_wf_result_date_3rd">
								            </div>
								        </div>
								    </div>
								</div>
			                </a>
			            `);
					$('#comment_wf_receiver_3rd_emp_name').text(data.receiverMVO3.emp_name);
					$('#comment_wf_comment_3rd').text(data.resultWVO.wf_comment_3rd);
					$('#comment_wf_result_date_3rd').text(getDate(data.resultWVO.wf_result_date_3rd));
			    	} else {
			    				console.log('No comment_3rd available');
			    			}
					/* comment 3 end */
					
				},
				error: function(xhr, status, error) {
					console.error('AJAX 요청 실패:', status, error);
					console.log('xhr:', xhr);
				}
			});
		});
		
		$('#wfread').on('click', '.getSender', function(event) {
		    $('#getMember').data('emp_id', wf_data.wf_sender).modal('show');
		});

		$('#wfread').on('click', '.getReceiver', function() {
			$('#getMember').data('emp_id', wf_data.wf_receiver).modal('show');
		});

		$('#wfread').on('click', '.getReceiver_1st', function() {
		    $('#getMember').data('emp_id', wf_data.wf_receiver_1st).modal('show');
		});

		$('#wfread').on('click', '.getReceiver_2nd', function() {
		    $('#getMember').data('emp_id', wf_data.wf_receiver_2nd).modal('show');
		});

		$('#wfread').on('click', '.getReceiver_3rd', function() {
		    $('#getMember').data('emp_id', wf_data.wf_receiver_3rd).modal('show');
		});
		
		$('#getMember').on('show.bs.modal', function (e) {
		    var emp_id = $(this).data('emp_id');
		    
		    console.log('getMember : emp_id:', emp_id);
		    
		    $.ajax({
		        url: '/member/memberInfoModal',
		        type: 'GET',
		        data: {emp_id: emp_id},
		        success: function (emp) {
		            console.log('AJAX success, emp_id :', emp_id);
		            console.log('taken data:', emp);
		            
		            $('#emp_name').text(emp.emp_name);
					$('#emp_dnum').text(emp.emp_dnum);
					$('#emp_bnum').text(emp.emp_bnum);
					$('#emp_position').text(emp.emp_position);
					$('#emp_tel').text(emp.emp_tel);
					$('#emp_email').text(emp.emp_email);
		        },
		        error: function(xhr, status, error) {
		            console.error('AJAX 요청 실패:', status, error);
		            console.log('xhr:', xhr);
		        }
		    });
		});
		
		$('#wfread').on('hidden.bs.modal', function (e) {
		    console.log('wfread modal is closed.');

		    if (!$('#wfread').hasClass('show')) {
		        $('#commentSection').empty();
		    }
		});
		
		$('#getMember').on('hidden.bs.modal', function (e) {
			console.log('getMember modal is closed.');
		    $(this).css({
		        'top': '',
		        'left': '',
		        'transform': ''
		    });
		});
		

	var action =
    	'<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

    });
    </script>
  </body>
</html>
