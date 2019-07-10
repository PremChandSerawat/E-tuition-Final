package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

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

public class Query12 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Query12() {
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
		
		HttpSession session=request.getSession(false);		
		Configuration cfg=new Configuration();
		 cfg.configure("hibernate.cfg.xml");
		 SessionFactory sf=cfg.buildSessionFactory();
		 org.hibernate.Session ses=sf.openSession();
		 Transaction txn=ses.beginTransaction();
	     Query query=ses.createQuery("update Query1 e set e.answer=:answer where e.id=:id");
	     query.setString("answer", request.getParameter("answer"));
	     query.setInteger("id", Integer.parseInt(request.getParameter("questionId")));
	     query.executeUpdate();
		 txn.commit();
		 PrintWriter out=response.getWriter();
		 out.print("<script>alert('answer submited')</script>");
		 RequestDispatcher rd=request.getRequestDispatcher("fInbox.jsp");
		 rd.include(request, response);
		 
	}

}
