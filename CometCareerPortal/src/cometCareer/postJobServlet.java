package cometCareer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		String query ="INSERT INTO job(title,description,visa_category,job_type,joining_requirement,pre_requsite,status,author_id,link) VALUES (?,?,?,?,?,?,?,?,?)";
		
		HttpSession session= request.getSession();
		Student stud = (Student)session.getAttribute("student"); 
		Professor prof = (Professor)session.getAttribute("professor");
		Company comp = (Company) session.getAttribute("company");
		Department dept = (Department) session.getAttribute("department");
		String role=(String) session.getAttribute("role");
		int id=0;
		
		System.out.println(role);
		if(role.equals("Student")) {
			id=stud.getID();
		} else if (role.equals("Professor")) {
			id=prof.getID();
		} else if (role.equals("Department")) {
			id=dept.getDepartmentID();
		} else {
			id=comp.getId();
		}
//Taking Parameters from JSP
		
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
				ps.setString(1, Title);
				ps.setString(2, Description);
				ps.setString(3, VisaCategory);
				ps.setString(4, JobType);
				ps.setString(5, Requirements);
				ps.setString(6, PreRequisites);
				ps.setString(7, Status);
				ps.setInt(8,id);
				ps.setString(9, JobLink);
				System.out.println(id);
				ps.executeUpdate();
				
				if(role.equals("Student")) {
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/studentHome.jsp");
					dispatch.forward(request, response);								
				} else if (role.equals("Professor")) {
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/professorHome.jsp");
					dispatch.forward(request, response);												
				} else if (role.equals("Company")) {
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/companyHome.jsp");
					dispatch.forward(request, response);																	
				} else {
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/departmentHome.jsp");
					dispatch.forward(request, response);																	
				}
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
