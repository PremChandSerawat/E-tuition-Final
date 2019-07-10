package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.modal.Question;




public class AddQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddQuestion() {
        super();
        
    }

		public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

		public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sess=request.getSession(false);
		String faculty=((String)sess.getAttribute("Umail"));
		Configuration cfg=new Configuration();
		cfg.configure();
		SessionFactory sf=cfg.buildSessionFactory();
		Session session=sf.openSession();
		Transaction txn=session.beginTransaction();
		Question q=new Question();
		q.setQuestion(request.getParameter("question"));
		q.setOptionA(request.getParameter("optionA"));
		q.setOptionB(request.getParameter("optionB"));
		q.setOptionC(request.getParameter("optionC"));
		q.setOptionD(request.getParameter("optionD"));
		q.setRightAnswer(request.getParameter("rightAnswer"));
		q.setFaculty(faculty);
		q.setSubject((String)sess.getAttribute("subject"));
		try
		{
			session.save(q);
			txn.commit();
			System.out.println("question add successfully");
			PrintWriter p=response.getWriter();
			p.print("<script>alert('Question added successfully')</script>");
			RequestDispatcher rd=request.getRequestDispatcher("addQuestion.jsp");
			rd.include(request, response);
		}catch(Exception e)
		{
			txn.rollback();
			PrintWriter p=response.getWriter();
			e.printStackTrace();
			p.print("<script>alert('Question not add')</script>");
			System.out.println("question add unsuccessfully");
			RequestDispatcher rd=request.getRequestDispatcher("addQuestion.jsp");
			rd.include(request, response);

			
			
		}
	}

}
