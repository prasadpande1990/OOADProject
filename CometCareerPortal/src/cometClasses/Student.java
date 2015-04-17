package cometClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Student extends Person
{
	private String studentType;
	protected static String username="root";
	protected static String password="1234Hjkl";
	protected static  String dbname="CometCareerPortal";
	protected static  String driver="com.mysql.jdbc.Driver";
	protected static  Connection con;
	protected static  ResultSet rs;
	protected static  String url="jdbc:mysql://localhost:3306/"+dbname;
	
	public void addNewStudent(Student stud,Connection con) {
		try {
			PreparedStatement ps=(PreparedStatement)con.prepareStatement("INSERT INTO student(first_name,last_name,major,contact_number,email,mailing_address,username,password,StudentType) values (?,?,?,?,?,?,?,?,?)"); 
			ps.setString(1,stud.getFirstName());
			ps.setString(2, stud.getLastName());
			ps.setString(3,stud.getMajor());
			ps.setString(4,stud.getContactNumber());
			ps.setString(5,stud.getEmail());
			ps.setString(6,stud.getMailingAddress());
			ps.setString(7,stud.getUsername());
			ps.setString(8,stud.getPassword());
			ps.setString(9,stud.getStudentType());
			ps.executeUpdate();
		} catch(SQLException e) {
			System.out.println("SQL Syntax Error..!!!");
			e.printStackTrace();			
		}		


	}

	public void searchJobs()
	{
		return;
	}

	public String getStudentType()
	{
		return studentType;
	}

	public void setStudentType(String studentType) 
	{
		this.studentType = studentType;
	}
	
	public void updatePersonalInfo(Student stud, Connection con) {
		String query  = "UPDATE STUDENT SET first_name=?,last_name=?,major=?,contact_number=?,email=?,mailing_address=?,StudentType=? WHERE student_id = ?";
		
		try {
			PreparedStatement ps=(PreparedStatement)con.prepareStatement(query); 
			ps.setString(1,stud.getFirstName());
			ps.setString(2, stud.getLastName());
			ps.setString(3,stud.getMajor());
			ps.setString(4,stud.getContactNumber());
			ps.setString(5,stud.getEmail());
			ps.setString(6,stud.getMailingAddress());
			ps.setString(7,stud.getStudentType());
			ps.setInt(8, stud.getID());
			ps.executeUpdate();								
							
	} catch(SQLException e) {
		System.out.println("SQL Syntax Error..!!!");
		e.printStackTrace();			
	}			

	}
}
