<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  page pageEncoding="UTF-8"%>
<style>
        b{
            color: red;
            font-style: italic;
        }
    </style>
<base href="${pageContext.servletContext.contextPath}/">
    
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">
		<s:message code="staff.title" />
	</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="admin/ManagerStaff/index.htm"><s:message code="staff.title" /></a></li>
		<li class="breadcrumb-item active" aria-current="page"><a href="admin/ManagerStaff/showinsert.htm"><s:message code="staff.add.title" /></a></li>
	</ol>
</div>

<div class="row justify-content-center">

	<div class="card shadow-sm my-12">
		<div class="card-body p-0">
			<div class="row">
				<div class="col-lg-12">
					<div class="login-form">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4">
								<s:message code="staff.add.title" />
							</h1>
							<h6 style="color: red;">${message}</h6>
						</div>
						<form onsubmit="return validate()" action="admin/ManagerStaff/insert.htm"  enctype="multipart/form-data" method="POST" >
							
						  <div class="form-group">
								<label><s:message code="staff.id" /></label>
								<input id="100a" class="form-control" name="id" />
       							 <b  id="100b"></b>
							</div>
							<div class="form-group">
								<label><s:message code="staff.name" /></label>
								<input id="1a"class="form-control" name="name" />
       							 <b  id="1b"></b>
							</div>
							<div class="form-group">
								<label><s:message code="staff.gender" /></label>
								 <b id="2b"></b>
								 
								<div class="custom-control custom-radio">

									<div>

										<input type="radio" id="customRadio3" name="gender"
											  value="0" class="custom-control-input" />
										<label style="padding-left: 30px " class="custom-control-label" for="customRadio3"><s:message
												code="staff.gender.male" /></label>
									</div>

									<div>
										<input type="radio" id="customRadio4" name="gender"
											  value="1" class="custom-control-input" />
										<label style="padding-left: 30px " class="custom-control-label" for="customRadio4"><s:message
												code="staff.gender.female" /></label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label><s:message code="staff.birthday" /></label>
								<input  class="form-control" id="datepicker" name="birthday" />
								 <b id="3b"></b>
							</div>
							<div class="form-group">
								<label><s:message code="staff.phone" /></label>
								 <input id="4a" class="form-control" name="phone" />
       							 <b id="4b"></b>
							</div>
							<div class="form-group">
								<label><s:message code="staff.email" /></label>
								  <input id="email" class="form-control" name="email" />
        						<b id="5b"></b>
							</div>
							<div class="form-group">
								<label><s:message code="staff.salary" /></label>
								<input id="6a" class="form-control" name="salary" />
        					<b id="6b"></b>
							</div>
							<div class="form-group">
								<label><s:message code="staff.notes" /></label>
								<textarea  class="form-control" name="notes" rows="" cols=""></textarea>
							</div>
							<div class="form-group">
								<label><s:message code="staff.photo" /></label>
								<div class="custom-file">
									<input id="7a" name="photo" type="file" 
										class="custom-file-input"  />
									<label class="custom-file-label" for="customFile">Choose
										file</label>
										 <b id="7b"></b>
								</div>
							</div>
							<div class="form-group">
								<label>Phòng</label>
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
							<button style="margin-left: 10px" name="Insert" type="submit" class="btn btn-outline-success mb-1">
									<s:message code="staff.add.title" />
								</button>
<a style="margin-left: 100px" class="btn btn-secondary mb-1" href="admin/ManagerStaff/index.htm"><s:message code="home.index" /></a>
							
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
        function validate(){
        	var id = document.getElementById("100a").value;
            
            if(id === ""){
                document.getElementById("100b").innerHTML = "(*) Vui lòng mã nhân viên";
                return false;
            }
            var name = document.getElementById("1a").value;
        
            if(name === ""){
                document.getElementById("1b").innerHTML = "(*) Vui lòng nhập họ tên";
                return false;
            }
            var gender = document.getElementsByName("gender");
            for(let i = 0 ; i <gender.length;i++){
                if(!(gender[0].checked || gender[1].checked) ){
                    document.getElementById("2b").innerHTML = "(*) Vui lòng chọn giới tính";
                    return false;
                }
         
                
            }
            var  date = document.getElementById("datepicker").value;
            if(date === ""){
                document.getElementById("3b").innerHTML = "(*) Vui lòng chọn ngày sinh nhật";
                return false;
            }
            var phone = document.getElementById("4a").value;
            if(!phone.match("0[0-9\s.-]{9,13}")){
                document.getElementById("4b").innerHTML = "(*) Vui lòng nhập số điện thoại";
                return false;
            }
            var email = document.getElementById("email").value;
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; 
            if(!filter.test(email)){
                document.getElementById("5b").innerHTML = "(*) Vui lòng nhập email";
                return false;
            }
            var salary = document.getElementById("6a").value;
            if(!salary.match("[0-9]")){
                document.getElementById("6b").innerHTML = "(*) Vui lòng nhập lương";
                return false;
            }
            var file = document.getElementById("7a").value;
            if(file == ""){
                document.getElementById("7b").innerHTML = "(*) Vui lòng chọn file";
                return false;
            }

            return true;

        }
    </script>
<script src="Resources/vendor/jquery/jquery.min.js"></script>
	<script src="Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="Resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="Resources/js/ruang-admin.min.js"></script>
	<script src="Resources/vendor/chart.js/Chart.min.js"></script>
	<script src="Resources/js/demo/chart-area-demo.js"></script>
	

	<script type="text/javascript" src="Resources/js/dataTables.bootstrap4.min.js"></script>