package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class AdminControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminControl() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {

	}

	public void destroy() {

	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{  
		HttpSession sdfg=request.getSession(false);
		
		
		
		PrintWriter out=response.getWriter();
		int state=Integer.parseInt(request.getParameter("state"));
	    System.out.println("Admin control block");
	    String Umail=request.getParameter("Umail");
	    String page=request.getParameter("page");
		Configuration cfg=new Configuration();
		cfg.configure();
		SessionFactory sf=cfg.buildSessionFactory();
		org.hibernate.Session session =sf.openSession();
		Transaction txn=session.beginTransaction();
		try {
		if(request.getParameter("type").equals("Student"))
		{
		
		Query query=session.createQuery("update Student e set e.state=:state where Umail=:Umail");
		query.setString("Umail",Umail );
		  if(state==1)
			  query.setInteger("state",0);
		  else
			  query.setInteger("state",1);
		  int row=query.executeUpdate();
		  System.out.println(row+"are effected if block of student");
		  txn.commit();
		  session.close();
		  RequestDispatcher rd=request.getRequestDispatcher("studentInfo.jsp");
			rd.include(request, response);
			out.println("<script>alert('Update successfuly')</script>");
			return;

		}
		else
		{
			Query query=session.createQuery("update Faculty e set e.state=:state where Umail=:Umail");
			query.setString("Umail",Umail );
			  if(state==0)
				  query.setInteger("state",2);
			  else if(state==2)
				  query.setInteger("state",0);
			  else if(state==1)
				  query.setInteger("state",0);
			  System.out.println("if ececute of faculty"); 
			  int row=query.executeUpdate();
			  System.out.print(row+"rows are affected ");
			  txn.commit();
			  session.close();
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.include(request, response);
			out.println("<script>alert('Update successfuly')</script>");
			return;
		}
		}
		catch(Exception e)
		{
			txn.rollback();
			session.close();
			out.println("<script>alert('Update fail')</script>");
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.include(request, response);
			e.printStackTrace();
		}    
	}

}
