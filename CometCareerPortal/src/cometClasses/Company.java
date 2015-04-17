package cometClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class Company implements JobService
{
	private int id;
	private String name;
	private String description;
	private String location;
	private String website;
	private String username;
	private String password;

	
	public String getName() 
	{
		return name;
	}
	
	public void setName(String name) 
	{
		this.name = name;
	}
	
	public String getDescription() 
	{
		return description;
	}
	
	public void setDescription(String description) 
	{
		this.description = description;
	}
	
	public String getLocation()
	{
		return location;
	}
	
	public void setLocation(String location) 
	{
		this.location = location;
	}
	
	public String getWebsite() 
	{
		return website;
	}
	
	public void setWebsite(String website) 
	{
		this.website = website;
	}
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
	
	public Company addNewCompany(Company com,Connection con) {
		ResultSet rs;
		try {
				PreparedStatement ps=(PreparedStatement)con.prepareStatement("INSERT INTO company(name,description,location,website,username,password) values (?,?,?,?,?,?)"); 
				
				ps.setString(1,com.getName());
				ps.setString(2, com.getDescription());
				ps.setString(3, com.getLocation());
				ps.setString(4, com.getWebsite());
				ps.setString(5, com.getUsername());
				ps.setString(6, com.getPassword());
				
				ps.executeUpdate();
				
				Statement stmt = (Statement) con.createStatement();
				rs= stmt.executeQuery("SELECT COALESCE(MAX(company_id),0) AS id FROM COMPANY");	
				while(rs.next()) {
					com.setId(rs.getInt(1));
				}
	
		} catch(SQLException e) {
			System.out.println("SQL Syntax Error..!!!");
			e.printStackTrace();			
		}		
		return com;
	}

	@Override
	public void searchProfile() {
		// TODO Auto-generated method stub
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}	
}