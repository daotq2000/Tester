<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

 <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="1045280647911-nh3smq3e2lilcs4aeccn8ojrctbggo41.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
  <link href="Resources/img/logo/LogoA.png" rel="icon">
  <title>ABC - Login</title>
 
  <base href="${pageContext.servletContext.contextPath}/">
  
  <link href="Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="Resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="Resources/css/ruang-admin.min.css" rel="stylesheet">

</head>
<body class="bg-gradient-login">
	<!-- Login Content -->
	<div class="container-login">
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card shadow-sm my-5">
					<div class="card-body p-0">
						<jsp:include page="${param.view}"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	  <script src="Resources/vendor/jquery/jquery.min.js"></script>
  <script src="Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="Resources/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="Resources/js/ruang-admin.min.js"></script>
</body>
</html>