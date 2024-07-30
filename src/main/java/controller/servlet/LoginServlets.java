package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.database.DatabaseController;
import model.LoginModel;
import util.StringUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/LoginServlets" })
public class LoginServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final DatabaseController databasecontroller;
    public LoginServlets() {
        super();
        
        this.databasecontroller = new DatabaseController();
        // TODO Auto-generated constructor stub
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		String username = request.getParameter(StringUtil.USERNAME);
		String password = request.getParameter(StringUtil.PASSWORD);
		
		LoginModel loginmodel = new LoginModel(username,password);
		
		int loginResult = databasecontroller.getUserLoginInfo(loginmodel);
		
		if(loginResult == 1)
		{
			
			  HttpSession usersession = request.getSession();
			  usersession.setAttribute("username", username);
			  usersession.setMaxInactiveInterval(30*30);
			  Cookie userCookie = new Cookie("user", username);
			  userCookie.setMaxAge(30*60);
			  response.addCookie(userCookie);
			  
			  response.sendRedirect(request.getContextPath() + "/index/index.jsp");
			 
			
		}
		else if(loginResult == 2)
		{
			HttpSession usersession = request.getSession();	
			usersession.setAttribute("sessionadmin", username);
			usersession.setMaxInactiveInterval(30*30);
			
			Cookie userCookie = new Cookie("admin", username);
			userCookie.setMaxAge(30*60);
			response.addCookie(userCookie);
			response.sendRedirect(request.getContextPath() + "/admin/admin_index.jsp");
		}
		else if(loginResult == 0)
		{
			request.setAttribute(StringUtil.MESSAGE_ERROR_ATTRIBUTE, StringUtil.MESSAGE_ERROR_LOGIN);
			request.getRequestDispatcher(StringUtil.PAGE_LOGIN).forward(request, response);
		}
		else if(loginResult == -1)
		{
			request.setAttribute(StringUtil.MESSAGE_ERROR_ATTRIBUTE, StringUtil.MESSAGE_ERROR_LOGIN);
			request.getRequestDispatcher(StringUtil.PAGE_LOGIN).forward(request, response);
		}
		
	}

}
