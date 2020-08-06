<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">
		<s:message code="staff.update.title" />
	</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="admin/ManagerStaff/index.htm"><s:message code="staff.title" /></a></li>
		<li class="breadcrumb-item active" aria-current="page"><a href="admin/ManagerStaff/showinsert.htm"><s:message code="staff.update.title" /></a></li>
	</ol>
</div>
	<div class="row justify-content-center">
	
			<div class="card shadow-sm my-12">
				<div class="card-body p-0">
					<div class="row">
						<div class="col-lg-12">
							<div class="login-form">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4"><s:message code="staff.update.title"/></h1>
									
									<span style="color:green; font-style:italic; font-weight: bolder; font-size: medium;">${message_s}</span>
									<span style="color:red; font-style:italic; font-weight: bolder; font-size: medium;">${message_f}</span>
									
								</div>
						<form onsubmit="return isValidDate()" action="admin/ManagerStaff/update.htm"  enctype="multipart/form-data" method="POST" >
                    <div class="form-group">
                      <label><s:message code="staff.id"/></label>
                      <input class="form-control" value="${staff.id}" name="id" />
                    </div>
                    <div class="form-group">
                      <label><s:message code="staff.name"/></label>
                      <input class="form-control" name="name" value="${staff.name}"/>
                    </div>
                    <div class="form-group">
                      <label><s:message code="staff.gender"/></label>
                      <div class="custom-control custom-radio">
            
                        <div>
                        
                                    <input type="radio"  id="customRadio3" name="gender" ${staff.gender?'':'checked'} value="0" class="custom-control-input"/>
                        <label style="padding-left: 30px" class="custom-control-label" for="customRadio3"><s:message code="staff.gender.male"/></label>
                        </div>
                        
                    <div>
                         <input type="radio" ${staff.gender?'checked':''}  id="customRadio4" name="gender"   value="1" class="custom-control-input"/>
                        <label style="padding-left: 30px" class="custom-control-label" for="customRadio4"><s:message code="staff.gender.female"/></label>
                    </div>
                      </div>                  
                    </div>
                    <div class="form-group">
                      <label><s:message code="staff.birthday"/></label>
                       <input id="datepicker" class="form-control" name="birthday" value="${staff.birthday}" />
                       <b style="color: red;font-style: italic;" id="val"></b>
                    </div>
                    <div class="form-group">
                      <label><s:message code="staff.phone"/></label>
                       <input class="form-control" name="phone" value="${staff.phone}" />
                    </div>
                    <div class="form-group">
                      <label><s:message code="staff.email"/></label>
                       <input class="form-control" name="email" value="${staff.email}"/>
                    </div>
                    <div class="form-group">
                      <label><s:message code="staff.salary"/></label>
                       <input class="form-control" name="salary" value="${staff.salary}" />
                    </div>
                    <div class="form-group">
                      <label><s:message code="staff.notes"/></label>
                     <textarea rows="" cols="" class="form-control"   name="notes">${staff.notes}</textarea>
                    </div>
                    <div class="form-group">
                    <label><s:message code="staff.photo"/></label>
                   <div class="custom-file">
                        <input type="file" class="custom-file-input"   name="photo"/>
                        <label class="custom-file-label" for="customFile">Choose file</label>
                      </div>
                      </div>
                   <div class="form-group">
								<label><s:message code="staff.depart"/></label>
								<select name="depart" class="form-control">
								<c:forEach var="dp" items="${List}">
								<option value="${dp.id}" >
								${dp.name}
								</option>
								</c:forEach>
								</select>
							</div>   
                    <div class="form-group" style="padding-top: 20px">
             
               <div class="row">
                <button style="margin-left: 10px;width:200px" type="submit" class="btn btn-primary "><s:message code="staff.update.title"/></button>
                      <a style="margin-left: 20px" class="btn btn-secondary btn btn-primary" href="admin/ManagerStaff/index.htm"><s:message code="home.index"/></a>
                   
               </div>
                      </div>   
                                 
                  </form>
								<hr>

							</div>
						</div>
					</div>
				</div>
			</div>
		
	</div>
	 <script>
        $('#datepicker').datepicker({
            uiLibrary: 'bootstrap4'
        });
        function isValidDate() {
            var ngaysinh = document.getElementById("datepicker").value;

      var regEx = /^\d{4}-\d{2}-\d{2}$/;
      if(!ngaysinh.match(regEx)){
          document.getElementById("val").innerHTML = "(*) Vui lòng nhập đúng định dạng năm-tháng-ngày <br> VD: 2020-10-10";
           return false;
      }
      var d = new Date(ngaysinh);
      var dNum = d.getTime();
      if(!dNum && dNum !== 0){
    	  document.getElementById("val").innerHTML = "(*) Vui lòng nhập đúng định dạng năm-tháng-ngày <br> VD: 2020-10-10";
          return false;

           } // NaN value, Invalid date
      return d.toISOString().slice(0,10) === ngaysinh;
    }
    </script>
	<script src="Resources/vendor/jquery/jquery.min.js"></script>
	<script src="Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="Resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="Resources/js/ruang-admin.min.js"></script>
	<script src="Resources/vendor/chart.js/Chart.min.js"></script>
	<script src="Resources/js/demo/chart-area-demo.js"></script>
	

	<script type="text/javascript" src="Resources/js/dataTables.bootstrap4.min.js"></script>