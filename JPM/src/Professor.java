
public class Professor extends Person
{
	private String officeLocation;
	private String qualification;
	private String researchInterest;
	private Department department;

	public void endorseStudent(Student studentProfile)
	{
		return;
	}

	public String getOfficeLocation() 
	{
		return officeLocation;
	}

	public void setOfficeLocation(String officeLocation)
	{
		this.officeLocation = officeLocation;
	}

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
}
