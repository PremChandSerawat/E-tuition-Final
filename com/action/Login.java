package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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



public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
       public Login() {
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
			PrintWriter p=response.getWriter();
		String uemail=request.getParameter("Uemail");
		String pass=request.getParameter("Password");
		String type=request.getParameter("type");
		Configuration cfg=new Configuration();
		    cfg.configure();
		 SessionFactory sf=cfg.buildSessionFactory();
		 org.hibernate.Session session=sf.openSession();
		 Transaction txn=session.beginTransaction();
		 try {
		 if(type.equals("Student"))
		 {
		 String hql ="FROM Student where Password=:password and Umail=:email";
		 Query<Student> query = session.createQuery(hql);
		 
		 query.setString("password",pass);
		 query.setString("email",uemail);
		 
		 Student s=(Student)query.getSingleResult();
		 String student=s.getName();
		 System.out.println("after list block");
		if(s.getState()==1)
		{
			System.out.println("s is null");
			 p.print("<script type='text/javascript'>alert('please contect to admin');</script>");
			 RequestDispatcher rd=request.getRequestDispatcher("etution.jsp");
			 rd.include(request, response);
		}
		 else if(s.getState()==0)
		 {   HttpSession ses=request.getSession();
		     ses.setAttribute("type","Student");
		     ses.setAttribute("Umail",uemail );
		     ses.setAttribute("Student", student);
			 System.out.println(s.getPassword());
			 System.out.println("student else if");
			 RequestDispatcher rd=request.getRequestDispatcher("student.jsp");
			 rd.include(request, response);
		 }
			 
		 
		 
	}else
	{
		 String hql ="FROM Faculty where Password=:password and Umail=:email";
		 Query<Faculty> query = session.createQuery(hql);
		 query.setString("password",pass);
		 query.setString("email",uemail);		 
		 Faculty s=query.getSingleResult();
		 System.out.println("after faculty list block");
		 if(s.getState()==1)
			{   HttpSession ses=request.getSession();
		     ses.setAttribute("Umail", uemail);
		     ses.setAttribute("type","Faculty");

				
				 p.print("<script>alert('please update your profile')</script>");
				 RequestDispatcher rd=request.getRequestDispatcher("fUpdate.jsp");
				 rd.include(request, response);
			}
			 else if(s.getState()==2||s.getState()==0)
			 {    HttpSession ses=request.getSession();
		     ses.setAttribute("Umail", uemail);
		     ses.setAttribute("type","Faculty");
		     ses.setAttribute("subject",s.getSubject());
		     
				 System.out.println(s.getPassword());
				 RequestDispatcher rd=request.getRequestDispatcher("faculty.jsp");
				 rd.include(request, response);
			 }
			 else {
				 
				 RequestDispatcher rd=request.getRequestDispatcher("etution.jsp");
				 rd.include(request, response);
			 }
		 }
		 }catch(Exception e) {
			 System.out.println("catch block");
			 e.printStackTrace();
			 p.print("<script>alert('please enter right email or password')</script>");
		RequestDispatcher rd=request.getRequestDispatcher("etution.jsp");
		 rd.include(request, response);
	}
		 

	}
}
