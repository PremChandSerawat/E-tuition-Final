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


public class Ufaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Ufaculty() {
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
		
		
		
		
		HttpSession se=request.getSession(false);
		String uemail=(String) se.getAttribute("Uemail");

		String type=(String) se.getAttribute("type");
		Configuration cfg=new Configuration();
		    cfg.configure();
		 SessionFactory sf=cfg.buildSessionFactory();
		 org.hibernate.Session session=sf.openSession();  
		 Transaction txn=session.beginTransaction();
		 Query q=session.createQuery("update Faculty e set e.Experience=:Experience,e.subject=:subject,e.Qualification=:Qualification,e.state=:state where e.Umail=:Umail");
		 q.setString("Experience",request.getParameter("Experience"));
		 q.setString("subject",request.getParameter("subject"));
		 q.setString("Qualification",request.getParameter("Qualification"));
		 q.setString("Umail",(String) se.getAttribute("Umail"));
		 q.setInteger("state", 2);
		 int n=q.executeUpdate();
		 txn.commit();
		 session.close();
		 PrintWriter p=response.getWriter();
		 
		 p.print("<script>'profile update successful'</script>");
		 RequestDispatcher rd=request.getRequestDispatcher("faculty.jsp");
		 rd.include(request, response);
		 
		 se.setAttribute("subject",request.getParameter("subject"));
		 
		 
	}

}
