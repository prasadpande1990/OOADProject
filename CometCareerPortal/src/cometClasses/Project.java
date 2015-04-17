package cometClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class Project
{
	private int projectID;
	private String projectTitle;
	private String projectDescription;
	private String progLanguage; // programming language
	private String databaseUsed;
	private String projectDomain;
	private int teamSize;
	private String tools_frameworks;
	
	public void addNewProject(Project proj, String role,Connection con,int id2)
	{
		String query=null;
		int id=0;
		ResultSet rs;
		
		if(role.equals("Student")) {
			query="INSERT INTO STUDENT_PROJECTS(student_id,project_id) VALUES(?,?)";
		} 
		if(role.equals("Professor")) {
			query="INSERT INTO PROJECTS_PROFESSOR(professor_id,project_id) VALUES(?,?)";			
		}
		
//Database Insertion
		try {
			PreparedStatement ps=(PreparedStatement)con.prepareStatement("INSERT INTO PROJECTS(project_title,project_description,project_domain,prog_lang,database_used,team_size,tools) VALUES (?,?,?,?,?,?,?)"); 
				
			ps.setString(1,proj.getProjectTitle());
			ps.setString(2,proj.getProjectDescription());
			ps.setString(3,proj.getProjectDomain());
			ps.setString(4,proj.getProgLanguage());
			ps.setString(5,proj.getDatabaseUsed());
			ps.setInt(6,proj.getTeamSize());
			ps.setString(7,proj.getTools_frameworks());
			ps.executeUpdate();

			Statement stmt = (Statement) con.createStatement();
			rs= stmt.executeQuery("SELECT COALESCE(MAX(project_id),0) AS id FROM PROJECTS");	
			while(rs.next()) {
				id = rs.getInt("id");
			}
			ps=(PreparedStatement)con.prepareStatement(query);
			ps.setInt(1, id2);
			ps.setInt(2, id);
			ps.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println("SQL Syntax Error..!!!");
			e.printStackTrace();			
		}		
	}
	
	public boolean removeProject()
	{
		return true;
	}
	
	public boolean modifyProjectDetails()
	{
		return true;
	}

	public int getProjectID()
	{
		return projectID;
	}

	public void setProjectID(int projectID)
	{
		this.projectID = projectID;
	}

	public String getProjectTitle()
	{
		return projectTitle;
	}

	public void setProjectTitle(String projectTitle) 
	{
		this.projectTitle = projectTitle;
	}

	public String getProjectDescription() 
	{
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) 
	{
		this.projectDescription = projectDescription;
	}

	public String getProgLanguage() 
	{
		return progLanguage;
	}

	public void setProgLanguage(String progLanguage) 
	{
		this.progLanguage = progLanguage;
	}

	public String getDatabaseUsed() 
	{
		return databaseUsed;
	}

	public void setDatabaseUsed(String databaseUsed) 
	{
		this.databaseUsed = databaseUsed;
	}

	public String getProjectDomain() 
	{
		return projectDomain;
	}

	public void setProjectDomain(String projectDomain)
	{
		this.projectDomain = projectDomain;
	}

	public int getTeamSize() 
	{
		return teamSize;
	}

	public void setTeamSize(int teamSize) 
	{
		this.teamSize = teamSize;
	}

	public String getTools_frameworks() {
		return tools_frameworks;
	}

	public void setTools_frameworks(String tools_frameworks) {
		this.tools_frameworks = tools_frameworks;
	}
}
