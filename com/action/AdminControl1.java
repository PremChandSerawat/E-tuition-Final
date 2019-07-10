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

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class AdminControl1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminControl1() {
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
			PrintWriter out=response.getWriter();
			int state=Integer.parseInt(request.getParameter("state"));
			System.out.println("Admin control 1 block");
		    String Umail=request.getParameter("Umail");
		    String page=request.getParameter("page");
			Configuration cfg=new Configuration();
			cfg.configure();
			SessionFactory sf=cfg.buildSessionFactory();
			org.hibernate.Session session =sf.openSession();
			Transaction txn=session.beginTransaction();

			Query query=session.createQuery("update Faculty e set e.state=:state where Umail=:Umail");
			query.setString("Umail",Umail );
			 if(state!=3)
		     {
			  query.setInteger("state",3);
		     }else if(state==3)
			  query.setInteger("state",2);
			 System.out.println("else execute of faculty");
			  int row=query.executeUpdate();
			  System.out.print(row+"rows are affected ");
			  
			  try {
			  txn.commit();
			  session.close();
			  RequestDispatcher rd=request.getRequestDispatcher("facultyInfo.jsp");
				rd.include(request, response);
				out.println("<script>alert('Update successfuly')</script>");
				return;
			  }
				catch(Exception e)
				{
					txn.rollback();
					session.close();
					out.println("<script>alert('Update fail 1')</script>");
					RequestDispatcher rd=request.getRequestDispatcher(page);
					rd.include(request, response);
					e.printStackTrace();
				}
	}

}
