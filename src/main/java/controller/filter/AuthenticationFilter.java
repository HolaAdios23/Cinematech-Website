package controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthenticationFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);
		
	

		boolean isLoggedIn = session != null && session.getAttribute("username") != null;
		boolean isAdminLoggedIn = session != null && session.getAttribute("sessionadmin") != null;

		String uri = req.getRequestURI();
		boolean isLogin = uri.endsWith("/login.jsp");
		boolean isLoginServlet = uri.endsWith("/LoginServlets");
		boolean isLogoutServlet = uri.endsWith("/LogoutServlet");

		if (!isAdminLoggedIn) {
			if (uri.endsWith("/index.jsp") || uri.endsWith(".css")
					|| uri.endsWith(".jpeg") || uri.endsWith(".jpg")) {
				chain.doFilter(request, response);
				return;
			}
		}

//		if (!isAdminLoggedIn && !(isLogin || isLoginServlet)) 
//		{
//			
//			res.sendRedirect(req.getContextPath() + "/pages/login.jsp"); 
//
//		}
//		else if(!isLoggedIn && !(isLogin || isLoginServlet))
//		{
//			
//         res.sendRedirect(req.getContextPath() + "/pages/login.jsp"); 
//		}
		
		
		
		if(!isAdminLoggedIn && uri.endsWith("/admin/admin_index.jsp"))
		{
			if (!isAdminLoggedIn && !(isLogin || isLoginServlet)) 
			{
				
				res.sendRedirect(req.getContextPath() + "/pages/login.jsp"); 

			}
		}
		else if (isAdminLoggedIn && !(!isLogin || isLogoutServlet)) {
			res.sendRedirect(req.getContextPath() + "/admin/admin_index.jsp");
		}
		else if(isAdminLoggedIn && uri.endsWith("/index/index.jsp"))
		{
			res.sendRedirect(req.getContextPath() + "/admin/admin_index.jsp");
		}
		else if(!isAdminLoggedIn && isLoggedIn && !(!isLogin || isLogoutServlet))
		{
			res.sendRedirect(req.getContextPath() + "/index/index.jsp");
		}
		else if(!isAdminLoggedIn &&isLoggedIn && (uri.endsWith("/admin/admin_index.jsp") || uri.endsWith("/admin/admin_movie.jsp") || uri.endsWith("/admin/admin_user.jsp")))
		{
			res.sendRedirect(req.getContextPath() + "/index/index.jsp");
		}
		else { chain.doFilter(request, response); }
		
		

	

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
