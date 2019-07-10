package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.modal.Course;


public class FaculyAssign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FaculyAssign() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	public void destroy() {
		
		
		
		
		
		
		
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession se=request.getSession(false);  
	    Date date = new Date();  
		
		
		Configuration cfg=new Configuration();
		    cfg.configure();
		 SessionFactory sf=cfg.buildSessionFactory();
		 org.hibernate.Session session=sf.openSession();  
		 Transaction txn=session.beginTransaction();
		 Course c=new Course();
		 System.out.println(request.getParameter("course"));
		 c.setStudentName(request.getParameter("sName"));
		 c.setCourse(request.getParameter("course"));
		 c.setFaculty(request.getParameter("faculty"));
		 c.setfUmail(request.getParameter("fUmail"));
		 c.setsUmail((String)se.getAttribute("Umail"));
		 c.setStrDate(date);
		 session.save(c);
		 txn.commit();
		 session.close();
		 PrintWriter p=response.getWriter();
		 p.print("<script>alert('Faculty assigned successfully ')</script>");
		 RequestDispatcher rd= request.getRequestDispatcher("student.jsp");
		 rd.include(request, response);
	}

}
