package cometClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public abstract class Person implements JobService
{
	private int ID;
	private String firstName;
	private String lastName;
	private String email;
	private String contactNumber;
	private String major;
	private String username;
	private String password;
	private String mailingAddress;
	private ProfileItem profile;
	
	public String getMailingAddress() {
		return mailingAddress;
	}

	public void setMailingAddress(String mailingAddress) {
		this.mailingAddress = mailingAddress;
	}
	
	public boolean updateInfo()
	{
		return true;
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

	public int getID()
	{
		return ID;
	}

	public void setID(int iD)
	{
		ID = iD;
	}

	public String getFirstName()
	{
		return firstName;
	}

	public void setFirstName(String firstName)
	{
		this.firstName = firstName;
	}

	public String getLastName()
	{
		return lastName;
	}

	public void setLastName(String lastName) 
	{
		this.lastName = lastName;
	}

	public String getEmail() 
	{
		return email;
	}

	public void setEmail(String email) 
	{
		this.email = email;
	}

	public String getContactNumber()
	{
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) 
	{
		this.contactNumber = contactNumber;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public ProfileItem getProfile() {
		return profile;
	}

	public void setProfile(ProfileItem profile) {
		this.profile = profile;
	}

}
