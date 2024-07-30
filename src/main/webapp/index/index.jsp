<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <% int movie_size = 0; int tv_size = 0;%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/homestyle5.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/header2.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Index</title>
        <style>
        body{
        	background: linear-gradient(to top, rgba(0, 0, 0, 1),rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0)), url('${pageContext.request.contextPath}/resources/headerbackground.jpeg');
	background-size:cover; 
        }
        </style>
    </head>

    <body>
        <sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/user_registration" user="root" password=""/>
        <sql:query var="movies" dataSource="${dbConnection}">
        SELECT * FROM movies_info WHERE entertainment = "movie"
        </sql:query>
        
        <sql:query var="tvshows" dataSource="${dbConnection}">
          SELECT * FROM movies_info WHERE entertainment = "tvshow" 
        </sql:query>
        
        <jsp:include page="/pages/header.jsp" />
        
        <div class="home-container">
        <div class="left-home">
        
        <h1>FIND YOUR FAVORITE <br> MOVIE AND TV SHOWS <br> HERE!</h1>
        <p>Millions of Movies and Tv Show information available.<br> Find Ratings and  reviews for the newest and upcoming<br> movies and tv shows.</p>
        
        <input type="submit" value="Learn More" name="Learn more">
        
        </div>
        <div class="right-home">
       
       <div class="heading-image">
       
       </div>
        </div>
        </div>
<div class="tv-logos-container">
       <div class="tv-logos">
      <img src="${pageContext.request.contextPath}/resources/logo/netflix.png"/>
       </div>
       <div class="tv-logos">
      <img src="${pageContext.request.contextPath}/resources/logo/prime.png"/>
       </div>
       <div class="tv-logos">
      <img src="${pageContext.request.contextPath}/resources/logo/disneyplus.png"/>
       </div>
       <div class="tv-logos">
      <img src="${pageContext.request.contextPath}/resources/logo/AppleTV.png"/>
       </div>
       <div class="tv-logos">
      <img src="${pageContext.request.contextPath}/resources/logo/hulu.png"/>
       </div>
       </div>
       

<h1 style="color: #dadada;
	font-family: arial;
	font-style: bold;
	margin-left: 50px;
	font-size: 28px; margin-top: 100px;">Trending Movies</h1>
<div class="list-movies-container">

<div class="movie-horizontal-container">

<c:forEach var="movie" items="${movies.rows}">

<% movie_size += 1; %>

<%if(movie_size <= 6)
	{
%>
<div class="movie-detail-container">

<a href="">
 <img  src="${pageContext.request.contextPath}/resources/movie/${movie.movie_image}"/>
  </a>
 <div style="color: #dadada;
	font-family: arial;
	font-weight: bold;
	font-size: 20px;
	margin-top: 10px;"  class="movie-title">
 ${movie.movie_name}
 </div>
 <div class="movie-title">


 <i style="font-size: 16px;color:yellow;" class="fa fa-star" aria-hidden="true"></i>
 ${movie.imdb}
 
 <div style="font-size: 16px; width: 100%; display:flex; justify-content: right; align-items:center; color:#acacac;">
 ${movie.release_date}
 
 </div>
 
 </div>

<div class="movie-title">

 <div class="watchlist-container">
 <form action="${pageContext.request.contextPath}/WatchlistServlet" method="post">
 <input type="hidden" value="${movie.movie_id}" name="watchlist" id="watchlist"/>
 <button type="submit">+ Watchlist</button>
 </form>
 </div>
 
</div>

 </div>
<%
	}
	%>

</c:forEach>
 

</div>
</div>
<h1 style="color: #dadada;
	font-family: arial;
	font-style: bold;
	margin-left: 50px;
	font-size: 28px; margin-top: 50px;">Latest TVShows</h1>
<div class="list-movies-container">

<div class="movie-horizontal-container">

<c:forEach var="tvshow" items="${tvshows.rows}">

<% tv_size += 1; %>

<%if(tv_size <= 6)
	{
%>
<div class="movie-detail-container">

<a href="">
 <img  src="${pageContext.request.contextPath}/resources/movie/${tvshow.movie_image}"/>
  </a>
 <div style="color: #dadada;
	font-family: arial;
	font-weight: bold;
	font-size: 20px;
	margin-top: 10px;"  class="movie-title">
 ${tvshow.movie_name}
 </div>
 <div class="movie-title">


 <i style="font-size: 16px;color:yellow;" class="fa fa-star" aria-hidden="true"></i>
 ${tvshow.imdb}
 
 <div style="font-size: 16px; width: 100%; display:flex; justify-content: right; align-items:center; color:#acacac;">
 ${tvshow.release_date}
 
 </div>
 
 </div>

<div class="movie-title">
 <div class="watchlist-container">
 <form action="${pageContext.request.contextPath}/WatchlistServlet" method="post">
 <input type="hidden" value="${tvshow.movie_id}" name="watchlist" id="watchlist"/>
 <button type="submit">+ Watchlist</button>
 </form>
 </div>
</div>

 </div>
<%
	}
	%>

</c:forEach>
 

</div>
</div>
<jsp:include page="../pages/footer.jsp" />
    </body>

    </html>