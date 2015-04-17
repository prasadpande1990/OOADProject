package cometClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class Professor extends Person
{

	private String qualification;
	private String researchInterest;
	private Department department;

	public String getQualification() 
	{
		return qualification;
	}

	public void setQualification(String qualification) 
	{
		this.qualification = qualification;
	}

	public String getResearchInterest()
	{
		return researchInterest;
	}

	public void setResearchInterest(String researchInterest)
	{
		this.researchInterest = researchInterest;
	}

	public Department getDepartment()
	{
		return department;
	}

	public void setDepartment(Department department)
	{
		this.department = department;
	}
	
	public Professor addNewProfessor(Professor prof, Connection con) {
		String query = "INSERT INTO professor(first_name,last_name,"
				+ "professor_qualification,research_interest,contact_number,email,office_address,username,password)"
				+ " values (?,?,?,?,?,?,?,?,?)";
		ResultSet rs;
		try {
				PreparedStatement ps=(PreparedStatement)con.prepareStatement(query); 
		
				ps.setString(1,prof.getFirstName());
				ps.setString(2, prof.getLastName());
				ps.setString(3,prof.getQualification());
				ps.setString(4,prof.getResearchInterest());
				ps.setString(5,prof.getContactNumber());
				ps.setString(6,prof.getEmail());
				ps.setString(7,prof.getMailingAddress());
				ps.setString(8,prof.getUsername());
				ps.setString(9,prof.getPassword());
				
				ps.executeUpdate();
	
				Statement stmt = (Statement) con.createStatement();
				rs= stmt.executeQuery("SELECT COALESCE(MAX(professor_id),0) AS id FROM PROFESSOR");	
				while(rs.next()) {
					prof.setID(rs.getInt(1));
				}
		} catch(SQLException e) {
			System.out.println("SQL Syntax Error..!!!");
			e.printStackTrace();			
		}		
		return prof;
	}
	
	public void updatePersonalInfo(Professor prof, Connection con) {
		String query  = "UPDATE PROFESSOR SET first_name=?,last_name=?,professor_qualification=?,research_interest=?,contact_number=?,email=?,office_address=? WHERE professor_id=?"; 
		try {
			PreparedStatement ps=(PreparedStatement)con.prepareStatement(query); 
			ps.setString(1,prof.getFirstName());
			ps.setString(2, prof.getLastName());
			ps.setString(3,prof.getQualification());
			ps.setString(4,prof.getResearchInterest());
			ps.setString(5,prof.getContactNumber());
			ps.setString(6,prof.getEmail());
			ps.setString(7,prof.getMailingAddress());
			ps.setInt(8, prof.getID());
			ps.executeUpdate();					
										
		} catch(SQLException e) {
			System.out.println("SQL Syntax Error..!!!");
			e.printStackTrace();			
		}						
	}
}