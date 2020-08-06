<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<base href="${pageContext.servletContext.contextPath}/">
<style>
#fbTimelineHeadline .profilePicThumb .img {
	display: block;
}

._1nv3._11kg, ._1nv3._11kg ._11kf {
	border-radius: 100%;
}

._1nv3 ._11kf {
	background-color: #fff;
	border-radius: 2px;
	display: block;
	height: 170px;
	position: relative;
	width: 160px;
}

._1nv5 ._11kf {
	border: 4px solid #fff;
}#img{
padding-left: 40px;
}

</style>
<script>



</script>
<div  class="col-lg-12">
	<!-- Popover basic -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<h1 class="h3 mb-0 text-gray-800">
		<s:message code="home.welcome" />
	</h1>
	<h4></h4>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="admin/index.htm"><s:message code="home.index" /></a></li>
		 
	</ol>
</div>
	<div class="card mb-4">
		<div
			class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			<h6 class="m-0 font-weight-bold text-primary">
				<s:message code="home.encourage" />
			</h6>
		</div>
		<div class="card-body">
			<center>
				<h2 style="font-size: larger; color: red; font-weight: bold">
					<s:message code="home.top10" />
				</h2>
			</center>
			<div class="row">
				<c:forEach var="list" items="${list}">

					<div style=" margin-top: 30px" class="col-sm-3">
						<div class="card" style="width: 15rem;">
							<a id="img" class="_1nv3 _11kg _1nv5 profilePicThumb"
								href="https://www.facebook.com/photo.php?fbid=567797723776978&amp;set=a.111700496053372&amp;type=3&amp;source=11&amp;referrer_profile_id=100016402669039"
								rel="theater" id="u_fetchstream_28_4"><img class="_11kf img"
								alt="ảnh đại diện của bạn, Trong hình ảnh có thể có: 2 người, bao gồm Bùi Ngọc Hải, mọi người đang cười, mọi người đang đứng"
								src="${list[1]}"></a>
							<!-- Optional JavaScript -->

							<div class="card-body">
								<h5 class="card-title">
									<s:message code="staff.info" />
								</h5>
								<p class="card-text">
									<s:message code="staff.name" />
									: ${list[0]}
								</p>
								<p class="card-text">${list[2]}</p>
							</div>
						</div>

					</div>
					




				</c:forEach>

			</div>

		</div>
	</div>
</div>
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
