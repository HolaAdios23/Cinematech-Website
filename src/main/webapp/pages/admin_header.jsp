<%@ page import="util.StringUtil" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<!DOCTYPE html>
		<html>

		<head>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/admin_header.css">
			<link rel="stylesheet"
				href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
			<meta charset="UTF-8">
			<title>Admin</title>
		</head>

		<body>

			<% String adminSession=(String)session.getAttribute("sessionadmin"); String cookieUsername=null; String
				cookieSessionId=null; String uri=request.getRequestURI(); Cookie[] cookies=request.getCookies();
				if(cookies !=null) { for(Cookie cookie: cookies) { if(cookie.getName().equals("admin")) {
				cookieUsername=cookie.getValue(); } if(cookie.getName().equals("JSESSIONID")) {
				cookieSessionId=cookie.getValue(); } } } %>


				<div class="header">
					<div class="left-header">
						<h2>
							<% if(uri.endsWith("/admin_index.jsp")) { out.print("Hello, " + adminSession);
}
else if(uri.endsWith("/admin_movie.jsp")) { out.print("Movie"); }
							else if(uri.endsWith("/admin_user.jsp")){
								out.print("User");
							}
							%>
						</h2>
					</div>
					<div class="right-header">
						<div class="search-container">
							<i class="fa fa-search" aria-hidden="true"></i>
							<input type="text" placeholder="Search.." name="search" id="search">
						</div>
						<div class="notification-container">
							<i class="fa fa-bell" style="font-size: 20px" aria-hidden="true"></i>
						</div>
						<div class="image-container">
							<img src="${pageContext.request.contextPath}/resources/profile.jpeg" alt="Avatar">
						</div>
					</div>

				</div>


		</body>

		</html>