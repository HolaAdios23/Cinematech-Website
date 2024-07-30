<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

    <% int checkid = 0;  String movieid = null; %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/movie_add.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Movie</title>
    </head>

    <body>
    
  
    
    
    <sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/user_registration"
    user="root" password=""/>
    
    <sql:query var="movies" dataSource="${dbConnection}">
    SELECT * FROM movies_info
    </sql:query> 
    
    <sql:query var="movie_number" dataSource="${dbConnection}">
    SELECT * FROM movies_info WHERE movie_name = "<%out.print(request.getParameter("updateId")); %>"
    </sql:query>
    

              <c:forEach var="movie" items="${movies.rows}">                  
                <%
                checkid += 1;
                %>
              </c:forEach>

        <div class="container">
            <div class="left-container">

            </div>
            
            
            <div class="right-container">
    <form action="${pageContext.request.contextPath}/MovieUpdateServlet" method="post" enctype="multipart/form-data">
                <div class="movie-register-container">
                    <div class="movie-title">
                     <%
    String added = (String)request.getAttribute("movieadded");
    
                     if(added != null && !added.isEmpty())
                     {
                    	 %>
                    	 <p style="color:red; font-family: arial; font-size:16px;"><%=added %></p>
                    	 <%
                    
                        }
                     
                          %>
    
                        <h1><% 
                        if(request.getParameter("updateId") != null && !request.getParameter("updateId").isEmpty())
                        {	
                        out.print(request.getParameter("updateId"));	
                        }
                        else
                        {
                        	
                        	out.print("Movie Detail");
                        	
                        }
                        	%></h1>
                    </div>


                    <div class="movie-id-container">
                        <i class="fa fa-medium" aria-hidden="true"></i>
                        <input type="number" placeholder="Movie Id" id="movie_id" name="movie_id"  required>
                        
                    </div>

                    <div class="two-container">

                        <div class="movie-name-container">
                            <div class="movie-box">
                                <i class="fa fa-film" aria-hidden="true"></i>
                                <input type="text" placeholder="Movie Name" id="movie_name" name="movie_name" required>
                            </div>

                        </div>
                        <div class="movie-name-container">
                            <div class="movie-box">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <input type="text" placeholder="Director Name" id="movie_director"
                                    name="movie_director" required>
                            </div>

                        </div>
                    </div>
                    
                    
                    <div class="two-container">
                        <div class="movie-name-container">
                            <div class="movie-box">
                                <i class="fa fa-film" aria-hidden="true"></i>
                                <input type="text" placeholder="Categories" id="movie_categories"
                                    name="movie_categories" required>
                            </div>

                        </div>
                        <div class="movie-name-container">
                            <div class="movie-date">
                                <input type="date" id="movie_date" name="movie_date" required>
                            </div>

                        </div>
                    </div>
                    
                    
                    <div class="two-container">
                    
                        <div class="entertainment-radio-container">
                            <input type="radio" name="movie_entertainment" value="movie" checked>
                            <span>Movie</span>
                            <input type="radio" name="movie_entertainment" value="tvshow">
                            <span>TV Show</span>
                        </div>
                        
                        <div class="second-two-container">
                            <div class="movie-imbd-container">
                                <i class="fa fa-imdb" aria-hidden="true"></i>
                                <input type="text" placeholder="Movie Imdb" id="movie_imdb" name="movie_imdb" required>
                            </div>
                            
                            <div class="movie-imbd-container">
                                <i class="fa fa-clock-o" aria-hidden="true"></i>
                                <input type="text" placeholder="Movie Duration" id="movie_duration"
                                    name="movie_duration" required>
                            </div>
                            
                        </div>
                    </div>


                    <div class="upload-image-container">
                        <input type="file" id="image" name="image" required>
                    </div>

                    <div class="movie-description-container">
                        <textarea placeholder="Movie Description"  id="movie_description" name="movie_description" required></textarea>
                    </div>

                    <div class="update-container">
                    <input type="hidden" name="<%  if(request.getParameter("updateId") != null && !request.getParameter("updateId").isEmpty())
                    		{  
                    	       out.print("updateId");
                    	
                            }
                            else 
                            {
                            	
                            	out.print("addId");
                            	
                            }  %>"    value="<%if(request.getParameter("updateId") != null && !request.getParameter("updateId").isEmpty())
                    		{  
                            	out.print(request.getParameter("updateId"));
                     	
                             }
                             else 
                             {
                             
                             	out.print("add");
                             	
                             }  %>">
                        <button type="submit">Update</button>
                    </div>
                </div>
                
  </form>
  
            </div>
              
            
           
        </div>

    </body>

    </html>