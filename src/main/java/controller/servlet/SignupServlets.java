package controller.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.database.DatabaseController;
import model.UserModel;


@WebServlet(asyncSupported = true, urlPatterns = { "/SignupServlets" })
public class SignupServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
	boolean check_username, check_useremail = false;
	
	private final DatabaseController databasecontroller;
    public SignupServlets() {
        super();
        databasecontroller = new DatabaseController();
     
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		LocalDate dob = LocalDate.parse(birthday);
		String password = request.getParameter("password");
		String retypepassword = request.getParameter("retypepassword");
		
		for(UserModel model : databasecontroller.getAllUserInfo())
		{
			if(model.getUsername().equals(username))
			{
				check_username = true;
			}
			if(model.getEmail().equals(email))
			{
				check_useremail = true;
			}
			
		}
		
		if(!check_username)
		{
			
			if(!check_useremail)
			{
				
				
				if(password.equals(retypepassword))
				{
					UserModel model = new UserModel(username, email, gender, dob, password);
					
					int result = databasecontroller.UserRegister(model);
					if(result == 1)
					{
						
						response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
					}
					else
					{
						request.setAttribute("servererror", "Server Error");
						request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
					
					}
				}
				else 
				{
					request.setAttribute("passworderror", "Password does not match!");
					request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
				}
				
				
				
			}
			else 
			{
				check_useremail = false;
				request.setAttribute("emailerror", "Email Already Exist!");
				request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
			}
			
			
		}
		else
		{
			request.setAttribute("usererror", "Username Already Exist!");
			request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
		
			check_username = false;
			
		}
		

	
	}

}
