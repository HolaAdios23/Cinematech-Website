<%@page import="util.StringUtil" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/login2.css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <title>Cinematech</title>
    </head>

    <body>

      <div class="split-container">

        <div class="split-left">

        </div>
        <div class="split-right">

          <div class="login-container">
            <div class="logintitle">
              <h1>Log In</h1>
              <p>Find Your Favorite Movies Here!</p>
            </div>
            <form action="${pageContext.request.contextPath}/LoginServlets" method="post">
              <div class="input-container">
                <i class="fa fa-user" aria-hidden="true"></i>
                <input type="text" placeholder="Username" id="username" name="username" required>
              </div>
              <div class="input-container">
                <i class="fa fa-lock" aria-hidden="true"></i>
                <input type="password" placeholder="Password" id="password" name="password" required>
              </div>

              <div class="login-button">

                <button type="submit">Log In</button>

              </div>
            </form>
            <div class="forgotpassword-container">
              <a href="">Forgot Password?</a>
            </div>


            <div class="forgotpassword-container">

              <hr width="100%" style=" border-top: 1px" />
            </div>

            <div class="dont-have">
              <a>Don't Have An Account? </a> &nbsp
              <a href="register.jsp" style="font-weight:bold;">Sign Up</a>
            </div>
            <div class="dont-have">
              <% String errorMessage=(String) request.getAttribute(StringUtil.MESSAGE_ERROR_ATTRIBUTE); if(errorMessage
                !=null) { %>
                <h2 style="color: red; font-family: arial; font-size: 16px; font-style: regular;">
                  <%out.println(errorMessage); %>
                </h2>
                <% } %>
            </div>


          </div>
        </div>
      </div>

    </body>

    </html>