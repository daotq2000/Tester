
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page pageEncoding="UTF-8"%>
<style>
.e {
	color: red;
}
</style>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">
		<s:message code="depart.title" />
	</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="admin/index.htm"><s:message
					code="home.index" /></a></li>
		<li class="breadcrumb-item active" aria-current="page"><a
			href="admin/ManergerDepart.htm"><s:message code="depart.title" /></a></li>
	</ol>
</div>
<div class="row">
	<div class="col-lg-4">
		<div style="width: 400px" class="card mb-4">
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">
					<s:message code="depart.title" />
				</h6>

			</div>

			<h6 style="padding-left: 19px; color: #66bb6a; padding-top: 5px"
				class="">${message_insert_success}</h6>
			<h6 style="padding-left: 19px; color: #fc544b;" class="">${message_insert_fail}</h6>

			<div class="card-body">
				<form:form modelAttribute="depart"
					method="POST">
					<div class="form-group">
						<label for="exampleInputPassword1"><s:message
								code="depart.id" /></label>
						<form:input path="id" class="form-control form-control-sm "
							value="${info.id}" />
						 <form:errors path="id" cssClass="e"/>

					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"><s:message
								code="depart.name" /></label>
						<form:input path="name" class="form-control form-control-sm "
							value="${info.name}" />
						<br>
					 	<form:errors path="name" cssClass="e" />
					</div>


					<button  name="Insert"
						class="btn btn-primary badge badge-info">
						<s:message code="depart.add" />
					</button>

					<button name="Update"
						class="btn btn-sm btn-primary  badge badge-success">
						<s:message code="depart.update" />
					</button>
					<button type="button" class="badge badge-danger"
						data-toggle="modal" data-target="#exampleModal">
						<s:message code="depart.delete" />
					</button>
					<!-- Modal -->

					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title text-center" id="exampleModalLabel">
										<s:message code="model.title" />
									</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<s:message code="model.body" />
								</div>
								<div class="modal-footer">
									<button type="submit" name="Delete"
										class="btn btn-primary badge-danger">
										<s:message code="depart.delete" />
									</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>

								</div>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<div class="col-lg-8">
		<div class="card mb-4">
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">
					<s:message code="depart.data" />
				</h6>
				<h6 style="padding-left: 19px; color: #66bb6a;" class="">${message_update_sucess}</h6>
				<h6 style="padding-left: 19px; color: #fc544b;" class="">${message_update_fail}</h6>
			</div>
			<div class="card-body">

				<div class="table-responsive">
					<table id="example" class="table table-striped table-bordered"
						style="width: 100%">
						<thead class="thead-light">
							<tr>
								<th><s:message code="depart.id" /></th>
								<th><s:message code="depart.name" /></th>
								<th style="width: 20px"><s:message code="depart.info" /></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pb" items="${pb}">
								<tr>
									<form:form modelAttribute="depart" method="POST">
										<td>${pb.id}</td>
										<td>${pb.name}</td>
										<td><form:hidden path="id" value="${pb.id}" /> <form:hidden
												path="name" value="${pb.name}" />
											<button type="submit" name="Information"
												class="btn btn-info mb-1">
												<s:message code="depart.info" />
											</button></td>

									</form:form>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="Resources/vendor/jquery/jquery.min.js"></script>
<script src="Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="Resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="Resources/js/ruang-admin.min.js"></script>
<script src="Resources/vendor/chart.js/Chart.min.js"></script>
<script src="Resources/js/demo/chart-area-demo.js"></script>

 


