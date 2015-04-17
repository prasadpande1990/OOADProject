package cometClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class Skills
{
	private String skillName;
	private int yearsOfExp;
	private int proficiency; //proficiency is the rating out of 5
	
	public void addNewSkill(Skills skill,Connection con,int id2)
	{
		try {
			PreparedStatement ps=(PreparedStatement)con.prepareStatement("INSERT INTO SKILLS(skill,years_of_exp,proficiency,candidate_id) VALUES(?,?,?,?)"); 
			ps.setString(1,skill.getSkillName());
			ps.setInt(2,skill.getYearsOfExp());
			ps.setInt(3,skill.getProficiency());
			ps.setInt(4, id2);
			ps.executeUpdate();
		} catch(SQLException e) {
			System.out.println("SQL Syntax Error..!!!");
			e.printStackTrace();			
		}
	}
	
	public boolean removeSkill()
	{
		return true;
	}

	public String getSkillName() 
	{
		return skillName;
	}

	public void setSkillName(String skillName) 
	{
		this.skillName = skillName;
	}

	public int getYearsOfExp()
	{
		return yearsOfExp;
	}

	public void setYearsOfExp(int yearsOfExp) 
	{
		this.yearsOfExp = yearsOfExp;
	}

	public int getProficiency() 
	{
		return proficiency;
	}

	public void setProficiency(int proficiency) 
	{
		this.proficiency = proficiency;
	}
}
