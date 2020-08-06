
<style>
img {
	max-width: 100%;
	max-height: 80%;
}
</style>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page pageEncoding="UTF-8"%>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">
		<s:message code="staff.title" />
	</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="admin/index.htm"><s:message
					code="home.index" /></a></li>
		<li class="breadcrumb-item active" aria-current="page"><a
			href="admin/ManagerStaff/index.htm"><s:message code="staff.title" /></a></li>
	</ol>
</div>
<div class="row">
<div class="col-lg-12">
		<div class="card mb-4">

			<div class="table-responsive p-3">
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
				 
					<div class="row">
						<div class="table-responsive p-3">
							<div id="dataTableHover_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12 col-md-6">
										<div class="dataTables_length" id="dataTableHover_length">
											<label>Show <select name="dataTableHover_length"
												aria-controls="dataTableHover"
												class="custom-select custom-select-sm form-control form-control-sm"><option
														value="10">10</option>
													<option value="25">25</option>
													<option value="50">50</option>
													<option value="100">100</option></select> entries
											</label>
										</div>
									</div>
									<div class="col-sm-12 col-md-6">
										<div id="dataTableHover_filter" class="dataTables_filter">
											<form action="admin/ManagerStaff/showinsert.htm">
								<button class="btn btn-primary mb-1" name="showInsert"><s:message code="staff.add.title"  /></button>
						</form>
								<form action="admin/ManagerStaff/search.htm">
									<label>Search:<input type="search" name="search"
										class="form-control form-control-sm"
										placeholder="ID or Name Staff" aria-controls="dataTable"></label>
									<button class="btn btn-primary mb-1">
										<i class="fa fa-search" aria-hidden="true"></i>
									</button>
								</form>
						
							<h6 style="color: red;">${message}</h6>
						</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<table
											class="table align-items-center table-flush table-hover dataTable"
											id="dataTableHover" role="grid"
											aria-describedby="dataTableHover_info">
											<thead class="thead-light">
												<tr role="row">
													<th class="sorting_asc" tabindex="0"
														aria-controls="dataTableHover" rowspan="1" colspan="1"
														aria-sort="ascending"
														aria-label="Name: activate to sort column descending"
														style="width: 149px;"><s:message code="staff.photo" /></th>
													<th class="sorting" tabindex="0"
														aria-controls="dataTableHover" rowspan="1" colspan="1"
														aria-label="Position: activate to sort column ascending"
														style="width: 237px;"><s:message code="staff.id" /></th>
													<th class="sorting" tabindex="0"
														aria-controls="dataTableHover" rowspan="1" colspan="1"
														aria-label="Office: activate to sort column ascending"
														style="width: 109px;"><s:message code="staff.name" /></th>
													<th class="sorting" tabindex="0"
														aria-controls="dataTableHover" rowspan="1" colspan="1"
														aria-label="Age: activate to sort column ascending"
														style="width: 38px;"><s:message code="staff.gender" /></th>
													<th class="sorting" tabindex="0"
														aria-controls="dataTableHover" rowspan="1" colspan="1"
														aria-label="Start date: activate to sort column ascending"
														style="width: 94px;"><s:message code="staff.birthday" /></th>
													<th class="sorting" tabindex="0"
														aria-controls="dataTableHover" rowspan="1" colspan="1"
														aria-label="Salary: activate to sort column ascending"
														style="width: 94px;"><s:message code="staff.email" /></th>
														<th class="sorting" tabindex="0"
														aria-controls="dataTableHover" rowspan="1" colspan="1"
														aria-label="Salary: activate to sort column ascending"
														style="width: 94px;"><s:message code="staff.phone" /></th>
														
														<th class="sorting" tabindex="0"
														aria-controls="dataTableHover" rowspan="1" colspan="1"
														aria-label="Salary: activate to sort column ascending"
														style="width: 94px;"><s:message code="staff.salary" /></th>
														
														<th class="sorting" tabindex="0"
														aria-controls="dataTableHover" rowspan="1" colspan="1"
														aria-label="Salary: activate to sort column ascending"
														style="width: 94px;"><s:message code="staff.depart" /></th>
														
														<th class="sorting" tabindex="0"
														aria-controls="dataTableHover" rowspan="1" colspan="1"
														aria-label="Salary: activate to sort column ascending"
														style="width: 94px;"><s:message code="staff.update" /></th>
														
														<th class="sorting" tabindex="0"
														aria-controls="dataTableHover" rowspan="1" colspan="1"
														aria-label="Salary: activate to sort column ascending"
														style="width: 94px;"><s:message code="staff.delete" /></th>
														
														 
												</tr>
											</thead>
											<tfoot>
												<tr >
										<th ><s:message code="staff.photo" /></th>
										<th  ><s:message code="staff.id" /></th>
										<th ><s:message code="staff.name" /></th>
										<th ><s:message code="staff.gender" /></th>
										<th ><s:message code="staff.birthday" /></th>
										<th ><s:message code="staff.email" /></th>
										<th ><s:message code="staff.phone" /></th>
										<th><s:message code="staff.salary" /></th>

										<th  ><s:message code="staff.depart" /></th>
										<th style="width: 5px"><s:message code="staff.update" /></th>
										<th style="width: 5px"><s:message code="staff.delete" /></th>

									</tr>
											</tfoot>
											<tbody>
											<c:forEach var="list" items="${list}">

										<tr >
											<form:form action="admin/ManagerStaff/showupdate.htm"
												modelAttribute="staff" method="POST">
												<td><img src="${list.photo}"></td>
												<td>${list.id}</td>
												<td style="width: 200px;">${list.name}</td>
												<td>${list.gender?'Nữ':'Nam'}</td>
												<td>${list.birthday}</td>
												<td>${list.email}</td>
												<td>${list.phone}</td>
												<td><f:formatNumber value="${list.salary}"
														type="number" /></td>
												<td>${list.depart.name}</td>
												<td>
													<button name="showUpdate"
														class="btn btn-sm btn-primary  badge badge-success">
														<s:message code="depart.update" />
													</button>
												</td>
												<form:hidden path="id" value="${list.id}" />
												<form:hidden path="gender" value="${list.gender}" />
												<form:hidden path="name" value="${list.name}" />
												<form:hidden path="birthday" value="${list.birthday}" />
												<form:hidden path="photo" value="${list.photo}" />
												<form:hidden path="email" value="${list.email}" />
												<form:hidden path="phone" value="${list.phone}" />
												<form:hidden path="salary" value="${list.salary}" />
												<form:hidden path="notes" value="${list.notes}" />
												<form:hidden path="depart.name" value="${list.depart.name}" />
											</form:form>
											<form action="admin/ManagerStaff/delete.htm" method="POST">

												<input type="hidden" value="${list.id}" name="id" />
												<td><button type="button" class="badge badge-danger"
														data-toggle="modal" data-target="#${list.id}">
														<s:message code="depart.delete" />
													</button></td>
												<div class="modal fade" id="${list.id}" tabindex="-1"
													role="dialog" aria-labelledby="exampleModalLabel"
													aria-hidden="false">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title text-center"
																	id="exampleModalLabel">
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

											</form>
										</tr>


									</c:forEach>

								</tbody>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-5">
										<div class="dataTables_info" id="dataTableHover_info"
											role="status" aria-live="polite">Showing 1 to 10 of 57
											entries</div>
									</div>
									<div class="col-sm-12 col-md-7">
										<div class="dataTables_paginate paging_simple_numbers"
											id="dataTableHover_paginate">
											<ul class="pagination">
												<li class="paginate_button page-item previous disabled"
													id="dataTableHover_previous"><a href="#"
													aria-controls="dataTableHover" data-dt-idx="0" tabindex="0"
													class="page-link">Previous</a></li>
												
												<li class="paginate_button page-item next"
													id="dataTableHover_next"><a href="admin/ManagerStaff/index.htm"
													aria-controls="dataTableHover" data-dt-idx="7" tabindex="0"
													class="page-link">Next</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	</div>


<script>
	$(document).ready(function() {
		$('#dataTable').DataTable(); // ID From dataTable 
		$('#dataTableHover').DataTable(); // ID From dataTable with Hover
	});
</script>


<script type="text/javascript"
	src="Resources/js/dataTables.bootstrap4.min.js"></script>

