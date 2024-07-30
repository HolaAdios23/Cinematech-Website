<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@page import="javax.servlet.http.HttpSession" %>
    <%@page import="javax.servlet.http.HttpServletRequest" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}../stylesheets/header2.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Header</title>
      </head>

      <body>
        <% HttpSession userSession=request.getSession(); 
        String currentUser=(String)userSession.getAttribute("username"); 
        String contextPath=request.getContextPath(); 
        String uri = request.getRequestURI();
        %>
          <div class="header">

            <div class="container">
              <div class="navbar">
                <h1>CINEMATECH</h1>
                <nav>
                  <ul id="MenuItems">
                    <li><a  style="color: <% if(uri.endsWith("index.jsp")) { out.print("#00e350"); } %>;" href="">Home</a></li>
                    <li><a  href="">Movie</a></li>
                    <li><a  href="">TV Shows</a></li>
                    <li><a href="">Watchlist</a></li>
                  </ul>
                </nav>
                <div class="searchnlogin">
                  <div class="searchcontainer">
                    <i class="fa fa-search" aria-hidden="true"></i>

                    <input type="text" placeholder="Search...." name="search" id="search">

                  </div>
                  <form action="<%
    if(currentUser != null)
    {
    	out.print(contextPath + "/LogoutServlet"); } else { out.print(contextPath + "/pages/login.jsp" ); } %>"
                    method="post">

                    <div class="profile-container">
                      <input type="submit" value="<% 
     
     if(currentUser != null)
     {
    	 out.print("Logout"); } else { out.print("Login"); } %>"/>
                    </div>
                  </form>

                </div>

              </div>




            </div>
          </div>


      </body>

      </html>