<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String view = request.getParameter("view");
		if (view.startsWith("admin/")) {
			pageContext.forward("admin-layout.jsp");
		} else if (view.startsWith("user/")) {
			pageContext.forward("user-layout.jsp");
		} else {
			pageContext.forward("home/index.jsp");
		}
	%>
</body>
</html>