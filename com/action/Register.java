package com.action;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import com.modal.Student;
import com.modal.Faculty;
import com.sun.istack.internal.logging.Logger;


public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

		public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

		public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

		public void destroy() {
		// TODO Auto-generated method stub
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String Name = request.getParameter("Name");
		String uemail = request.getParameter("Uemail");
		String cno = request.getParameter("number");
		String pass = request.getParameter("Password");
		String type = request.getParameter("type");
		String strDate = request.getParameter("DOB");
		System.out.println(strDate);
		// String sDate1="31/12/1998";
		HttpSession session=request.getSession();

		if (request.getParameter("type").equals("Student")) {
			session.setAttribute("type","Student");
			session.setAttribute("Name",Name);
			session.setAttribute("uemail", uemail);
			session.setAttribute("cno", cno);
			session.setAttribute("pass", pass);
			session.setAttribute("DOB",strDate);

		} else {
			session.setAttribute("type","Faculty");
			session.setAttribute("Name",Name);
			session.setAttribute("uemail", uemail);
			session.setAttribute("cno", cno);
			session.setAttribute("pass",pass);
			session.setAttribute("DOB",strDate);


		}

		String recipient = request.getParameter("Uemail");
		RandomNumber r = new RandomNumber();
		System.out.print("random number are generated are=");
		r.genRandom();
		String otp =String.valueOf(r.getOtp());
		System.out.println("the otp is =" + otp);
		session.setAttribute("GeneratedOtp",otp);
		SendEmailOTP.sendEmailOtp(recipient,r.getOtp());
		RequestDispatcher rd = request.getRequestDispatcher("otpCheck.jsp");
		rd.forward(request, response);
	}

}
