package cometClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;


public class Department implements JobService
{
	private int departmentID;
	private String departmentName;
	private String username;
	private String password;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void removePost(ArrayList<Job> job, String [] post,Connection con)
	{
		String query="DELETE FROM JOB WHERE job_id=?";
		try {
			PreparedStatement ps = (PreparedStatement)con.prepareStatement(query);
			for (int i=0;i < post.length;i++) {
	            int job_id = job.get(Integer.parseInt((post[i]))).getJob_id();
	            ps.setInt(1, job_id);
	            ps.executeUpdate();
			}
		} catch(SQLException e) {
			System.out.println("SQL Syntax Error..!!!");
			e.printStackTrace();			
		}
	}
	
	public void reviewJobPost(ArrayList<Job> job, String [] post,Connection con)
	{
		String query="UPDATE JOB SET status='A' WHERE job_id=?";
		try{
			PreparedStatement ps = (PreparedStatement)con.prepareStatement(query);				
			for (int i=0;i < post.length;i++) {
	            int job_id = job.get(Integer.parseInt((post[i]))).getJob_id();
	            ps.setInt(1, job_id);
	            ps.executeUpdate();
			}
		} catch(SQLException e) {
			System.out.println("SQL Syntax Error..!!!");
			e.printStackTrace();			
		}
	}

	@Override
	public void postJob(Job job,Connection con,int id)
	{
		String query ="INSERT INTO job(title,description,visa_category,job_type,primary_requirement,secondary_requirement,additional_requirement,status,author_id,link) VALUES (?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps=(PreparedStatement)con.prepareStatement(query);
			ps.setString(1, job.getTitle());
			ps.setString(2, job.getDescription());
			ps.setString(3, job.getVisa_category());
			ps.setString(4, job.getJob_type());
			ps.setString(5, job.getPrimaryreq());
			ps.setString(6, job.getSecondaryreq());
			ps.setString(7, job.getAdditionalreq());
			ps.setString(8,"P");
			ps.setInt(9,id);
			ps.setString(10, job.getLink());
			
			ps.executeUpdate();
		} catch(SQLException e) {
			System.out.println("SQL Syntax Error..!!!");
			e.printStackTrace();			
		}						
	}

	@Override
	public void searchProfile()
	{
		return;
	}

	public int getDepartmentID() 
	{
		return departmentID;
	}

	public void setDepartmentID(int departmentID) 
	{
		this.departmentID = departmentID;
	}

	public String getDepartmentName()
	{
		return departmentName;
	}

	public void setDepartmentName(String departmentName)
	{
		this.departmentName = departmentName;
	}
}
