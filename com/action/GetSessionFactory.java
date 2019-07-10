package com.action;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class GetSessionFactory {
	static SessionFactory sessionFactory;
	public static SessionFactory getSessionFactory()
	{   Configuration cfg=new Configuration();
	    cfg.configure();
	    SessionFactory sf=cfg.buildSessionFactory();
	    sessionFactory =sf;
		return sessionFactory;
	
	}

}
