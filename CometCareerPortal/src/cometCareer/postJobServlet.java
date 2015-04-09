package cometCareer;

import java.io.IOException;
import java.rmi.server.RMIClassLoader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cometClasses.Student;
import cometClasses.*;
@WebServlet(description = "Servlet for Posting a Job", urlPatterns = { "/postJobServlet" })
public class postJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static String username="root";
	protected static String password="1234Hjkl";
	protected static  String dbname="CometCareerPortal";
	protected static  String driver="com.mysql.jdbc.Driver";
	protected static  Connection con;
	protected static  ResultSet rs;
	protected static  String url="jdbc:mysql://localhost:3306/"+dbname;
       
    public postJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Random rd = new Random();
		String query ="INSERT INTO job(job_id,title,description,visa_category,job_type,joining_requirement,pre_requsite,status,author_id,link) VALUES (?,?,?,?,?,?,?,?,?,?)";
		HttpSession session= request.getSession();
		Student stud = (Student)session.getAttribute("student"); 
		
//Taking Parameters from JSP
		int jobId = rd.nextInt(15000);
		String Title = request.getParameter("Title");
		String Description = request.getParameter("Description");
		String VisaCategory = request.getParameter("VisaCategory");
		String JobType = request.getParameter("JobType");
		String Requirements = request.getParameter("Requirements");
		String PreRequisites = request.getParameter("PreRequisites");
		String JobLink = request.getParameter("JobLink");
		String Status = "P";
		
		
		getDBConnection(request, response);
		try {
				PreparedStatement ps=(PreparedStatement)con.prepareStatement(query);
				ps.setInt(1, jobId);
				ps.setString(2, Title);
				ps.setString(3, Description);
				ps.setString(4, VisaCategory);
				ps.setString(5, JobType);
				ps.setString(6, Requirements);
				ps.setString(7, PreRequisites);
				ps.setString(8, Status);
				ps.setInt(9,stud.getID());
				ps.setString(10, JobLink);
				
				ps.executeUpdate();
				
		} catch(SQLException e) {
			System.out.println("SQL Syntax Error..!!!");
			e.printStackTrace();			
		}						
	}
	public static void getDBConnection(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection(url,username,password);
			} catch (SQLException e) {
				System.out.println("Connection Error..!!!");
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				System.out.println("Driver Error..!!!");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}
