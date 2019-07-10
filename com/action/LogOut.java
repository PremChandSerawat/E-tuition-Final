package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
       public LogOut() {
        super();
        
    }

		public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}
	public void destroy() {
		// TODO Auto-generated method stub
	}

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			HttpSession session=request.getSession(false);
			session.invalidate();
			PrintWriter out=response.getWriter();
			out.println("<script>alert('logout successful')</script>");
			
            RequestDispatcher rd=request.getRequestDispatcher("etution.jsp");
            rd.include(request, response);
			
			
	}

}
