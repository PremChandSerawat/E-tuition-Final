package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

import com.modal.Faculty;
import com.modal.Student;


public class Register1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
        public Register1() {
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
		HttpSession session=request.getSession(false);
		String type=(String)session.getAttribute("type");
		String Name=(String)session.getAttribute("Name");
		String uemail=(String)session.getAttribute("uemail");
		String cno=(String)session.getAttribute("cno");
		String pass=(String)session.getAttribute("pass");
		String DOB=(String)session.getAttribute("DOB");
		String generatedOtp=(String)session.getAttribute("GeneratedOtp");
		String action=(String)session.getAttribute("action");	
		System.out.println(request.getParameter("userOtp")+"userOTP");
		System.out.println(uemail);
		System.out.println(pass);
		System.out.println(type);
		
		PrintWriter out=response.getWriter();
		
		
		if(generatedOtp.equals(request.getParameter("userOtp")))
		{
		 Configuration cfg=new Configuration();
		 cfg.configure("hibernate.cfg.xml");
		 SessionFactory sf=cfg.buildSessionFactory();
		 org.hibernate.Session ses=sf.openSession();
		 Transaction txn=ses.beginTransaction();
		 if(type.equals("Student"))
		 {
		  Student re=new Student();
		  re.setName(Name);
		  re.setUmail(uemail);
		  re.setNumber(cno);
		  re.setPassword(pass);
		  re.setState(0);
		  Date date1;
		try {
			date1 = new SimpleDateFormat("yyyy-dd-MM").parse(DOB);
			 re.setDOB(date1);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 
		  try {
				 ses.save(re);
				 txn.commit();
				 session.invalidate();
				 out.print("<script>alert('registration successfully')</script>");
				 RequestDispatcher rd=request.getRequestDispatcher("etution.jsp");
				 rd.include(request, response);
				  
			} catch (Exception e) {
				txn.rollback();
				session.invalidate();
				e.printStackTrace();
				 out.print("<script>alert('please enter right details')</script>");
				RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
				 rd.include(request, response);
			}
			}	 
		 else
		 {
			Faculty re=new Faculty();
			 re.setName(Name);
			  re.setUmail(uemail);
			  re.setNumber(cno);
			  re.setPassword(pass);
			  Date date1;
			  re.setState(1);
			try {
				date1 = new SimpleDateFormat("dd-MM-yyyy").parse(DOB);
				 re.setDOB(date1);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			 
			try {
				 ses.save(re);
				 txn.commit();
				 session.invalidate();
				 out.print("<script>alert('registration successfully')</script>");
				 RequestDispatcher rd=request.getRequestDispatcher("etution.jsp");
				 rd.include(request, response);
				  
			} catch (Exception e) {
				txn.rollback();
				e.printStackTrace();
				session.invalidate();
				 out.print("<script>alert('please enter right details')</script>");
				RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
				 rd.include(request, response);
				 
			}
		 }
	}
	}
	}


