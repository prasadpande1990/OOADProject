
public abstract class Profile implements ProfileService
{
	private Project projectDetails;
	private WorkExperience workExpDetails;
	private Skills skillDetails;
	
	public Project getProjectDetails()
	{
		return projectDetails;
	}
	
	public void setProjectDetails(Project projectDetails)
	{
		this.projectDetails = projectDetails;
	}
	
	public WorkExperience getWorkExpDetails()
	{
		return workExpDetails;
	}
	
	public void setWorkExpDetails(WorkExperience workExpDetails)
	{
		this.workExpDetails = workExpDetails;
	}
	
	public Skills getSkillDetails()
	{
		return skillDetails;
	}
	
	public void setSkillDetails(Skills skillDetails)
	{
		this.skillDetails = skillDetails;
	}
	
	@Override
	public void editProfile()
	{
		return;
	}

	@Override
	public void displayProfile()
	{
		return;
	}
}
