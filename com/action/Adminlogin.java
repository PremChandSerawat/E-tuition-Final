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


public class Adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
        public Adminlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	
	public void destroy() {
		// TODO Auto-generated method stub
	}

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
              if(request.getParameter("uemail").equals("root")&&request.getParameter("password").equals("root"))
              {
            	  HttpSession session=request.getSession();
            	  session.setAttribute("root", "root");
            	  RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
               	  rd.include(request, response);
              }else {
            	  
            	  RequestDispatcher rd=request.getRequestDispatcher("etution.jsp");
            	  PrintWriter out=response.getWriter();
            	  out.println("<script>alert('you are not a authorized user')</script>");
            	  rd.include(request, response);
              }
     	}

}
