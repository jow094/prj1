<script src="${pageContext.request.contextPath }/resources/assets/js/core/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/core/bootstrap.min.js"></script>

<div class="modal fade" id="unread_workflow_modal" tabindex="2" aria-labelledby="unread_workflow" aria-hidden="true" style="background-color: rgba(0,0,0,0.5);">
	<div class="modal-dialog modal-md" >
		<!-- modal content start -->
		<div class="modal-content" style="background-color: rgba(0,0,0,0.3);">
			<!-- modal body start -->
			<div class="modal-body">
				<div class="card" style="margin:0px; display:flex; flex-direction: column;">
					<div style="display:flex; background-color: rgba(0,0,0,0.1); height:10px; justify-content: flex-end; padding:10px;">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<!-- card body start -->
					<div class="card-body" style="background-color: rgba(0,0,0,0.1);">
						<div id="welcome" style="display: flex; height: 30px; border-bottom:1px solid rgba(0,0,0,0.1);"></div>
						<div class="form-group" id="received_workflows" style= "display: flex; flex-direction:column; align-items: center; justify-content: center; "></div>
	                    <div class="form-group" id="sent_workflows" style= "display: flex; flex-direction:column; align-items: center; justify-content: center; "></div>
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
