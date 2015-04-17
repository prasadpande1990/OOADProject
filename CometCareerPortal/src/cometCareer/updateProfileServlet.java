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

import cometClasses.Professor;
import cometClasses.Student;

@WebServlet(description = "udpate the UserProfile", urlPatterns = { "/updateProfileServlet" })
public class updateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static String username="root";
	protected static String password="1234Hjkl";
	protected static  String dbname="CometCareerPortal";
	protected static  String driver="com.mysql.jdbc.Driver";
	protected static  Connection con;
	protected static  ResultSet rs;
	protected static  String url="jdbc:mysql://localhost:3306/"+dbname;	
       
    public updateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session= request.getSession();
		String role = (String)session.getAttribute("role");
		
		if(role.equals("Student")) {
			String firstName = request.getParameter("FirstName");
			String LastName = request.getParameter("LastName");
			String major = request.getParameter("Major");
			String studentType = request.getParameter("StudentType");
			String email = request.getParameter("email");
			String phone = request.getParameter("CellPhone");
			String mailingAddress = request.getParameter("Address");
			
			
			Student stud = (Student)session.getAttribute("student");
			stud.setFirstName(firstName);
			stud.setLastName(LastName);
			stud.setMajor(major);
			stud.setStudentType(studentType);
			stud.setEmail(email);
			stud.setContactNumber(phone);
			stud.setMailingAddress(mailingAddress);
						
//Database Insertion
			getDBConnection(request,response);
			stud.updatePersonalInfo(stud, con);
			
			session.setAttribute("student", stud);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/updateProfile.jsp");
			dispatch.forward(request, response);

		} else {

			String firstName = request.getParameter("prof_FirstName");
			String LastName = request.getParameter("prof_LastName");
			String qualification = request.getParameter("qualification");
			String researchInterest = request.getParameter("researchInterest");
			String prof_EmailAddress = request.getParameter("prof_EmailAddress");
			String prof_CellPhone = request.getParameter("prof_CellPhone");
			String prof_officeAddress = request.getParameter("prof_officeAddress");
			
			
			Professor prof = (Professor)session.getAttribute("professor");
			prof.setFirstName(firstName);
			prof.setLastName(LastName);
			prof.setQualification(qualification);
			prof.setResearchInterest(researchInterest);
			prof.setContactNumber(prof_CellPhone);
			prof.setEmail(prof_EmailAddress);
			prof.setMailingAddress(prof_officeAddress); 
			
//Database Insertion
			getDBConnection(request,response);
			prof.updatePersonalInfo(prof, con);
			session.setAttribute("professor", prof);
			RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/updateProfile.jsp");
			dispatch.forward(request, response);
			
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
