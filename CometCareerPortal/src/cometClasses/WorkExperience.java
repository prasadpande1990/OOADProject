package cometClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class WorkExperience {

	private String Employer;
	private String Designation;
	private int yearsOfexp;

	public String getEmployer() {
		return Employer;
	}
	public void setEmployer(String employer) {
		Employer = employer;
	}
	public String getDesignation() {
		return Designation;
	}
	public void setDesignation(String designation) {
		Designation = designation;
	}
	public int getYearsOfexp() {
		return yearsOfexp;
	}
	public void setYearsOfexp(int yearsOfexp) {
		this.yearsOfexp = yearsOfexp;
	}	
	public void addNewWorkExperience(WorkExperience work, Connection con,String role, int id2) {
		
		try {
			PreparedStatement ps=(PreparedStatement)con.prepareStatement("INSERT INTO EMPLOYMENT_DETAILS(employer,years_of_exp,company_designation,student_id) VALUES(?,?,?,?)"); 
			ps.setString(1,work.getEmployer());
			ps.setInt(2,work.getYearsOfexp());
			ps.setString(3,work.getDesignation());
			ps.setInt(4, id2);
			ps.executeUpdate();
		} catch(SQLException e) {
			System.out.println("SQL Syntax Error..!!!");
			e.printStackTrace();			
		}		
	}
}
