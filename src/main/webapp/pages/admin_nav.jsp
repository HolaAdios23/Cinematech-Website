<%@page import="javax.servlet.http.HttpSession" %>
  <%@page import="javax.servlet.http.HttpServletRequest" %>

    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../stylesheets/admin4.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Admin</title>
      </head>

      <body>
        <% HttpSession userSession=request.getSession(); String currentUser=(String)
          userSession.getAttribute("username"); String contextPath=request.getContextPath(); String
          uri=request.getRequestURI(); %>
          <div class="container">

            <div class="left-panel">
              <div class="nav-container">
                <h2>CINEMATECH</h2>
              </div>

              <div class="nav-bar">

                <div class="nav-box">
                  <nav>
                    <ul id="AdminMenu">
                      <li style="background-color: <% if(uri.endsWith("admin_index.jsp")) { out.print("red"); } %>;">
                        <div class="navi-box">
                          <div class="icon-container"><i class="fa fa-dashboard" style="font-size: 20px"
                              aria-hidden="true"></i></div><a
                            href="${pageContext.request.contextPath}/admin/admin_index.jsp">Dashboard</a>
                        </div>
                      </li>
                      <li style="background-color: <% if(uri.endsWith("admin_movie.jsp")) { out.print("red"); } %>;">
                        <div class="navi-box">
                          <div class="icon-container"><i class="fa fa-film" style="font-size: 20px"
                              aria-hidden="true"></i></div><a
                            href="${pageContext.request.contextPath}/admin/admin_movie.jsp">Movies</a>
                        </div>
                      </li>
                      <li style="background-color: <% if(uri.endsWith("admin_user.jsp")) { out.print("red"); } %>;">
                        <div class="navi-box">
                          <div class="icon-container"><i class="fa fa-user" style="font-size: 20px"
                              aria-hidden="true"></i></div><a href="${pageContext.request.contextPath}/admin/admin_user.jsp">Users</a>
                        </div>
                      </li>
                      <li>
                        <div class="navi-box">
                          <div class="icon-container"><i class="fa fa-bar-chart" style="font-size: 20px"
                              aria-hidden="true"></i></div><a href="">Statistics</a>
                        </div>
                      </li>
                      <li>
                        <div class="navi-box">
                          <div class="icon-container"><i class="fa fa-cog" style="font-size: 20px"
                              aria-hidden="true"></i></div><a href="">Settings</a>
                        </div>
                      </li>
                      <li>
                        <div class="navi-box">
                          <div class="icon-container"><i class="fa fa-question-circle" style="font-size: 20px"
                              aria-hidden="true"></i></div><a href="">Help</a>
                        </div>
                      </li>
                      <li>
                        <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
                          <div class="navi-box">
                            <div class="icon-container"><i class="fa fa-sign-out" style="font-size: 20px"
                                aria-hidden="true"></i></div><input
                              style="background-color: transparent; color: white; border: none; font-family: arial; font-size: 17px; margin-left: 5px;"
                              type="submit" value="Logout">
                          </div>
                        </form>
                      </li>
                    </ul>

                  </nav>

                </div>

              </div>

            </div>

          </div>



      </body>

      </html>