package com.action;

import java.sql.Connection;
import java.sql.DriverManager;
	public class Database {
		private static String url="jdbc:mysql://localhost:3306/etuition";
		private static String username="root";
		private static String password="";
		
		public static Connection getdatabase() {
			Connection con=null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection(url,username,password);
			}
			catch(Exception e) {
				e.printStackTrace();
				
			}
			return con;
		}
	}