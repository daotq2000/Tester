
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${pageContext.servletContext.contextPath}">
<style>
.err{
color: red;
font-style: italic;

}
</style>
<%@ page pageEncoding="UTF-8"%>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">
		<s:message code="achi.title" />
	</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="admin/index.htm"><s:message code="home.index" /></a></li>
		<li class="breadcrumb-item active" aria-current="page"><a href="admin/Achievements/index.htm"><s:message
				code="achi.title" /></a></li>
	</ol>
</div>
<div class="row">
	<div class="col-lg-4">
		<div style="width: 350px" class="card mb-2">
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">
					<s:message code="achi.add" />
				</h6>

			</div>

			<h6 style="padding-left: 19px; color: #66bb6a; padding-top: 5px"
				class="">${message}</h6>
				<c:if test="${not empty param.message_u}">
				<h6 style="padding-left: 19px; color: #66bb6a; padding-top: 5px"
				class=""><%= request.getParameter("message_u") %></h6>
</c:if>
			<div class="card-body">
				<form:form modelAttribute="records"
					action="admin/Achievements/Insert.htm" method="POST">

					<div class="custom-control custom-radio">

						<label><s:message code="achi.type" /></label>

						<div>

							<form:radiobutton id="customRadio3" path="type" value="true"
								class="custom-control-input" />
							<label style="padding-left: 30px" class="custom-control-label" for="customRadio3"><s:message
									code="achi.achi" /></label>
						</div>

						<div>
							<form:radiobutton id="customRadio4" path="type" value="false"
								class="custom-control-input" />
							<label style="padding-left: 30px" class="custom-control-label" for="customRadio4"><s:message code="achi.dis" /></label>
						</div>
					</div>


					<div class="form-group">
						<label for="exampleInputPassword1"><s:message
								code="achi.reason" /></label>
						<form:textarea path="reason" class="form-control form-control-sm " />
						<form:errors path="reason" cssClass="err"/>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"><s:message
								code="achi.staff" /></label>
						<form:select path="Staffs.id"
							class="form-control form-control-sm ">
							<c:forEach var="staff" items="${staff}">
								<form:option value="${staff.id}">${staff.id} : ${staff.name}</form:option>
							</c:forEach>
						</form:select>
					</div>

					<button class="btn btn-primary  badge-success">
						<s:message code="depart.add" />
					</button>


				</form:form>
				<!-- Modal -->



			</div>
		</div>
	</div>

</div>
<h6 style="padding-left: 19px;color: #66bb6a;padding-top: 5px" class="">${messageEmail}</h6>
<div class="row">
	<div class="col-lg-12">
		<div class="card mb-4">
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">
					<s:message code="achi.data" />
				</h6>
			</div>
			<div class="card-body">

				<div class="table-responsive">
					<table id="example" class="table table-striped table-bordered"
						style="width: 100%">
						<thead class="thead-light">
							<tr>
								<th style="width: 5px;"><s:message code="achi.id" /></th>
								<th style="width: 145px"><s:message code="achi.type" /></th>
								<th style="width: 140px"><s:message code="achi.date" /></th>
								<th style="width:"><s:message code="achi.reason" /></th>
								<th style="width: 160px"><s:message code="achi.staff" /></th>
								<th style="width: 5px"><s:message code="depart.update" /></th>
								<th style="width: 5px"><s:message code="depart.delete" /></th>
								<th style="width: 5px"><s:message code="report.email" /></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="record" items="${record}">
								<tr>

									<td>${record.id}</td>
									<td>${record.type?'Khen thưởng':'Kỉ luật'}</td>
									<td>${record.date}</td>
									<td>${record.reason}</td>
									<td>${record.staffs.name}</td>


									<td><form:form action="admin/Achievements/showupdate.htm"
											method="POST" modelAttribute="records">
											<form:hidden path="id" value="${record.id}" />
											<form:hidden path="type" value="${record.type}" />
											<form:hidden path="reason" value="${record.reason}" />
											<form:hidden value="${record.staffs.id}" path="Staffs.id" />
											<form:hidden value="${record.staffs.name}" path="Staffs.name" />
											<button class="btn btn-sm btn-primary  badge badge-success">
												<s:message code="depart.update" />
											</button>
										</form:form></td>


									<td>
										<form action="admin/Achievements/delete.htm" method="POST">
											<input type="hidden" name="idRecord" value="${record.id}">
											
											<button type="button" class="badge badge-danger" data-toggle="modal" data-target="#exampleModal${record.id}"><s:message code="depart.delete" /></button>
 					<!-- Modal -->

<div class="modal fade" id="exampleModal${record.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="exampleModalLabel"><s:message code="model.title" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <s:message code="model.body" />
      </div>
      <div class="modal-footer">
      <button type="submit" name="Delete" class="btn btn-primary badge-danger"><s:message code="depart.delete" /></button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>	
										</form>
									</td>
									<td>
											<button type="button" class="btn btn-sm btn-primary  badge badge-success" data-toggle="modal" data-target="#example${record.id}"><s:message code="report.email" /></button>
 					<!-- Modal -->

<div class="modal fade" id="example${record.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="exampleModalLabel"><s:message code="report.email" /></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         
        <div class="form-group">

<form action="admin/Achievements/sendMail.htm" method="POST">
            <label for="">From</label>
            <input class="form-control" name="from" id="" rows="3">
        </div>
        <div class="form-group">


            <label for="">To</label>
            <input class="form-control" name="to" id="" value="${record.staffs.email}">
        </div>
        <div class="form-group">


            <label for="">Title</label>
            <input class="form-control" name="title" id="" rows="3">
        </div>
         

            <div class="form-group">
              <label for="">Subject</label>
              <textarea class="form-control" name="content" id="" rows="3"></textarea>
            </div>
       
       
       
    </div>
       
      <div class="modal-footer">
      <button type="submit"   class="btn btn-primary badge-success"><s:message code="report.email" /></button>
        </form>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>	
								 
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

<script src="Resources/vendor/jquery/jquery.min.js"></script>
	<script src="Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="Resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="Resources/js/ruang-admin.min.js"></script>
	<script src="Resources/vendor/chart.js/Chart.min.js"></script>
	<script src="Resources/js/demo/chart-area-demo.js"></script>
	

	<script type="text/javascript" src="Resources/js/dataTables.bootstrap4.min.js"></script>
