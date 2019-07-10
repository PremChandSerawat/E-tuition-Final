package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.modal.Mail;


public class ContectUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ContectUs() {
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
		Query q;
		if(request.getParameter("type").equals("Student"))
			q=session.createQuery("from Student where Umail=:Umail");
		else
		  q=session.createQuery("from Faculty where Umail=:Umail");
		q.setString("Umail",request.getParameter("Umail"));
		List list=q.list();
		if(!list.isEmpty())
		{
		com.modal.Mail mail=new Mail();
		mail.setSender(request.getParameter("Umail")+"("+request.getParameter("type")+")");
		mail.setDate(new Date());
		mail.setReceiver("admin.contect@mail.com");
		mail.setSubject(request.getParameter("Subject"));
		mail.setMessage(request.getParameter("Message"));
		session.save(mail);
		txn.commit();
		session.close();
       	PrintWriter out=response.getWriter();
       	out.print("<script>alert('message send successful')</script>");
       	RequestDispatcher rd=request.getRequestDispatcher("etution.jsp");
       	rd.include(request, response);
		}else {
			PrintWriter out=response.getWriter();
	       	out.print("<script>alert('plese register first')</script>");
	       	RequestDispatcher rd=request.getRequestDispatcher("etution.jsp");
	       	rd.include(request, response);

			
		}
		
	}

}
