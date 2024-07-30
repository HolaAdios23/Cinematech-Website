package controller.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.database.DatabaseController;
import model.UserModel;


@WebServlet(asyncSupported = true, urlPatterns = { "/WatchlistServlet" })
public class WatchlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final DatabaseController databasecontroller;
	String userId = null;
    public WatchlistServlet() {
        super();
        this.databasecontroller = new DatabaseController();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		
		String username = (String)session.getAttribute("username");
		String moviename = request.getParameter("watchlist");
		
		
		for(UserModel model : databasecontroller.getAllUserInfo())
		{
			
			if(username.equals(model.getUsername()))
			{
				userId = model.getUserId();
			}
			
		}
		System.out.println(username);
		System.out.println(moviename);
		System.out.println(userId);
		
		int result = databasecontroller.addToWatchList(userId, moviename);
		
		if(result == 1)
		{
			request.getRequestDispatcher("/index/index.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/index/index.jsp").forward(request, response);
		}
		
		

	}

}
