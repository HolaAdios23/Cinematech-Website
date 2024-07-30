<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <!DOCTYPE html>
   <html>
<%

String servererror = (String)request.getAttribute("servererror");
String usererror = (String)request.getAttribute("usererror");
String emailerror = (String)request.getAttribute("emailerror");
String passworderror = (String)request.getAttribute("passworderror");


%>
   <head>
      <meta charset="UTF-8">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/register1.css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <title>Cinematech</title>
   </head>

   <body>


      <form action="${pageContext.request.contextPath}/SignupServlets" method="post">
         <div class="split-container">
            <div class="split-left">
            </div>

            <div class="split-right">
          
               <div class="registration-container">
                  <div class="register-title">
                    <%
            
            if(servererror != null && !servererror.isEmpty())
            {
            	%>
            	<p style="color:red; font-family: arial; "><%= servererror %></p>
            	<%
            }
                    if(usererror != null && !usererror.isEmpty())
                    {
                    	%>
                    	<p style="color:red; font-family: arial; "><%= usererror %></p>
                    	<%
                    }
                    if(emailerror != null && !emailerror.isEmpty())
                    {
                    	%>
                    	<p style="color:red; font-family: arial; "><%= emailerror %></p>
                    	<%
                    }
                    if(passworderror != null && !passworderror.isEmpty())
                    {
                    	%>
                    	<p style="color:red; font-family: arial; "><%= passworderror %></p>
                    	<%
                    }
            
            %>
                     <h1>Sign Up</h1>
                     <p>Find Your Favorite Movies Here!</p>
                  </div>


                  <div class="input-container">
                     <i class="fa fa-user" aria-hidden="true"></i>
                     <input type="text" placeholder="Username" id="username" name="username" value="TomHolland"
                        required />

                  </div>

                  <div class="input-container">
                     <i class="fa fa-envelope" aria-hidden="true"></i>
                     <input type="text" placeholder="Email" id="email" name="email" value="tomholland@gmail.com"
                        required>

                  </div>
                  <div class="radio-container">
                     <input type="radio" name="gender" value="male" checked>
                     <span>Male</span>
                     <input type="radio" name="gender" value="female">
                     <span>Female</span>
                  </div>

                  <div class="date-container">
                     <input type="date" max="2006-05-20" min="1900-05-20" id="birthday" name="birthday" required>
                  </div>

                  <div class="input-container">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                     <input type="password" placeholder="Password" id="password" name="password" value="12345" required>
                  </div>
                  <div class="input-container">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                     <input type="password" placeholder="Re-type Password" id="retypepassword" name="retypepassword"
                        value="12345" required>
                  </div>

                  <div class="signup-container">

                     <button type="submit">SignUp</button>
                     or
                     <a href="${pageContext.request.contextPath}/pages/login.jsp"> <button type="button">Login</button></a>
                  </div>

               </div>

            </div>
         </div>

      </form>
   </body>

   </html>