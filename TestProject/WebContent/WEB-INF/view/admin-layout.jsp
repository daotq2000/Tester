<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<base href="${pageContext.servletContext.contextPath}/">

<meta name="description" content="">
<meta name="author" content="">
  <link href="Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="Resources/css/ruang-admin.min.css" rel="stylesheet">
<link href="Resources/img/logo/LogoA.png" rel="icon">
 <link href="Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="Resources/css/ruang-admin.min.css" rel="stylesheet">
  <link href="Resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<title>ABC - Dashboard</title>
	<link href="Resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<link href="Resources/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
<link href="Resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="Resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="Resources/css/ruang-admin.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
</head>

<body id="page-top">
	<div id="wrapper">

		<jsp:include page="component/menu-ol.jsp" />

		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<jsp:include page="component/menu-ul.jsp" />
				<div class="container-fluid" id="container-wrapper">
					<jsp:include page="${param.view}" />
				</div>
			</div>
		</div>
	</div>
	<footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © 2019 -   <s:message code="home.footer" />
              <b><a href="https://github.com/daotqph08312" target="_blank">Trần Quang Đạo</a></b>
            </span>
          </div>
        </div>
      </footer>
	<script src="Resources/vendor/jquery/jquery.min.js"></script>
	<script src="Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="Resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="Resources/js/ruang-admin.min.js"></script>
	<script src="Resources/vendor/chart.js/Chart.min.js"></script>
	<script src="Resources/js/demo/chart-area-demo.js"></script>
	

	<script type="text/javascript" src="Resources/js/dataTables.bootstrap4.min.js"></script>
	
	<script type="text/javascript" src="Resources/js/jquery-3.3.1.js">
	</script>
<!-- Page level plugins -->
<script type="text/javascript" src="Resources/vendor/bootstrap/js/bootstrap.bundle.min.js">
</script>
<script type="text/javascript" src="Resources/vendor/jquery-easing/jquery.easing.min.js">
</script>
<script type="text/javascript" src="Resources/js/ruang-admin.min.js">
</script>

	
</body>

</html>