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


public class Newpass2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Newpass2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		String newpass=request.getParameter("Password");
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf = cfg.buildSessionFactory();
		org.hibernate.Session ses = sf.openSession();
		Transaction txn = ses.beginTransaction();
		PrintWriter out=response.getWriter();
		if(session.getAttribute("type").equals("Student"))
		{
		Query q=ses.createQuery("update Student s set s.password=:password where s.Umail=:Umail");
		q.setString("password", newpass);
		q.setString("Umail", (String)session.getAttribute("Umail"));
		int i=q.executeUpdate();
		System.out.println(i);
		session.invalidate();
		txn.commit();
		ses.close();
		 out.print("<script>alert('password update successfully')</script>");
		RequestDispatcher rd= request.getRequestDispatcher("etution.jsp");
		rd.include(request, response);
		}
		else {
			
			Query q=ses.createQuery("update Faculty s set s.password=:password where s.Umail=:Umail");
			q.setString("password", newpass);
			q.setString("Umail", (String)session.getAttribute("uemail"));
			int i=q.executeUpdate();
			System.out.println(i);
			session.invalidate();
			 out.print("<script>alert('password update fail')</script>");
			RequestDispatcher rd= request.getRequestDispatcher("etution.jsp");
			rd.include(request, response);

			
		
		}
	}

}
