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

import com.modal.Faculty;
import com.modal.Student;

/**
 * Servlet implementation class Newpass
 */
public class Newpass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Newpass() {
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
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Uemail = request.getParameter("Uemail");
		String type = request.getParameter("type");
		Configuration cfg = new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf = cfg.buildSessionFactory();
		org.hibernate.Session ses = sf.openSession();
		Transaction txn = ses.beginTransaction();
		
		try
		{
		if (type.equals("Student"))
		   {
			String hql = "from Student where Umail=:Uemail";
			Query<Student> query = ses.createQuery(hql);
			query.setString("Uemail", Uemail);
			Student s = query.getSingleResult();
			System.out.println("gmail addresh are "+s.getUmail());
			
			System.out.println("txn commit");
			
			
			
			if (s!=null) {
				
				HttpSession session = request.getSession();
				session.setAttribute("Umail",Uemail);
				System.out.println(s.getUmail()+"   s.getUmail()");
				session.setAttribute("type",type);
				
				System.out.println("session attribute set");
				String recipient = request.getParameter("Uemail");
				RandomNumber r = new RandomNumber();

				r.genRandom();
				System.out.print("random number are generated are=" + r.getOtp());
				String otp = String.valueOf(r.getOtp());
				System.out.println("the otp is =" + otp);
				session.setAttribute("GeneratedOtp", otp);
				SendEmailOTP.sendEmailOtp(recipient, r.getOtp());
				RequestDispatcher rd = request.getRequestDispatcher("forgotOtp.jsp");
				rd.forward(request, response);
			} else {

				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
			txn.commit();
			ses.close();
		} else {

			String hql = "from Faculty where Umail=:Uemail";
			Query<Faculty> query = ses.createQuery(hql);
			Faculty s = query.getSingleResult();
			if (s!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("uemail",s.getUmail());
				session.setAttribute("type",type);
				
				String recipient = request.getParameter("Uemail");
				RandomNumber r = new RandomNumber();

				r.genRandom();
				System.out.print("random number are generated are=" + r.getOtp());
				String otp = String.valueOf(r.getOtp());
				System.out.println("the otp is =" + otp);
				session.setAttribute("GeneratedOtp", otp);
				SendEmailOTP.sendEmailOtp(recipient, r.getOtp());
				RequestDispatcher rd = request.getRequestDispatcher("forgotOtp.jsp");
				rd.forward(request, response);
			} else {

				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
			txn.commit();
			ses.close();

		}

	}catch(Exception e)
		{
		
		PrintWriter out=response.getWriter();
		out.print("<script>alert('this email id is not register')</script>");
		RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
		rd.include(request, response);
		e.printStackTrace();
		
		}	
	}

}
