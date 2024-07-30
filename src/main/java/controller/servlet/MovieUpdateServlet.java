package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.database.DatabaseController;
import model.MovieModel;
import util.StringUtil;



@WebServlet(asyncSupported = true, urlPatterns = { "/MovieUpdateServlet" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
maxFileSize = 1024 * 1024 * 10,
maxRequestSize = 1024 * 1024 * 50)
public class MovieUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public final DatabaseController databasecontrollers;
	public String rootPath;
	
    public MovieUpdateServlet()
    {
        super();
        this.databasecontrollers = new DatabaseController();
        // TODO Auto-generated constructor stub
    }



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		rootPath = request.getContextPath();
		
		String movieid = "m" + request.getParameter("movie_id");
		String moviename = request.getParameter("movie_name");
		String moviedirector = request.getParameter("movie_director");
		String movieimbd = request.getParameter("movie_imdb");
		String moviecategories = request.getParameter("movie_categories");
		String movieduration = request.getParameter("movie_duration");
		String movieentertainment = request.getParameter("movie_entertainment");
		String moviedate = request.getParameter("movie_date");
		LocalDate releasedate = LocalDate.parse(moviedate);
		String moviedescription = request.getParameter("movie_description");
		Part imagePart = request.getPart("image");
	    
		
		PrintWriter out = response.getWriter();
		MovieModel moviemodel = new MovieModel(movieid, moviename, moviedescription, moviedirector, moviecategories, movieduration, movieentertainment, movieimbd, releasedate, imagePart);
		
		
		if(request.getParameter("updateId") != null && !request.getParameter("updateId").isEmpty())
		{
			int result = databasecontrollers.updateMovieInfo(moviemodel, String.valueOf(request.getParameter("updateId")));
			
			System.out.println("MovieUpdateServlet: " + result);
			if(result == 0)
			{
			
				response.sendRedirect(request.getContextPath() + "/admin/admin_movie.jsp");
			}
			
		}
		else if(request.getParameter("addId") != null && !request.getParameter("addId").isEmpty())
		{
			
			
			int result = databasecontrollers.updateMovie(moviemodel, out);
			if(result == 1)
			{
				String fileName = moviemodel.getMovieImageUrlFromPart();
				if(!fileName.isEmpty() && fileName != null)
				{
					String savePath = StringUtil.IMAGE_DIR_SAVE_PATH;
					imagePart.write(savePath + fileName);
				}
				request.setAttribute("movieadded", "Movie or TV Shows has been added!");
				request.getRequestDispatcher("/pages/movie_add.jsp").forward(request, response);
			}
			else if(result == 0) 
			{
				out.print("not found");
			}
			
		
			
		}
		
	
	
	
	}

}
