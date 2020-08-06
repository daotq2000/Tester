 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page pageEncoding="UTF-8"%>
<style>
.err{
color:red;
font-size: medium;

}
</style>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">
		<s:message code="user.title" />
	</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="admin/index.htm"><s:message code="home.index" /></a></li>
		<li class="breadcrumb-item active" aria-current="page"><a href="admin/ManagerAcount.htm"><s:message code="user.title" /></a></li>
	</ol>
</div>
<div class="row">
	<div class="col-lg-4">
		<div style="width: 400px" class="card mb-4">
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">
					<s:message code="user.title" />
				</h6>
				
			</div>
			<br>
			<h6  style="padding-left: 19px;color: #66bb6a;padding-top: 5px" class="">${message}</h6>
			
		 
			<div class="card-body">
				<form:form modelAttribute="Users" method="POST" >
					<div class="form-group">
						<label for="exampleInputEmail1"><s:message
								code="user.user" /></label>
						<form:input  path="username" value="${Users.username}" class="form-control form-control-sm " />
						<br>
						 <form:errors path="username"  cssClass="err"/>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"><s:message
								code="user.password" /></label>
						<form:password path="passwords" value="${Users.passwords}" class="form-control form-control-sm " />
						<br>
						 <form:errors path="passwords"  cssClass="err"/>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1"><s:message
								code="user.fullname" /></label>
						<form:input path="fullname"  value="${Users.fullname}" class="form-control form-control-sm " />
						<br>
						 <form:errors path="fullname" cssClass="err" />
					</div>


					<button id="reload"  name="save" class="btn btn-primary badge badge-info">
						<s:message code="depart.add" />
					</button>
					
					<button name="save"class="btn btn-sm btn-primary  badge badge-success"><s:message code="depart.update" /></button>
					<button type="button" class="badge badge-danger" data-toggle="modal" data-target="#exampleModal"><s:message code="depart.delete" /></button>
 					<!-- Modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
				</form:form>
			</div>
		</div>
	</div>
	<div class="col-lg-8">
		<div class="card mb-4">
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold text-primary">
					<s:message code="user.info" />
				</h6>
				 
			</div>
			<div class="card-body">

				<div class="table-responsive">
					<table id="example" class="table table-striped table-bordered" style="width:100%">
						<thead class="thead-light">
							<tr>
								<th><s:message code="user.user" /></th>
								<th><s:message code="user.password" /></th>	
								<th><s:message code="user.fullname" /></th>	
								<th style="width: 20px"><s:message code="depart.info"/></th>				
							</tr>
						</thead>
						<tbody>
						<c:forEach var="list" items="${list}">
							<tr>
							
								<td>${list.username}</td>
								<td>${list.passwords}</td>
								 <td>${list.fullname}</td>
								<td>
								<form:form modelAttribute="Users" method="POST" > 
								<form:hidden path="username" value = "${list.username}" />
								<form:hidden path="passwords" value = "${list.passwords}" />
								<form:hidden path="fullname" value = "${list.fullname}" />
								<button type="submit" name="info" class="btn btn-info mb-1"><s:message code="depart.info"/></button>
								
								</form:form>
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

