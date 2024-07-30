<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
      <%int num=1; int movie_id=1;%>
        <!DOCTYPE html>
        <html>

        <head>
          <meta charset="UTF-8">
          <link rel="stylesheet" href="../stylesheets/admin_header7.css">
          <link rel="stylesheet" href="../stylesheets/admin_index7.css">
          <link rel="stylesheet" href="../stylesheets/admin7.css">
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
          <title>Admin Navigation</title>
        </head>

        <body>
          <div class="container">

            <div class="left-panel">
              <jsp:include page="/pages/admin_nav.jsp" />
            </div>
            <div class="right-panel">
              <div class="admin-info">
                <jsp:include page="/pages/admin_header.jsp" />
              </div>
              <div class="dashboard-container">
                <div class="status-container">

                  <div class="total-container">
                    <h2>Total User</h2>
                    <hr width="95%" style=" border-top: 1px" />
                    <h2 style="font-size: 30px;">28,985</h2>
                  </div>
                  <div class="total-container">
                    <h2>Total View</h2>
                    <hr width="95%" style=" border-top: 1px" />
                    <h2 style="font-size: 30px;">87,546</h2>
                  </div>
                  <div class="total-container">
                    <h2>Total Likes</h2>
                    <hr width="95%" style=" border-top: 1px" />
                    <h2 style="font-size: 30px;">56,324</h2>
                  </div>
                  <div class="total-container">
                    <h2>Total Comments</h2>
                    <hr width="95%" style=" border-top: 1px" />
                    <h2 style="font-size: 30px;">78,435</h2>
                  </div>
                  <div class="total-container">
                    <h2>Total Movies</h2>
                    <hr width="95%" style=" border-top: 1px" />
                    <h2 style="font-size: 30px;">34,134</h2>
                  </div>
                </div>
                <div class="status-detail">

                  <div class="status-detail-container">
                    <h2 style="font-size: 30px;">Recent Users</h2>
                    <hr width="95%" style=" border-top: 1px" />
                    <sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
                      url="jdbc:mysql://localhost:3306/user_registration" user="root" password="" />
                    <sql:query var="userinfo" dataSource="${dbConnection}">
                      SELECT user_name, email FROM user WHERE role_id = 98
                    </sql:query>
                    <sql:query var="movieinfo" dataSource="${dbConnection}">
                      SELECT movie_name FROM movies_info
                    </sql:query>

                    <div class="all-user-container">
                      <div class="table-heading">
                        <h1>S.No</h1>
                        <h1>Username</h1>
                        <h1>Email</h1>
                      </div>

                      <hr width="95%" style=" border-top: 1px" />

                      <c:forEach var="users" items="${userinfo.rows}">
                        <div class="user-info-box">
                          <h1>
                            <% out.print(String.valueOf(num) + " " ); num +=1;%>
                          </h1>
                          <h1>${users.user_name}</h1>
                          <h1>${users.email}</h1>
                        </div>
                      </c:forEach>

                    </div>
                  </div>
                  <div class="all-movies-container">
                    <h2 style="font-size: 30px;">Top Movies</h2>
                    <hr width="95%" style=" border-top: 1px" />
                    <div class="table-heading">
                      <h1>S.No</h1>
                      <h1>Movie Name</h1>
                    </div>
                    <hr width="95%" style=" border-top: 1px" />
                    <c:forEach var="movies" items="${movieinfo.rows}">
                    
                      <div class="user-info-box">
                        <h1>
                          <% out.print(String.valueOf(movie_id) + " " ); movie_id +=1;%>
                        </h1>
                        <h1>${movies.movie_name}</h1>
                      </div>

                    </c:forEach>



                  </div>
                </div>
              </div>
            </div>
          </div>
        </body>

        </html>