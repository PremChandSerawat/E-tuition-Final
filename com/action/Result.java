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


public class Result extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
        public Result() {
        super();
        // TODO Auto-generated constructor stub
    }

		public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}
	public void destroy() {
		// TODO Auto-generated method stub
	}

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String option[]=new String[11];
		String rightAnswer[]=new String[11];
		int totalMarks=0;
		
		
	
	  for(int i=1;i<=5;i++)
	  {
		  if(i==5)
		  {   
			  System.out.println(totalMarks+"you scored");
			  PrintWriter p=response.getWriter();
			  p.print("<script>alert('total marks score in quize = "+totalMarks+"')</script>");
			  RequestDispatcher rd=request.getRequestDispatcher("result.jsp");
			  rd.include(request, response);
			  break;
		  }
		  else {
		  option[i]=request.getParameter("answer"+i);
		  System.out.println("option "+option[i]);
		  rightAnswer[i]=request.getParameter("rightAnswer"+i);
		  System.out.println("right answer "+rightAnswer[i]);
		  if(option[i].equals(rightAnswer[i]))
			  totalMarks++;
		  }
			  
	  }
	  	}

}
