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

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.modal.Mail;

public class Query1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Query1() {
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
		
		Configuration cfg=new Configuration();
		cfg.configure();
		SessionFactory sf=cfg.buildSessionFactory();
		Session session=sf.openSession();
		Transaction txn=session.beginTransaction();
		String faculty=request.getParameter("receiver");
		String student=request.getParameter("sender");
		String subject=request.getParameter("subject");
        com.modal.Query1  m=new com.modal.Query1();
        m.setQuery(request.getParameter("massage"));
        m.setStudent(request.getParameter("sender"));
        m.setFaculty(request.getParameter("receiver"));
        m.setSubject(subject);
    	m.setDate(new Date());
    	session.save(m);
		txn.commit();
		session.close();
       	PrintWriter out=response.getWriter();
       	out.print("<script>alert('message send successful')</script>");
       	RequestDispatcher rd=request.getRequestDispatcher("courseContent.jsp?faculty="+faculty+"&subject="+subject);
       	rd.include(request, response);

		
		
	}

}
