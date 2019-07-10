package com.action;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.modal.Study;



public class Fileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Fileupload() {
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
		String filePath;
		Study s=new Study();
		Configuration cfg=new Configuration();
		cfg.configure();
		SessionFactory sf=cfg.buildSessionFactory();
		org.hibernate.Session session =sf.openSession();
		Transaction txn=session.beginTransaction();
		String UPLOAD_DIRECTORY="home";
		
		try {
				DiskFileItemFactory factory = new DiskFileItemFactory();
		
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		 
		ServletFileUpload upload = new ServletFileUpload(factory);		
			List<FileItem> formItems = upload.parseRequest(request);
			for(FileItem item:formItems )
			{	 
				
				
				filePath=item.getName();
				s.setState(0);
				s.setFaculty((String)se.getAttribute("Umail"));
				s.setPath(filePath);
				s.setSubject((String)se.getAttribute("subject"));
				session.save(s);
			    txn.commit();
			
			item.write(new File("/home/prem/eclipse-workspace/e-tutionFinal2/E-tutuion1(1)/WebContent/" 
						+item.getName()));
				System.out.println(filePath);
				   
				
				
				
				
			}
			
			RequestDispatcher rd=request.getRequestDispatcher("uploadData.jsp");
			PrintWriter p=response.getWriter();
			p.println("<script>alert('upload successfully')</script>");
			rd.include(request, response);
		} catch (Exception e) {
			RequestDispatcher rd=request.getRequestDispatcher("uploadData.jsp");
			PrintWriter p=response.getWriter();
			p.println("<script>alert('upload fail')</script>");
			rd.include(request, response);

			e.printStackTrace();
		}
		}
		
}
