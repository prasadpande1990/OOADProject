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
				PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT first_name,last_name,major,contact_number,email,mailing_address,department_id,username,password FROM STUDENT WHERE username = ? AND password = ?");
				ps.setString(1, username1);
				ps.setString(2, password1);
				rs = ps.executeQuery();
				while(rs.next()) {		
					Student stud = new Student();
					stud.setFirstName(rs.getString("first_name"));
					stud.setLastName(rs.getString("last_name"));
					stud.setMajor(rs.getString("major"));
					stud.setContactNumber(rs.getString("contact_number"));
					stud.setEmail(rs.getString("email"));
					stud.setMailingAddress(rs.getString("mailing_address"));
					stud.setUsername(rs.getString("username"));
					stud.setPassword(rs.getString("password"));
					session.setAttribute("student", stud);
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/studentHome.jsp");
					dispatch.forward(request, response);
				} 
			} else if(Category.equals("Department")) {
				PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT department_id,department_name,username,password FROM DEPARTMENT WHERE username = ? AND password = ?");
				ps.setString(1, username1);
				ps.setString(2, password1);
				rs = ps.executeQuery();
				while(rs.next()) {		
					Department dept = new Department();
					
					dept.setDepartmentName(rs.getNString("department_name"));
					dept.setUsername("username");
					dept.setPassword("password");
					
					session.setAttribute("department", dept);
					RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/departmentHome.jsp");
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
