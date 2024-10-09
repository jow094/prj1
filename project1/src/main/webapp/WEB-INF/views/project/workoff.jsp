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
                  <a href="#">Off working</a>
                </li>
              </ul>
            </div>
            <!-- workflow_header end -->
            
            <!-- workflow_header_2 start -->
             <div class="page-header">
              <h5><a href="/project/workflow">&nbsp; On working</a></h5>
              <h3> &nbsp; / &nbsp; </h3> 
              <h4 class="card-title">Off working &nbsp; </h4>
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
                            <th style="width: 18%;">GETTER</th>
                            <th style="width: 3%;">STATUS</th>
                            <th style="width: 23%;">DATE</th>
                          </tr>
                        </thead>
                        <tfoot>
                          <tr>
                            <th>NUM</th>
                            <th>TYPE</th>
                            <th>TITLE</th>
                            <th>GETTER</th>
                            <th>STATUS</th>
                            <th>DATE</th>
                          </tr>
                        </tfoot>
                        <tbody>
                          <c:forEach var="workflow" items="${sentWorkflowList}">
					        <tr>
					            <td style="text-align: center;">
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
					            		${workflow.wf_code}
					            	</a>
					            </td>
					            <td style="text-align: center;">
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
						            	${workflow.wf_type}
						            </a>
						        </td>
					            <td>
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
			                        	${workflow.wf_title}
			                        </a>
		                        </td>
					            <td style="text-align: center;">
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
						            	${workflow.wf_getter}
						            </a>
					            </td>
					            <td style="text-align: center;">
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
					            		${workflow.wf_status}
					            	</a>
					            </td>
					            <td style="text-align: center;">
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
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
                            <th style="width: 18%;">GETTER</th>
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
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
					            		${workflow.wf_code}
					            	</a>
					            </td>
					            <td style="text-align: center;">
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
						            	${workflow.wf_type}
						            </a>
						        </td>
					            <td>
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
			                        	${workflow.wf_title}
			                        </a>
		                        </td>
					            <td style="text-align: center;">
						            <a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
						            	${workflow.wf_getter}
						            </a>
					            </td>
					            <td style="text-align: center;">
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
					            		${workflow.wf_status}
					            	</a>
					            </td>
					            <td style="text-align: center;">
					            	<a data-wfcode="${workflow.wf_code}" data-bs-toggle="modal" data-bs-target="#wfreadonly">
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
            
            <!-- 모달 start-->
		    <div class="modal fade" id="wfreadonly" tabindex="-1" aria-labelledby="wfDetailLabel" aria-hidden="true">
				<div class="modal-dialog modal-xl">
					<!-- modal content start -->
					<div class="modal-content">
						<!-- modal header start -->
						<div class="modal-header">
							<h5 class="modal-title" id="wfDetailLabel">WORKFLOW - Off working</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<!-- modal header end -->
						<!-- modal body start -->
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<div class="card" style="background-color:rgba(0, 0, 0, 0.05);">
										<div class="card-header">
											<div class="card-title">READ WORKFLOW</div>
										</div>
										<!-- card body start -->
										<div class="card-body">
											<form>
												<div class="row">
													<div class="col-md-6 col-lg-2">
														<div class="form-group">
											                <label class="control-label"> NUM </label>
											                <p id="wf_code" class="form-control-static"></p>
									                    </div>
								                    </div>
								                    <div class="col-md-6 col-lg-2">
														<div class="form-group">
											                <label class="control-label"> TYPE </label>
											                <p id="wf_type" class="form-control-static"></p>
									                    </div>
								                    </div>
								                    <div class="col-md-6 col-lg-2">
														<div class="form-group">
											                <label class="control-label"> STATUS </label>
											                <p id="wf_status" class="form-control-static"></p>
									                    </div>
								                    </div>
								                    <div class="col-md-6 col-lg-2">
														<div class="form-group">
											                <label class="control-label"> DATE </label>
											                <p id="wf_create_date" class="form-control-static"></p>
									                    </div>
								                    </div>
								                     <div class="col-md-6 col-lg-2">
														<div class="form-group">
											                <label class="control-label"> SENDER </label>
											                <p id="wf_sender" class="form-control-static"></p>
									                    </div>
								                    </div>
								                    <div class="col-md-6 col-lg-2">
														<div class="form-group">
											                <label class="control-label"> RECEIVER </label>
											                <p id="wf_getter" class="form-control-static"></p>
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
										                        readonly>
										                        </textarea>
									                         </div>
								                        </div>
									                    <div class="form-group">
											                <label class="control-label"> FILE </label>
											                <p id="wf_file" class="form-control-static"></p>
									                    </div>
								                    </div>
								                    <div class="col-md-6 col-lg-4">
								                    	 <!-- 1차승인자 start -->
									                     <div class="form-group" style="height:100px; display: flex; display: flex; flex-direction:column;">
									                     	<div style="flex:0.2;">
									                     		getter_1st
									                     	</div>
									                    	<div style="flex:0.8; display: flex; ">
									                    		<div style="display: flex; flex:0.2; align-items: center; justify-content: center;">
									                    			<img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
														        	alt="img1" 
														        	style="width: 40px; height: 40px; border-radius: 50%;">
									                    		</div>
									                    		<div style="flex:0.4; display: flex; flex-direction:column;">
									                    			<div style="flex:0.4; font-weight: bold; color: black;">
									                    				name
									                    			</div>
									                    			<div style="flex:0.3; color: rgba(0, 0, 0, 0.7);">
									                    				department
										                    		</div>
										                    		<div style="flex:0.3; color: rgba(0, 0, 0, 0.7);">
										                    			position
										                    		</div>
									                    		</div>
									                    		<div style="flex:0.4; display: flex; align-items: center; justify-content: center;">
									                    			result
									                    		</div>
									                     	</div>
									                     </div>
									                     <!-- 1차승인자 end -->
									                     <!-- 2차승인자 start -->
									                     <div class="form-group" style="height:100px; display: flex; display: flex; flex-direction:column;">
									                     	<div style="flex:0.2;">
									                     		getter_2st
									                     	</div>
									                    	<div style="flex:0.8; display: flex; ">
									                    		<div style="display: flex; flex:0.2; align-items: center; justify-content: center;">
									                    			<img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
														        	alt="img1" 
														        	style="width: 40px; height: 40px; border-radius: 50%;">
									                    		</div>
									                    		<div style="flex:0.4; display: flex; flex-direction:column;">
									                    			<div style="flex:0.4; font-weight: bold; color: black;">
									                    				name
									                    			</div>
									                    			<div style="flex:0.3; color: rgba(0, 0, 0, 0.7);">
									                    				department
										                    		</div>
										                    		<div style="flex:0.3; color: rgba(0, 0, 0, 0.7);">
										                    			position
										                    		</div>
									                    		</div>
									                    		<div style="flex:0.4; display: flex; align-items: center; justify-content: center;">
									                    			result
									                    		</div>
									                     	</div>
									                     </div>
									                     <!-- 2차승인자 end -->
									                     <!-- 3차승인자 start -->
									                     <div class="form-group" style="height:100px; display: flex; display: flex; flex-direction:column;">
									                     	<div style="flex:0.2;">
									                     		getter_3st
									                     	</div>
									                    	<div style="flex:0.8; display: flex; ">
									                    		<div style="display: flex; flex:0.2; align-items: center; justify-content: center;">
									                    			<img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
														        	alt="img1" 
														        	style="width: 40px; height: 40px; border-radius: 50%;">
									                    		</div>
									                    		<div style="flex:0.4; display: flex; flex-direction:column;">
									                    			<div style="flex:0.4; font-weight: bold; color: black;">
									                    				name
									                    			</div>
									                    			<div style="flex:0.3; color: rgba(0, 0, 0, 0.7);">
									                    				department
										                    		</div>
										                    		<div style="flex:0.3; color: rgba(0, 0, 0, 0.7);">
										                    			position
										                    		</div>
									                    		</div>
									                    		<div style="flex:0.4; display: flex; align-items: center; justify-content: center;">
									                    			result
									                    		</div>
									                     	</div>
									                     </div>
									                     <!-- 3차승인자 end -->
									                     
									                     <div class="form-group">
									                         <label for="comment">Comment</label>
									                         <textarea class="form-control" id="comment" rows="5" readonly>
									                         	this workflow is completed at 00:00.
									                         </textarea>
								                         </div>
								                         <div class="form-group">
															 <label class="form-label">RESULT</label>
															 <div class="selectgroup w-100">
															 	<label class="selectgroup-item">
																	<input
																	   type="radio"
																	   name="wf_result"
																	   value="2"
																	   class="selectgroup-input"
																	   checked
																	 />
																	<span class="selectgroup-button selectgroup-button-icon">
										                         		<i class="fas fa-check"></i>
																	</span>
																</label>
																<label class="selectgroup-item">
																	<input
																	   type="radio"
																	   name="wf_result"
																	   value="2"
																	   class="selectgroup-input"
																	   disabled
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
																	   disabled
																	 />
																	<span class="selectgroup-button selectgroup-button-icon">
																		<i class="fas fa-redo"></i>
																	</span>
																</label>
															 </div>
														 </div>
								                    </div>
												</div>
											</form>
										</div>
										<!-- card-body end -->
										<div class="card-action">
											<a href="#">
												<div style="width: 100%; height: auto; flex-grow: 1; display: flex;">
												    <!-- 프로필 사진 -->
												    <div style="width: 5%; display: flex; align-items: center; justify-content: center; padding-right:40px;">
												        <img src="${pageContext.request.contextPath }/resources/assets/img/jm_denis.jpg"
												        	 alt="img1" 
												        	 style="width: 40px; height: 40px; border-radius: 50%;">
												    </div>
												    <div style="width: 95%; height: auto; display: flex; flex-direction: column; padding: 5px;">
												        <!-- 이름 -->
												        <div style="flex: 0.3; font-weight: bold; color: black;">
															writer
												        </div>
												        <div style="flex: 0.7; display: flex;">
												      		<!-- 댓글내용 -->
												            <div style="flex: 0.9; max-width: 90%; overflow-wrap: break-word; color: rgba(0, 0, 0, 0.7);">
												           		content
												            </div>
												      		<!-- 작성시각 -->
												            <div style="flex: 0.1; color: rgba(0, 0, 0, 0.5); display: flex; align-items: flex-end; justify-content: flex-end;">
												            	date
												            </div>
												        </div>
												    </div>
												</div>
							                </a>
										</div>
								   </div>
								   <!-- card end -->
							</div> 
						</div>
						<!-- modal footer start -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						</div>
						<!-- modal footer end -->
					</div>
					<!-- modal content end -->
				</div>
			</div>
            <!-- 모달 end-->
          
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

		$('#wfreadonly').on('show.bs.modal', function (e) {
			 	
			var button = $(e.relatedTarget);
			var wfCode = button.data('wfcode');
			 	
			$.ajax({
				url: '/project/wfread',
				type: 'GET',
				data: {wf_code: wfCode},
				success: function (data) {
					console.log('AJAX success, wf_code :', wfCode);
					console.log('taken data:', data);
					console.log('createDate:', data.wf_create_date);
					         	
					const DBdate = data.wf_create_date;
					const date = new Date(DBdate);
					console.log('date:', date); 
					         	
					const resultDate = 
					String(date.getFullYear()).slice(-2) + '.' + // YY
					String(date.getMonth() + 1).padStart(2, '0') + '.' + // MM
					String(date.getDate()).padStart(2, '0') + ' / ' + // DD
					String(date.getHours()).padStart(2, '0') + ':' + // HH
					String(date.getMinutes()).padStart(2, '0'); // MM
					
					console.log('resultDate:', resultDate); // 변환된 날짜를 출력
					         	
					$('#wf_code').text(data.wf_code);
					$('#wf_type').text(data.wf_type);
					$('#wf_title').text(data.wf_title);
					$('#wf_file').text(data.wf_file);
					$('#wf_status').text(data.wf_status);
					$('#wf_level').text(data.wf_level);
					$('#wf_sender').text(data.wf_sender);
					$('#wf_create_date').text(resultDate);
					$('#wf_content').text(data.wf_content);
					$('#wf_getter').text(data.wf_getter);
					$('#wf_getter_1st').text(data.wf_getter_1st);
					$('#wf_getter_2nd').text(data.wf_getter_2nd);
					$('#wf_getter_3rd').text(data.wf_getter_3rd);
				},
				error: function(xhr, status, error) {
					console.error('AJAX 요청 실패:', status, error);
					console.log('xhr:', xhr);
				}
			});
		});

	var action =
    	'<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

    });
    </script>
  </body>
</html>