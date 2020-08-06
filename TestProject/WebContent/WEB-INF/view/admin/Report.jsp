<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="UTF-8"%>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">
		<s:message code="report.title" />
	</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="admin/index.htm"><s:message code="home.index" /></a></li>
		<li class="breadcrumb-item active" aria-current="page"><a href="admin/Achievements/index.htm"><s:message
				code="report.title" /></a></li>
	</ol>
</div>
 <center>
	<img src="Resources/img/photo_staff/report.png"/>
</center>
 <div style="margin-top: 20px" class="row">
	<div class="col-lg-12">
		<div class="card mb-4">
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">
					<s:message code="report.title.em" />
				</h6>
				
			</div>
			<div class="card-body">

				<div class="table-responsive">
					<table id="example" class="table table-striped table-bordered"
						style="width: 100%">
						<thead class="thead-light">
							<tr>
								
								<th style="width:"><s:message code="report.id" /></th>
								<th style="width:"><s:message code="report.name" /></th>
								<th style="width:"><s:message code="report.sumachi" /></th>
								<th style="width:"><s:message code="report.sumdis" /></th>
								<th style="width:"><s:message code="report.sumary" /></th>
								<th style="width:"><s:message code="report.rank" /></th>
								
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${items}">
								<tr>

									<td> ${list[0]}</td>
									<td> ${list[1]}</td>
									<td> ${list[2]}</td>
									<td> ${list[3]}</td>
									<td> ${list[2]-list[3]}</td>
									<td> ${list[2]-list[3] >0?'Khen thưởng':'Kỉ luật'}</td>

									
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<div style="margin-top: 20px" class="row">
	<div class="col-lg-12">
		<div class="card mb-4">
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">
					<s:message code="report.title.depart" />
				</h6>
				
			</div>
			<div class="card-body">

				<div class="table-responsive">
					<table id="example" class="table table-striped table-bordered"
						style="width: 100%">
						<thead class="thead-light">
							<tr>
								
								<th style="width:"><s:message code="report.depart.id" /></th>
								<th style="width:"><s:message code="report.depart.name" /></th>
								<th style="width:"><s:message code="report.sumachi" /></th>
								<th style="width:"><s:message code="report.sumdis" /></th>
								<th style="width:"><s:message code="report.sumary" /></th>
								<th style="width:"><s:message code="report.rank" /></th>
								 
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${pb}">
								<tr>

									<td> ${list[0]}</td>
									<td> ${list[1]}</td>
									<td> ${list[2]}</td>
									<td> ${list[3]}</td>
									<td> ${list[2]-list[3]}</td>
									<td> ${list[2]-list[3] >0?'Khen thưởng':'Kỉ luật'}</td>

									
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
	

	<script type="text/javascript" src="Resources/js/dataTables.bootstrap4.min.js"></script>
