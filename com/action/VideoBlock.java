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

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class VideoBlock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VideoBlock() {
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
		
		
		HttpSession sfsdgg=request.getSession(false);
		PrintWriter out=response.getWriter();
		 String Umail=request.getParameter("Umail");
		int state=Integer.parseInt(request.getParameter("state"));
		String path=request.getParameter("path");
	    System.out.println("Admin control block path="+path+" state="+state+" umail"+Umail);
	   
		Configuration cfg=new Configuration();
		cfg.configure();
		SessionFactory sess=cfg.buildSessionFactory();
		org.hibernate.Session session =sess.openSession();
		Transaction txn=session.beginTransaction();
		Query query=session.createQuery("UPDATE Study set state=:state where faculty LIKE : Umail and path LIKE : path");
		query.setString("Umail",Umail );
		query.setString("path",path );
		  if(state==1)
		  {
			  query.setInteger("state",0);
			  int row=query.executeUpdate();
			  System.out.println("row are affected"+row);
		  System.out.println(row+"video are Unblock");
		  txn.commit();
		  session.close();
		  RequestDispatcher rd=request.getRequestDispatcher("facultyData.jsp?fUmail="+Umail);
		rd.include(request, response);
			out.println("<script>alert('video are Unblock')</script>");
			return;
		  }
		  if(state==0)
		  {
			  query.setInteger("state",1);
			  int row=query.executeUpdate();
			  System.out.println(row+"are effected if block of student");
			  txn.commit();
			  session.close();
			  RequestDispatcher rd=request.getRequestDispatcher("facultyData.jsp?fUmail="+Umail);
				rd.include(request, response);
				out.println("<script>alert('video are block')</script>");
				return;

			  
		  }

		
		
	}

}
