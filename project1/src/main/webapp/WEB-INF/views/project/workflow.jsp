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
						            	${workflow.wf_getter}
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
						            	${workflow.wf_getter}
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
            
            <!-- 모달 start-->
            <div class="modal fade" id="wfread" tabindex="-1" aria-labelledby="wfDetailLabel" aria-hidden="true">
			    <div class="modal-dialog modal-xl">
					<!-- modal content start -->
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="wfDetailLabel">Workflow Detail</h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <div class="modal-body">
							<!-- card -->
							<div class="card">
							  <div class="card-header">
							    <div class="card-title">Wf_title</div>
							  </div>
							<!-- card-body -->
							<div class="card-body">
							<form action="/project/wfresponse" method="POST">
						    	<div class="form-group">
						    		<label for="smallInput">NUM</label>
						            <input
						              type="text"
						              class="form-control form-control-sm"
						              id = "wf_code"
						              name = "wf_code"
						              readonly
						            />
						            <label for="smallInput">TYPE</label>
						            <input
						              type="text"
						              class="form-control form-control-sm"
						              id = "wf_type"
						              readonly
						            />
						            <label for="smallInput">TITLE</label>
						            <input
						              type="text"
						              class="form-control form-control-sm"
						              id = "wf_title"
						              readonly
						            />
						            <label for="smallInput">FILE</label>
						            <input
						              type="text"
						              class="form-control form-control-sm"
						              id = "wf_file"
						              readonly
						            />
						            <label for="smallInput">STATUS</label>
						            <input
						              type="text"
						              class="form-control form-control-sm"
						              id = "wf_status"
						              readonly
						            />
						            <label for="smallInput">LEVEL</label>
						            <input
						              type="text"
						              class="form-control form-control-sm"
						              id = "wf_level"
						              name = "wf_level"
						              readonly
						            />
						            <label for="smallInput">SENDER</label>
						            <input
						              type="text"
						              class="form-control form-control-sm"
						              id = "wf_sender"
						              readonly
						            />
						            <label for="smallInput">CREATE DATE</label>
						            <input
						              type="text"
						              class="form-control form-control-sm"
						              id = "wf_create_date"
						              readonly
						            />
						            
						    	</div>
						    	
						    	<div class="form-group">
						        	<label for="comment">Content</label>
						        	<textarea class="form-control" rows="5" id="wf_content" readonly></textarea>
						        </div>
						        
						        <div class="form-group">
						        	<label for="comment">Comment</label>
						        	<textarea class="form-control" rows="5" id="wf_comment" name="wf_comment"></textarea>
						        </div>
						        
								<!-- select button start -->
								<div class="selectgroup w-100">
								    <label class="selectgroup-item">
									    <input
									      type="radio"
									      value="approve"
									      class="selectgroup-input"
									      name="wf_result"
									    />
									    <span class="selectgroup-button selectgroup-button-icon">
									    	<i class="icon-screen-smartphone">APPROVE</i>
									    </span>
							 		</label>
						 		
									<label class="selectgroup-item">
										<input
										  type="radio"
										  value="defer"
										  class="selectgroup-input"
										  name="wf_result"
										/>
									    <span class="selectgroup-button selectgroup-button-icon">
									    	<i class="icon-screen-tablet">DEFER</i>
									    </span>
									</label>
									
									<label class="selectgroup-item">
									    <input
									      type="radio"
									      value="reject"
									      class="selectgroup-input"
									      name="wf_result"
									    />
									    <span class="selectgroup-button selectgroup-button-icon">
									    	<i class="icon-screen-desktop">REJECT</i>
									    </span>
									</label>
	  
								</div>
								<!-- select button end-->
								<!-- submit button start -->
								<div class="form-group">
									<div class="input-group">
										<input
											type="submit"
											class="form-control"
											value="SUBMIT"
											aria-label=""
											aria-describedby="basic-addon1"
										/>
									</div>
								</div>
								<!-- submit button end -->
			          		
			          		  </form>
			                  </div>
			                  <!-- card-body end -->
			                </div>
			                <!-- card end -->
			                <!-- modal content end -->
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			            </div>
			        </div>
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
    		                        column.search(val ? "^" + val + "$" : "", true, false).draw();
    		                    });

    		                column
    		                    .data()
    		                    .unique()
    		                    .sort()
    		                    .each(function (d, j) {
    		                        console.log("Raw data:", d);
    		                        var textMatch = d.match(/>([^<]+)</); // 정규 표현식으로 텍스트 추출
    		                        var text = textMatch ? textMatch[1].trim() : ''; // 공백 제거

    		                        // text가 무엇인지 확인
    		                        console.log("Processed text:",text);

    		                        // select에 추가하기 전에 확인
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
                  var select = $(
                    '<select class="form-select"><option value=""></option></select>'
                  )
                    .appendTo($(column.footer()).empty())
                    .on("change", function () {
                      var val = $.fn.dataTable.util.escapeRegex($(this).val());

                      column
                        .search(val ? "^" + val + "$" : "", true, false)
                        .draw();
                    });

                  column
                  .data()
                  .unique()
                  .sort()
                  .each(function (d, j) {
                	  var plainText = d.match(/>(.*?)</);  // '>'와 '<' 사이의 텍스트를 추출
	                	if (plainText) {
	                	  plainText = plainText[1];  // 추출한 값 중 첫 번째 그룹(태그 사이의 텍스트)을 선택
	                	}
	                	console.log(plainText);
	                  select.append(
	                    '<option value="' + plainText + '">' + plainText + "</option>"
                    );
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
            		console.log('AJAX 요청 성공, wf_code :', wfCode);
                	console.log('받은 데이터:', data);
	            	$('#wf_code').val(data.wf_code);
	                $('#wf_type').val(data.wf_type);
	                $('#wf_title').val(data.wf_title);
	                $('#wf_file').val(data.wf_file);
	                $('#wf_status').val(data.wf_status);
	                $('#wf_level').val(data.wf_level);
	                $('#wf_sender').val(data.wf_sender);
	                $('#wf_create_date').val(data.wf_create_date);
	                $('#wf_content').val(data.wf_content);
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
