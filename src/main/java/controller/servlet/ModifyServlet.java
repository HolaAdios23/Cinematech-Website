package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.database.DatabaseController;


@WebServlet(asyncSupported = true, urlPatterns = { "/ModifyServlet" })
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private final DatabaseController databasecontroller;
  
    public ModifyServlet() {
        super();
        
        this.databasecontroller = new DatabaseController();
        
    }



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String updateId = request.getParameter("updateId");
		String deleteId = request.getParameter("deleteId");
		String userdeleteId = request.getParameter("userdeleteId");
	
		
		if(deleteId != null && !deleteId.isEmpty())
		{
			doMovieDelete(request, response);
		}
		
		if(updateId != null && !updateId.isEmpty())
		{
			doMoviePut(request, response);
			
		}
		
		if(userdeleteId != null && !userdeleteId.isEmpty())
		{
			
			doUserDelete(request, response);
		}
		
		
	}
	protected void doUserDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Do Delete Trigger");
		
		if(databasecontroller.deleteUserInfo(request.getParameter("userdeleteId")) == 1)
		{
			response.sendRedirect(request.getContextPath() + "/admin/admin_user.jsp");
			
		}
		else 
		{
			response.sendRedirect(request.getContextPath() + "/admin/admin_user.jsp");
		}
		
	}
	
	protected void doMoviePut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Do Update Trigger");
		
		
		request.getRequestDispatcher("/pages/movie_add.jsp").forward(request, response);
	
		
	}
	
	protected void doMovieDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Do Delete Trigger");
		
		if(databasecontroller.deleteMovieInfo(request.getParameter("deleteId")) == 1)
		{
			response.sendRedirect(request.getContextPath() + "/admin/admin_movie.jsp");
			
		}
		else 
		{
			response.sendRedirect(request.getContextPath() + "/admin/admin_movie.jsp");
		}
		
	}

}
