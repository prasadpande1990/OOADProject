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
@WebServlet(description = "Servlet to Verify Successful Login Attempt", urlPatterns = { "/loginServlet" })
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static String username="root";
	protected static String password="1234Hjkl";
	protected static  String dbname="CometCareerPortal";
	protected static  String driver="com.mysql.jdbc.Driver";
	protected static  Connection con;
	protected static  ResultSet rs;
	protected static  String url="jdbc:mysql://localhost:3306/"+dbname;
       
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username1 = request.getParameter("username");
		String password1 = request.getParameter("password");
		String Category = request.getParameter("Category");
		getDBConnection(request, response);
		HttpSession session = request.getSession(true);
		int Status = 0;
		try {
			if(Category.equals("Student")) {
				PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT student_id,first_name,last_name,major,contact_number,email,mailing_address,StudentType,username,password FROM STUDENT WHERE username = ? AND password = ?");
				ps.setString(1, username1);
				ps.setString(2, password1);
				rs = ps.executeQuery();
				Student stud = new Student();
				while(rs.next()) {		
					stud.setFirstName(rs.getString("first_name"));
					stud.setLastName(rs.getString("last_name"));
					stud.setMajor(rs.getString("major"));
					stud.setContactNumber(rs.getString("contact_number"));
					stud.setEmail(rs.getString("email"));
					stud.setMailingAddress(rs.getString("mailing_address"));
					stud.setStudentType(rs.getString("StudentType"));
					stud.setUsername(rs.getString("username"));
					stud.setPassword(rs.getString("password"));
					stud.setID(rs.getInt("student_id"));
					session.setAttribute("student", stud);
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/studentHome.jsp");
					dispatch.forward(request, response);
				} 
			} else if(Category.equals("Department")) {
				PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT department_id,department_name,username,password FROM DEPARTMENT WHERE username = ? AND password = ?");
				ps.setString(1, username1);
				ps.setString(2, password1);
				rs = ps.executeQuery();
				Department dept = new Department();
				while(rs.next()) {		
					dept.setDepartmentName(rs.getNString("department_name"));
					dept.setUsername("username");
					dept.setPassword("password");
					
					session.setAttribute("department", dept);
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/departmentHome.jsp");
					dispatch.forward(request, response);					
				}
			} else if (Category.equals("Professor")) {
				PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT professor_id,first_name,last_name,professor_qualification,research_interest,contact_number,email,office_address FROM Professor WHERE username=? and password=?");
				ps.setString(1, username1);
				ps.setString(2, password1);
				rs = ps.executeQuery();
				Professor prof = new Professor();
				while(rs.next()) {		
					prof.setID(rs.getInt(1));
					prof.setFirstName(rs.getString(2));
					prof.setLastName(rs.getString(3));
					prof.setQualification(rs.getString(4));
					prof.setResearchInterest(rs.getString(5));
					prof.setContactNumber(rs.getString(6));
					prof.setEmail(rs.getString(7));
					prof.setMailingAddress(rs.getString(8));
					
					session.setAttribute("professor", prof);
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/professorHome.jsp");
					dispatch.forward(request, response);					
				}				
			} else {
				PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT company_id,name,description,location,website FROM COMPANY WHERE username=? and password=?");
				ps.setString(1, username1);
				ps.setString(2, password1);
				rs = ps.executeQuery();
				Company comp = new Company();
				while(rs.next()) {		
					comp.setId(rs.getInt(1));
					comp.setName(rs.getString(2));
					comp.setDescription(rs.getString(3));
					comp.setLocation(rs.getString(4));
					comp.setWebsite(rs.getString(5));
					
					session.setAttribute("company", comp);
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/companyHome.jsp");
					dispatch.forward(request, response);					
				}								
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
