<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
         <%int num=1; int movie_id=1;%>
            <!DOCTYPE html>
            <html>

            <head>
            <link rel="stylesheet" href="../stylesheets/admin_movies7.css">
                <link rel="stylesheet" href="../stylesheets/admin_header7.css">
                <link rel="stylesheet" href="../stylesheets/admin_index7.css">
                <link rel="stylesheet" href="../stylesheets/admin7.css">
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
                <meta charset="UTF-8">
                <title>Admin</title>
            </head>

            <body>
            <sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/user_registration" user="root" password=""/>
            <sql:query var="movies" dataSource="${dbConnection}">
            SELECT movie_name, director, entertainment, release_date FROM movies_info
            </sql:query>
            
                <div class="container">

                    <div class="left-panel">
                        <jsp:include page="/pages/admin_nav.jsp" />
                    </div>
                    <div class="right-panel">
                        <div class="admin-info">
                            <jsp:include page="/pages/admin_header.jsp" />
                        </div>
                        <div class="dashboard-container">
                         <div class="movie-container">
                          <div class="list-container">
                             <div class="list-heading">
                             
                             <div class="filter-box">
                             <i class="fa fa-filter" aria-hidden="true"></i>
                               <h2>Filter</h2>
                             </div>
                         
                         <a href="${pageContext.request.contextPath}/pages/movie_add.jsp"><button type="submit">Add</button></a>
                             
                             
                             </div>  
                         <hr width="100%" style=" border-top: 1px" />
                          <div class="all-movie-details-heading">
                   
                          <div class="movie-detail-box">
                          <h2>S.No</h2>
                          </div>
                            <div class="movie-detail-box">
                          <h2>Name</h2>
                          </div>
                          <div class="movie-detail-box">
                          <h2>Director</h2>
                          </div>
                          <div class="movie-detail-box">
                         <h2>Entertainment</h2>
                          </div>
                          <div class="movie-detail-box">
                          <h2>Release Date</h2>
                          </div>
                          <div class="movie-detail-box">
                          
                          </div>
                          <div class="movie-detail-box">
                         
                          </div>
                          </div>
                            <hr width="100%" style=" border-top: 1px" />
                            
                            <c:forEach var="movie" items="${movies.rows}">
                                    <div class="all-movie-details-heading">
                   
                          <div class="movie-detail-container">
                          <h3><% out.print(String.valueOf(num) + " " ); num +=1;%></h3>
                          </div>
                            <div class="movie-detail-container">
                          <h3>${movie.movie_name}</h3>
                          </div>
                          <div class="movie-detail-container">
                          <h3>${movie.director}</h3>
                          </div>
                          <div class="movie-detail-container">
                         <h3>${movie.entertainment}</h3>
                          </div>
                          <div class="movie-detail-container">
                          <h3>${movie.release_date}</h3>
                          </div>
                          <div class="movie-detail-container">
  
                         <form method="post" action="${pageContext.request.contextPath}/ModifyServlet">
                            <input type="hidden" value="${movie.movie_name}" name="updateId">
                             <button type="submit">Update</button>
                         </form>    
                          </div>
                          <div class="movie-detail-container">
                          
                          <form id="deleteForm-${movie.movie_name}" action="${pageContext.request.contextPath}/ModifyServlet" method="post">
                                               
                             <input type="hidden" name="deleteId" value="${movie.movie_name}" >
                             <button type="button" onClick="confirmDelete('${movie.movie_name}')">Delete</button>
                         
                         </form>
                          </div>
                          </div>
                            
                            </c:forEach>
                       
                          </div>
                         
                         
                         </div>
                        </div>
                    </div>
                </div>
            </body>

<script>

function confirmDelete(movieName)
{
	if(confirm("Are you sure you want to delete this movie: " + movieName))
	{
	
		document.getElementById("deleteForm-" + movieName).submit();
		
	}
	
}

</script>
            </html>